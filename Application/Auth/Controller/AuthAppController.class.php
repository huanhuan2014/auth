<?php

namespace Auth\Controller;

class AuthAppController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D('Auth/AuthApp');
    }

    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $list = $this->model->select();
        $this->assign('list',$list);// 赋值数据集
        $this->display(); // 输出模板
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['ip'] = $this->getParam('ip', true);

        $data['url'] = $this->getParam('url', true);
        $data['remark'] = $this->getParam('remark');
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;

        $data['status'] = $this->getParam('status',false);

        if(!filter_var($data['ip'], FILTER_VALIDATE_IP)){
            $this->ajaxReturn(0,'', 'IP['.$data['ip'].']格式错误！');
        }

        if(empty($data['id'])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }
}