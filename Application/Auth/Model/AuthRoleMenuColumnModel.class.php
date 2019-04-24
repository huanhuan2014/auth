<?php
namespace Auth\Model;

use Think\Model;

class AuthRoleMenuColumnModel extends Model{

    //根据角色，菜单类型获取字段权限
    public function getDataByRoleMenuCate($roleCode, $menuCateCode, $appCode, $companyCode){
        //获取菜单信息
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getMenuByCategoryCode($menuCateCode, $appCode);
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

    public function getDataByRoleMenu($roleCodes, $menuCode, $appCode, $companyCode){
        $condition = array();
        $condition['menu_code'] = $menuCode;
        $condition['role_code'] = array('in', $roleCodes);
        $condition['app_code'] = $appCode;
        $condition['company_code'] = $companyCode;

        $list = $this->where($condition)->order('sort desc')->select();
        return $list;
    }

    //获取菜单类别，类别下所有菜单都没有设置列，不查找
    public function getMenuCategory($appCode){
        $categoryDao = D('Auth/AuthMenuCategory');
        $list = $categoryDao->alias('c')
            ->join("left join auth_menu m on c.code = m.category_code")
            ->join('auth_menu_column mc on m.code = mc.menu_code')
            ->where(array('c.app_code'=>$appCode, 'mc.id is not null'))
            ->field('c.*')
            ->distinct(true)
            ->select();
        return $list;
    }
}