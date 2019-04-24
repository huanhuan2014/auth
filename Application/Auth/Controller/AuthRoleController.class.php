<?php
namespace Auth\Controller;
use Think\Controller;
class AuthRoleController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthRole");
    }
    
    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $list = $this->model->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);
        $this->display();
    }

    public function save(){
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['status'] = $this->getParam('status', true);
        $data['remark'] = $this->getParam('remark');

        $data['id'] = $this->getParam('id');
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['company_code'] = $this->companyCode;

        $data['app_code'] = $this->appCode;

        if(empty($data["id"])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function ajax_role_search(){
        $list = $this->model->select();
        $this->assign('list',$list);
        $html = $this->fetch('search-info');
        $this->ajaxReturn(1,$html,'');
    }

    private function _formatList($list){
        if(empty($list)){
            return $list;
        }
        foreach($list as &$item){
            $item['status'] = $item['status'] == 1 ? '正常' : '停用';
        }
        return $list;
    }
}