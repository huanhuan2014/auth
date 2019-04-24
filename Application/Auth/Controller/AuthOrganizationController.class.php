<?php
namespace Auth\Controller;
use Think\Controller;
use Common\Common\AjaxPage;
class AuthOrganizationController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D('Auth/AuthOrganization');
    }
    //组织架构管理
    public function index(){
        parent::getAuthButton();
        $parentCode = $this->getParam('parent_code');
        $list = $this->model->getAllOrganization();
        if(empty($parentCode)){
            foreach($list as $item){
                if($item['parent_code'] == ''){
                    $parentCode = $item['code'];
                    break;
                }
            }
        }
        $childList = array();
        foreach($list as $item){
            if($item['parent_code'] == $parentCode){
                $childList[] = $item;
            }
        }
        $this->assign('list', json_encode($list));
        $this->assign('childList', $childList);
        $this->assign('parent_code', $parentCode);
        $this->display();
    }

    public function addView(){
        $parentCode = $this->getParam('parent_code');
        if(!empty($parentCode)){
            $parentOrganization = $this->model->getOrganizationByCode($parentCode);
            $this->assign('parentOrg',$parentOrganization);
        }
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function editView(){
        $id = $this->getParam('id', true);
        $data = $this->model->where(array('id'=>$id))->find();
        $parentCode = $data['parent_code'];
        if(!empty($parentCode)){
            $parentOrganization = $this->model->getOrganizationByCode($parentCode);
            $this->assign('parentOrg',$parentOrganization);
        }
        if(!empty($data['leader'])){
            $userDao = D('Auth/AuthUser');
            $userInfo = $userDao->where(array('code'=>$data['leader']))->find();
            $this->assign('leader', $userInfo);
        }
        $this->assign("data",$data);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['parent_code'] = $this->getParam('parent_code');

        $data['leader'] = $this->getParam('leader', true);

        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['app_code'] = $this->appCode;
        $data['company_code'] = $this->companyCode;

        if(empty($data['id'])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
        $this->ajaxReturn(1,'','保存成功');
    }

    public function ajax_org_search(){
        $orgCode = $this->getParam('org_code');
        $orgName = $this->getParam('org_name');
        $condition = array();
        if(!empty($orgCode)){
            $condition['code'] = array('like','%'.$orgCode.'%');
            $this->assign('org_code', $orgCode);
        }
        if(!empty($orgName)){
            $condition['name'] = array('like', '%'.$orgName.'%');
            $this->assign('org_name', $orgName);
        }
        $count = $this->model->where($condition)->count();
        $page = new AjaxPage($count,$this->pageSize,'ajax_org_search');
        $show = $page->show();
        $list = $this->model->alias('o')->join('left join auth_user u on o.leader = u.code')->limit($page->firstRow.','.$page->listRows)
        ->where($condition)->field('o.*,u.name as user_name')->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $html = $this->fetch('search-info');
        $this->ajaxReturn(1,$html,'');
    }
    
}