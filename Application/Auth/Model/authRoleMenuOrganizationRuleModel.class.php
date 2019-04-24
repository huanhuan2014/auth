<?php

namespace Auth\Model;


use Think\Model;

class AuthRoleMenuOrganizationRuleModel extends Model{
    //根据菜单类别角色获取部门规则
    public function getDataByRoleMenuCate($roleCode, $cateCode, $appCode, $companyCode){
        //获取菜单信息
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getMenuByCategoryCode($cateCode, $appCode);
        if(empty($menuList)){
            return array();
        }
        //所有菜单编号
        $menuCodes = array_column($menuList, 'code');
        $condition = array();
        $condition['role_code'] = $roleCode;
        $condition['menu_code'] = array('in', $menuCodes);
        $condition['app_code'] = $appCode;
        $condition['company_code'] = $companyCode;

        $list = $this->where($condition)->select();
        return $list;
    }

    public function getTypeByMenuCode($roleCodes,$menuCode,$appCode,$companyCode){
        $condition = array();
        $condition['app_code'] = $appCode;
        $condition['company_code'] = $companyCode;
        $condition['role_code'] = array('in', $roleCodes);
        $condition['menu_code'] = $menuCode;
        return $this->where($condition)->order('type desc')->getField('type');
    }
}