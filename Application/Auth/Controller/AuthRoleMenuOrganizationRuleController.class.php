<?php
/**
 * 角色数据权限，
 * 部门权限(自己的数据，本部门的数据，子部门，本部门及子部门，所有)
 */

namespace Auth\Controller;

class AuthRoleMenuOrganizationRuleController extends CommonController{
    public function _initialize(){
        //parent::_initialize();
        $this->model = D("Auth/AuthRoleMenuOrganizationRule");
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
        //获取已存在的角色菜单部门关系
        $roleMenuOrganizationRuleDao = D('Auth/AuthRoleMenuOrganizationRule');
        $roleMenuOrgList = $roleMenuOrganizationRuleDao->getDataByRoleMenuCate($roleCode, $menuCategoryCode, $this->appCode, $this->companyCode);

        //获取该类别下所有菜单
        $menuList = $this->_getMenuByCate($menuCategoryCode);

        $this->assign('menuList',$menuList);
        $this->assign('category_code',$menuCategoryCode);
        $this->assign("menuCategoryList",$menuCategoryList);
        $this->assign('roleList',$roleList);
        $this->assign('role_code',$roleCode);
        $this->assign("roleMenuOrgList",$roleMenuOrgList);
        $typeList = $this->_getType();
        $this->assign('typeList', $typeList);
        $this->display();
    }

    public function ajax_save(){
        $roleCode = $this->getParam('role_code');
        $menuCodes = $this->getParam('menu_codes');
        $menuMethods = $this->getParam('menu_type');
        $dataList = array();
        foreach($menuMethods as $menuMethod){
            $data = array();

            $data['role_code'] = $roleCode;
            $data['menu_code'] = $menuMethod['menu_code'];
            $data['type'] = $menuMethod['type'];
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

    //获取权限类型
    private function _getType(){
        $result = array();

        $result[] = array('code'=>1,'title'=>'自己');
        $result[] = array('code'=>2,'title'=>'本部门');
        $result[] = array('code'=>3,'title'=>'子部门');
        $result[] = array('code'=>4,'title'=>'本部门及子部门');

        $result[] = array('code'=>5,'title'=>'所有');

        return $result;
    }

    private function _getMenuByCate($cateCode){
        $condition = array();
        $condition['category_code'] = $cateCode;
        $condition['app_code'] = $this->appCode;
        $condition['status'] = 1;
        $condition['in_org_rule'] =1;

        $menuDao = D('Auth/AuthMenu');
        $list = $menuDao->where($condition)->select();
        return $list;
    }

}