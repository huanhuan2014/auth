<?php

namespace Auth\Controller;


use Common\Common\AjaxPage;

class AuthCompanyController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthCompany");
    }

    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $code = $this->getParam('search_code');
        $name = $this->getParam('search_name');
        $condition = array();
        if(!empty($code)){
            $condition['search_code'] = array('like','%'.$code.'%');
            $this->assign('search_code',$code);
        }
        if(!empty($name)){
            $condition['name'] = array('like','%'.$name.'%');
            $this->assign('search_name',$name);
        }

        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display(); // 输出模板
    }

    public function ajax_company_search(){
        $companyCode = $this->getParam('company_code');
        $companyName = $this->getParam('company_name');
        $condition = array();
        if(!empty($companyCode)){
            $condition['code'] = array('like','%'.$companyCode.'%');
            $this->assign('company_code', $companyCode);
        }
        if(!empty($companyName)){
            $condition['name'] = array('like', '%'.$companyName.'%');
            $this->assign('company_name', $companyName);
        }
        $count = $this->model->where($condition)->count();
        $page = new AjaxPage($count,$this->pageSize,'ajax_org_search');
        $show = $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->select();//$this->ajaxReturn(0, $this->model-)
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $html = $this->fetch('search-info');
        $this->ajaxReturn(1,$html,'');
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['id_code'] = $this->getParam('id_code');

        $data['address'] = $this->getParam('address');
        $data['zip_code'] = $this->getParam('zip_code');
        $data['telephone'] = $this->getParam('telephone');
        $data['mobile_phone'] = $this->getParam('mobile_phone');

        $data['email'] = $this->getParam('email');
        $data['QQ'] = $this->getParam('QQ');
        $data['weixin'] = $this->getParam('weixin');
        $data['web_url'] = $this->getParam('web_url');

        $data['corporation'] = $this->getParam('corporation');
        $data['industry'] = $this->getParam('industry');//行业
        //$data['registered_capital'] = $this->getParam('registered_capital');
        //$data['web_url'] = $this->getParam('web_url');

        if(empty($data["id"])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }
}