<?php
/**
 * Created by PhpStorm.
 * User: sqluogui
 * Date: 2018/4/8
 * Time: 15:16
 */

namespace Auth\Controller;


class AuthSysDataController extends CommonController{

    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthSysData");
    }

    public function index(){
        parent::getAuthButton();
        $code = $this->getParam('search_code');
        $name = $this->getParam('search_name');
        $typeCode = $this->getParam('search_type_code');
        $condition = array();
        if(!empty($code)){
            $condition['code'] = array('like','%'.$code.'%');
            $this->assign('search_code',$code);
        }
        if(!empty($name)){
            $condition['name'] =  array('like', '%'.$name.'%');
            $this->assign('search_name',$name);
        }
        if(!empty($typeCode)){
            $condition['type_code'] = $typeCode;
            $this->assign('search_type_code', $typeCode);
        }
        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $typeList = $this->_getTypeList();
        $this->assign('typeList', $typeList);
        $this->display();
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['name'] = $this->getParam('name', true);
        $data['code'] = $this->getParam('code',true);
        $data['remark'] = $this->getParam('remark');

        $data['type_code'] = $this->getParam('type_code', true);
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['app_code'] = $this->appCode;

        if(empty($data['id'])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function addView(){
        $typeList = $this->_getTypeList();
        $this->assign('typeList', $typeList);
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
        $typeList = $this->_getTypeList();
        $this->assign('typeList', $typeList);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    //获取数据字典类别
    private function _getTypeList(){
        $sysDataTypeDao = D('Auth/AuthSysDataType');
        $list = $sysDataTypeDao->where(array('status'=>1))->select();
        return $list;
    }

    private function _formatList($list){
        $typeList = $this->_getTypeList();
        foreach($list as &$item){
            foreach($typeList as $type){
                if($type['code'] == $item['type_code']){
                    $item['type'] = $type;
                    break;
                }
            }
        }
        return $list;
    }
}