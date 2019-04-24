<?php
/**
 * 角色，菜单，方法
 */

namespace Auth\Controller;


class AuthRoleMenuMethodController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthRoleMenuMethod");
    }

    public function index(){
        $menuCategoryCode = $this->getParam('category');
        $roleCode = $this->getParam('role');
        $roleDao = D('Auth/AuthRole');
        $roleList = $roleDao->getAllRole($this->appCode, $this->companyCode);
        $menuCategoryDao = D("Auth/AuthMenuCategory");
        $menuCategoryList = $menuCategoryDao->getAllMenuCategory($this->appCode);
        //默认获取第一个类别
        if(empty($menuCategoryCode) && !empty($menuCategoryList)){
            $menuCategoryCode = $menuCategoryList[0]['code'];
        }
        //默认第一个角色
        if(empty($roleCode) && !empty($roleList)){
            $roleCode = $roleList[0]['code'];
        }
        //获取已存在的菜单方法关系
        $menuMethodDao = D('Auth/AuthMenuMethod');
        $categoryMenuMethod = $menuMethodDao->getCategoryMenuMethod($menuCategoryCode, $this->appCode);
        //角色菜单，按钮关系
        $condition = array();
        $condition['role_code'] = $roleCode;
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $roleMenuMethodList= $this->model->where($condition)->select();

        $this->assign('category_code',$menuCategoryCode);
        $this->assign('roleList',$roleList);
        $this->assign('role_code',$roleCode);
        $this->assign("menuCategory",$categoryMenuMethod);
        $this->assign("menuCategoryList",$menuCategoryList);
        $this->assign("roleMenuMethodList",$roleMenuMethodList);//var_dump($categoryMenuMethod['menus']);
        $this->display();
    }

    public function ajax_save(){
        $roleCode = $this->getParam('role_code');
        $menuCodes = $this->getParam('menu_codes');
        $menuMethods = $this->getParam('menu_method');
        $dataList = array();
        foreach($menuMethods as $menuMethod){
            $data = array();

            $data['role_code'] = $roleCode;
            $data['menu_code'] = $menuMethod['menu_code'];
            $data['method_code'] = $menuMethod['method_code'];
            $data['app_code'] = $this->appCode;

            $data['company_code'] = $this->companyCode;
            $data['opt_user'] = $this->userCode;
            $data['opt_user_name'] = $this->userName;

            $dataList[] = $data;
        }
        $condition = array();
        $condition['menu_code'] = array('in', $menuCodes);
        $condition['role_code'] = $roleCode;
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;

        $this->model->where($condition)->delete();
        if(!empty($dataList)){
            $addResult = $this->model->addAll($dataList);
            if(!$addResult){
                $this->ajaxReturn(0,'',"保存失败！");
            }else{
                $this->ajaxReturn(1,'',"保存成功！");
            }
        }else{
            $this->ajaxReturn(1,'',"保存成功！");
        }
    }
}