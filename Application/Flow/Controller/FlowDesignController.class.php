<?php
namespace  Flow\Controller;
use Auth\Controller\CommonController;
use Think\Controller;

class FlowDesignController extends CommonController{
    public function index(){
        $id = $this->getParam('id', true);
        if(empty($id) || !is_numeric($id)){
            $this->error('error param id');
        }
        $processDao = D('Flow/FlowProcess');
        $processInfo = $processDao->where(array('id'=>$id))->find();
        $design = "{}";
        if(!empty($processInfo['design'])){
            $design = htmlspecialchars_decode($processInfo['design']);
        }
        $this->assign('design', $design);
        $this->assign('process', $processInfo);
        $this->display();
    }

    public function ajax_save(){
        $processCode = $this->getParam('process_code', true);
        $draft = $this->getParam('draft');
        $json = $this->getParam('json', true);
        $processDao = D('Flow/FlowProcess');
        if(empty($draft)){
            $draft = 0;
        }
        $result = $processDao->where(array('code'=>$processCode))->save(array('design'=>$json, 'draft'=>$draft));
        if($result === false){
            $this->ajaxReturn(0,'',"保存失败！");
        }else if($result==0){
            $this->ajaxReturn(0,'',"无数据更新！");
        }else{
            $this->_refreshNodeIndex($processCode, $json);
            $this->ajaxReturn(0,'',"保存成功");
        }
    }

    //流程图调整后刷新节点顺序
    private function _refreshNodeIndex($processCode, $designJson){
        $stepDao = D('Flow/FlowStep');
        $json = htmlspecialchars_decode($designJson);
        $design = json_decode($json, true);
        $condition = array();
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $condition['process_code'] = $processCode;
        $stepList = $stepDao->where($condition)->select();

        //删除的步骤
        $delStepIds = array();
        foreach($stepList as $step){
            $nodeIndex = $this->_getNodeIndex($design, $step['step']);
            if($nodeIndex == 0){
                $delStepIds[] = $step['id'];
            }
            $stepDao->where(array('id'=>$step['id']))->save(array('step'=>$nodeIndex));
        }
        if(!empty($delStepIds)){
            $stepDao->where(array('id'=>array('in', $delStepIds)))->delete();
        }
    }

    //获取节点index
    private function _getNodeIndex($design,$nodeKey, $index){
        if(empty($index)){
            $index = 0;
        }
        $linkDataArray = $design['linkDataArray'];
        $nodeDataArray = $design['nodeDataArray'];
        foreach($linkDataArray as $link){
            if($link['to'] != $nodeKey){
                continue;
            }
            //开始节点不参与累加
            foreach($nodeDataArray as $node){
                if($node['key'] == $link['formKey'] && $node['category'] == "Start"){
                    return $index;
                }
            }
            $index ++;
            $this->getNodeIndex($design, $link['formKey'], $index);
        }
        return $index;
    }

    //检测设计的流程是否所有步骤都有审批人
    private function _checkDesign(){}

    public function ajax_delete(){
        $processCode = $this->getParam('process_code');
        $nodeKey = $this->getParam('node_key');
        $stepDao = D('Flow/FlowStep');
        $condition = array();
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $condition['process_code'] = $processCode;
        $condition['node_key'] = $nodeKey;
        $delResult = $stepDao->where($condition)->delete();
        if(empty($delResult)){
            $this->ajaxReturn(0, '', '删除失败');
        }
        $this->ajaxReturn(0, '', '删除成功');
    }
}