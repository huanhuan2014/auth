<?php

namespace Api\Controller;


class ApiAuthController extends ApiBaseController{
    public function getMenu(){
        $menuCategoryDao = D('Auth/AuthMenuCategory');
        $menuCategoryList = $menuCategoryDao->getCategoryMenuByCode($this->roleCodes, $this->appCode, $this->companyCode);
        $jsonData = json_encode($menuCategoryList);
        ajaxReturn(1, $jsonData);
    }

    public function getButtonHtml(){
        $controller = $this->getParam('controller', true);
        $authButtonDao = D('Auth/AuthButton');
        $buttonList = $authButtonDao->getButtonByControlRole($controller,$this->roleCodes, $this->appCode, $this->companyCode);
        $jsonData = json_encode($buttonList);
        ajaxReturn(1, $jsonData);
    }

    //验证权限
    public function checkAuth(){
        $controller = $this->getParam('controller', true);
        $method = $this->getParam('method', true);

        //获取菜单编号
        $menuDao = D('Auth/AuthMenu');
        $menuCode = $menuDao->where(array('controller'=>$controller, 'app_code'=>$this->appCode))->getField('code');

        //判断权限,controller,method 权限判断
        $roleMenuMethodDao = D('Auth/AuthRoleMenuMethod');
        $condition = array();
        $condition['role_code'] = array('in', $this->roleCodes);
        $condition['menu_code'] = $menuCode;
        $condition['method_code'] = $method;
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $count = $roleMenuMethodDao->where($condition)->count();
        if(empty($count) || $count<=0){
            ajaxReturn(0, '', 'no auth');
        }
        ajaxReturn(1, '');
    }

    //获取数据字典
    public function getSysData(){
        $type = $this->getParam('type'. true);
        $sysDataDao = D('Auth/SysData');
        $condition = array();
        $condition['type_code'] = $type;
        $condition['role_code'] = array('in', $this->roleCodes);
        $condition['app_code'] = $this->appCode;
        $data = $sysDataDao->where($condition)->select();
        $jsonData = json_encode($data);
        ajaxReturn(1, $jsonData);
    }

    //获取组织架构
    public function getOrg(){
        $orgCode = $this->getParam('org_code');
        $orgName = $this->getParam('org_name');
        $condition = array();
        $condition['code'] = array('like', '%'.$orgCode.'%');
        $condition['name'] = array('like', '%'.$orgName.'%');
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $condition['status'] = 1;
        $organizationDao = D('Auth/AuthOrganization');
        $orgList = $organizationDao->where($condition)->select();
        $jsonData = json_encode($orgList);
        ajaxReturn(1, $jsonData);
    }
    //获取用户
    public function getUser(){
        $userCode = $this->getParam('user_code');
        $userName = $this->getParam('user_name');
        $condition = array();
        if(!empty($userCode)){
            $condition['code'] = array('like', '%'.$userCode.'%');
        }
        if(!empty($userName)){
            $condition['name'] = array('like', '%'.$userName.'%');
        }
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $condition['status'] = 1;
        $userDao = D('Auth/AuthUser');
        $data = $userDao->where($condition)->select();
        $jsonData = json_encode($data);
        ajaxReturn(1, $jsonData);
    }
}