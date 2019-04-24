<?php

namespace Auth\Controller;

//数字行权限(大于小于等于不等于等)
class AuthRoleMenuRuleController extends CommonController{
    //规则部门类型，1自己，2本部门，3子部门，4本部门及子部门，5所有部门，6自定义部门
    private $ORT_TYPE_1 =1, $ORT_TYPE_2 =2, $ORT_TYPE_3 =4, $ORT_TYPE_4 =4, $ORT_TYPE_5 =5, $ORT_TYPE_6 =6;
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthRoleMenuRule");
    }

    public function index(){
        parent::getAuthButton();
        $menuCode = $this->getParam('search_menu_code');
        $menuList = $this->_getMenuList();
        if(empty($menuCode)){
            $menuCode = $menuList[0]['code'];
            $this->assign('search_menu_code', $menuCode);
        }
        $condition = array();
        $condition['menu_code'] = $menuCode;
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;

        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('menuList', $menuList);
        $this->display();
    }

    public function addView(){
        $menuList = $this->_getMenuList();
        $this->assign('menuList', $menuList);
        $roleList = $this->_getRoleList();
        $this->assign('roleList', $roleList);
        parent::addView();
    }

    public function editView(){
        $menuList = $this->_getMenuList();
        $this->assign('menuList', $menuList);
        $roleList = $this->_getRoleList();
        $this->assign('roleList', $roleList);
        parent::editView();
    }

    public function ajax_save(){
        $param = array();

        $param['menu_code'] = $this->getParam('menu_code', true);
        $param['column_code'] = $this->getParam('column_code', true);
        $param['column_name'] = $this->getParam('column_name', true);
        $param['rule'] = $this->getParam('rule', true);

        $param['value'] = $this->getParam('value');
        $param['role_code'] = $this->getParam('role_code', true);
        $param['id'] = $this->getParam('id');
        $param['org_type'] = $this->getParam('org_type');

        $param['app_code'] = $this->appCode;
        $param['company_code'] = $this->companyCode;
        $param['opt_user'] = $this->userCode;
        $param['opt_user_name'] = $this->userName;

        if(!empty($param['org_type'])) {
            //自己数据，本部门，子部门，本部门+子部门 条件获取
            $param['value'] = $this->_getOrgRuleValue($param['org_type']);
        }else{
            //非部门规则值必须填写
            if(empty($param['value'])){
                $this->ajaxReturn(0, '', 'param value is empty');
            }
        }
        if(empty($param['id'])){
            $this->add($param);
        }else{
            $this->edit($param);
        }
    }

    protected function add($data){
        $addResult = $this->model->add($data);
        if(!$addResult){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功！");
        }
    }

    protected function edit($data){
        $editResult = $this->model->save($data);
        if($editResult==0){
            $this->ajaxReturn(0,'',"无数据更新");
        }else if($editResult===false){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功");
        }
    }

    private function _getOrgRuleValue($orgType){
        $result = '';
        $authOrgDao = D('Auth/AuthOrganization');
        switch ($orgType){
            case $this->ORT_TYPE_1 : $result = $this->userCode;
                break;
            case $this->ORT_TYPE_2 : $result = $this->orgCodes;
                break;
            case $this->ORT_TYPE_3 :
                $sonOrgCodes = $authOrgDao->getSonOrgCodes($this->appCode, $this->companyCode, $this->orgCodes);
                $result = $sonOrgCodes;
                break;
            case $this->ORT_TYPE_4 :
                $sonOrgCodes = $authOrgDao->getSonOrgCodes($this->appCode, $this->companyCode, $this->orgCodes);
                $orgCodes = array_merge($this->orgCodes, $sonOrgCodes);
                $orgCodes = array_values(array_unique($orgCodes));
                $result = $orgCodes;
                break;
            case $this->ORT_TYPE_5 :
                break;
            case $this->ORT_TYPE_6 :
                $result = $this->getParam('value');
                break;
        }
        return $result;
    }

    private function _formatList($list){
        if(empty($list)){
            return $list;
        }
        $menuList = $this->_getMenuList();
        $roleList = $this->_getRoleList();
        foreach($list as &$item){
            foreach($menuList as $menu){
                if($item['menu_code'] == $menu['code']){
                    $item['menu_name'] = $menu['name'];
                    break;
                }
            }
            if($item['org_type'] == 0){
                $item['rule_name'] = $this->_getRuleName($item['rule']);
            }else{
                $item['rule_name'] = $this->_getOrgRuleName($item['org_type']);
            }
            foreach($roleList as $role){
                if($item['role_code'] == $role['code']){
                    $item['role_name'] = $role['name'];
                    break;
                }
            }
        }
        return $list;
    }

    private function _getRuleName($rule){
        $result = '';
        switch ($rule){
            case "EQ" : $result = '等于';
                break;
            case "NEQ" : $result = '不等于';
                break;
            case "GT" : $result = '大于';
                break;
            case "EGT" : $result = '大于等于';
                break;
            case "LT" : $result = '小于';
                break;
            case "ELT" : $result = '小于等于';
                break;
            case "LIKE" : $result = 'LIKE';
                break;
            case "NOT LIKE" : $result = 'NOT LIKE';
                break;
            case "BETWEEN" : $result = 'BETWEEN';
                break;
            case "NOT BETWEEN" : $result = 'NOT BETWEEN';
                break;
            case "IN" : $result = 'IN';
                break;
            case "NOT IN" : $result = 'NOT IN';
                break;
            case "EXP" : $result = '自定义';
                break;
        }
        return $result;
    }

    private function _getOrgRuleName($orgRule){
        $result = '';
        switch ($orgRule){
            case $this->ORT_TYPE_1 : $result = '自己数据';
                break;
            case $this->ORT_TYPE_2 : $result = '本部门';
                break;
            case $this->ORT_TYPE_3 : $result = '子部门';
                break;
            case $this->ORT_TYPE_4 : $result = '本部门+子部门';
                break;
            case $this->ORT_TYPE_5 : $result = '全部';
                break;
            case $this->ORT_TYPE_6 : $result = '自定义';
                break;
       }
        return $result;
    }

    private function _getMenuList(){
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->where(array('in_row_rule'=>1, 'status'=>1))->select();
        return $menuList;
    }

    private function _getRoleList(){
        $roleDao = D('Auth/AuthRole');
        $list = $roleDao->where(array('status'=>1))->select();
        return $list;
    }
}