<?php

namespace Auth\Controller;

use Common\Controller\AuthController;

class CommonController extends AuthController{
    protected $model;
    protected $pageSize = 15;

    //权限验证
    public function _initialize(){
        parent::_initialize();
    }

    //ajax 返回数据，$code 编号正确为1，错误未0，$data
    //返回json串
    public function ajaxReturn($code,$data,$msg=""){
        $return = array();
        $return["code"] = $code;
        $return["msg"] = $msg;
        $return["data"] = $data;
        echo json_encode($return);
        exit;
    }

    /**
     * 获取用户拥有权限按钮的html
    */
    protected function getAuthButton(){
        $controller = CONTROLLER_NAME;
        $authButtonDao = D('Auth/AuthButton');
        $buttonList = $authButtonDao->getButtonByControlRole($controller,$this->roleCodes, $this->appCode, $this->companyCode);
        $this->assign("buttonList",$buttonList);
    }

    //根据角色获取有权限的列
    protected function getColumns(){
        $roleMenuColumnDao = D('Auth/AuthRoleMenuColumn');
        $roleMenuColumnList = $roleMenuColumnDao->getDataByRoleMenu($this->roleCodes, $this->menuCode, $this->appCode, $this->companyCode);
        $this->assign('roleMenuColumnList', $roleMenuColumnList);
    }
    
    /**
     * 获取参数
     * @param $key string 获取参数的key值
     * @param $must boolean 是否是必须的 默认非必须
     * @return array
    */
    protected function getParam($key,$must=false){
        $param = I('param.'.$key);
        if($must && empty($param)){
            if(IS_AJAX){
                $this->ajaxReturn(0, '', 'param '.$key.' is empty');
            }else{
                $this->error( 'param '.$key.' is empty');
            }
        }else{
            return $param;
        }
    }

    public function addView(){
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function editView(){
        $id = $this->getParam("id");
        if(empty($id)){
            $this->ajaxReturn(0,'',"id参数不能为空");
        }
        $data = $this->model->where(array("id"=>$id))->find();
        $this->assign("data",$data);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    protected function add($data,$where=array()){
        $condition = array("code"=>$data["code"]);
        if(!empty($where)){
            $condition = array_merge($condition,$where);
        }
        if($this->model->where($condition)->count()>0){
            $this->ajaxReturn(0,'',"编号重复！");
        }
        $condition = array("name"=>$data["name"]);
        if(!empty($where)){
            $condition = array_merge($condition,$where);
        }
        if($this->model->where($condition)->count()>0){
            $this->ajaxReturn(0,'',"名称重复！");
        }
        $addResult = $this->model->add($data);
        if(!$addResult){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功！");
        }
    }

    protected function edit($data, $where=array()){
        $condition = array();
        $condition["id"] = array("neq"=>$data["id"]);
        $condition["code"] = $data["code"];
        if(!empty($where)){
            $condition = array_merge($condition,$where);
        }
        if($this->model->where($condition)->count()>0){
            $this->ajaxReturn(0,'',"编号重复！");
        }
        unset($condition["code"]);
        $condition["name"] = $data["name"];
        if($this->model->where($condition)->count()>0){
            $this->ajaxReturn(0,'',"名称重复！");
        }
        $editResult = $this->model->save($data);
        if($editResult==0){
            $this->ajaxReturn(0,'',"无数据更新");
        }else if($editResult===false){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功");
        }
    }

    public function del(){
        $ids = I("ids");
        $condition = array();
        $condition["id"] = array("in",$ids);
        $delResult = $this->model->where($condition)->delete();
        if($delResult===false){
            $this->ajaxReturn(0,'',"删除失败！");
        }else{
            $this->ajaxReturn(1,'',"删除成功");
        }
    }
}