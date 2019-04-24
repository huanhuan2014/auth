<?php
namespace Auth\Controller;
use Think\Controller;
class AuthButtonController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthButton");
    }
    
    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $list = $this->model->order('sort desc')->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);
        $this->display();
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['icon'] = $this->getParam('icon', true);

        $data['status'] = $this->getParam('status');
        $data['sort'] = $this->getParam('sort');
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;

        if(empty($data["id"])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function _formatList($list){
        if(empty($list)){
            return $list;
        }
        foreach($list as &$item){
            $item['status'] = $item['status'] == 1 ? '启用' : '停用';
            $item['icon'] = '<span class=\''.$item['icon'].'\'>'.'</span>';
        }
        return $list;
    }
}