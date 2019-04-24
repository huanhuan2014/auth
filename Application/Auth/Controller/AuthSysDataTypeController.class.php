<?php

namespace Auth\Controller;

class AuthSysDataTypeController extends CommonController{
    private $detailModel ;

    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthSysDataType");
        $this->detailModel = D("Auth/AuthSysData");
    }

    public function index(){
        parent::getAuthButton();
        $code = $this->getParam('search_code');
        $name = $this->getParam('search_name');
        $condition = array();
        if(!empty($code)){
            $condition['code'] = array('like','%'.$code.'%');
            $this->assign('search_code',$code);
        }
        if(!empty($name)){
            $condition['name'] =  array('like', '%'.$name.'%');
            $this->assign('search_name',$name);
        }
        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display();
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['name'] = $this->getParam('name', true);
        $data['code'] = $this->getParam('code', true);
        $data['remark'] = $this->getParam('remark');

        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['app_code'] = $this->appCode;

        if(empty($data['id'])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function ajax_get_detail(){
        $type = $this->getParam('type', true);
        $list = $this->detailModel->where(array('type'=>$type))->select();
        $json = json_encode($list);
        $this->ajaxReturn(1, $json);
    }
}