<?php

namespace Auth\Controller;


class AuthRoleMenuColumnController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D('Auth/AuthRoleMenuColumn');
    }

    public function index(){
        $menuCategoryCode = $this->getParam('category');
        $roleCode = $this->getParam('role');
        $roleDao = D('Auth/AuthRole');
        $roleList = $roleDao->getAllRole($this->appCode, $this->companyCode);
        $menuCategoryList = $this->model->getMenuCategory($this->appCode);
        //默认获取第一个类别
        if(empty($menuCategoryCode) && !empty($menuCategoryList)){
            $menuCategoryCode = $menuCategoryList[0]['code'];
        }
        //默认第一个角色
        if(empty($roleCode) && !empty($roleList)){
            $roleCode = $roleList[0]['code'];
        }
        //获取已存在的菜单方法关系
        $menuColumnDao = D('Auth/AuthMenuColumn');
        $menuColumnList = $menuColumnDao->getColumnByMenuCategory($menuCategoryCode, $this->appCode);
        //角色,菜单,字段关系
        $roleMenuColumnList = $this->model->getDataByRoleMenuCate($roleCode, $menuCategoryCode, $this->appCode, $this->companyCode);

        $menuCategoryName = '';
        foreach($menuCategoryList as $cate){
            if($cate['code'] == $menuCategoryCode){
                $menuCategoryName = $cate['name'];
                break;
            }
        }
        $this->assign('category_code',$menuCategoryCode);
        $this->assign("menuCategoryList",$menuCategoryList);
        $this->assign('role_code',$roleCode);
        $this->assign('roleList',$roleList);
        $this->assign("menuColumnList",$menuColumnList);
        $this->assign("roleMenuColumnList",$roleMenuColumnList);
        $this->assign('menuCategoryName', $menuCategoryName);
        $this->display();
    }

    public function ajax_save(){
        $roleCode = $this->getParam('role_code');
        $menuCodes = $this->getParam('menu_codes');
        $menuMethods = $this->getParam('menu_column');
        $dataList = array();
        foreach($menuMethods as $menuMethod){
            $data = array();

            $data['role_code'] = $roleCode;
            $data['menu_code'] = $menuMethod['menu_code'];
            $data['column_code'] = $menuMethod['column_code'];
            $data['app_code'] = $this->appCode;

            $data['company_code'] = $this->companyCode;
            $data['opt_user'] = $this->userCode;
            $data['opt_user_name'] = $this->userName;
            $data['column_name'] = $menuMethod['column_name'];

            $data['sort'] = $menuMethod['sort'];

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