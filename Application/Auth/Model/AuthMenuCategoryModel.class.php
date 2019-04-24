<?php
namespace Auth\Model;
use Think\Model;
class AuthMenuCategoryModel extends Model{
    public function getAllMenuCategory($appCode){
        $condition = array();
        $condition['status'] = 1;
        $condition['app_code'] = $appCode;
        return $this->where($condition)->select();
    }

    public function getMenuCategoryByCode($code, $appCode){
        $condition = array();
        $condition['code'] = $code;
        $condition['app_code'] = $appCode;
        $condition['status'] = 1;
        return $this->where($condition)->find();
    }

    public function getTopMenuCategory($top){
        return $this->where(array('status'=>array('neq',0)))->limit($top)->select();
    }

    //获取分类菜单关系
    public function getCategoryMenuByCode($roleCodes, $appCode, $companyCode){
        //获取有权限的菜单,菜单中默认的方法，必须已经配置了权限
        $menuDao = D('Auth/AuthMenu');
        $condition = array();
        $condition['rmm.role_code'] = array('in', $roleCodes);
        $condition['m.app_code'] = $appCode;
        $condition['rmm.company_code'] = $companyCode;
        $condition['rmm.id'] = array('gt', 0);
        $condition['m.show_in_menu'] = 1;
        $menuList = $menuDao->alias('m')
            ->distinct(true)
            ->join(' left join auth_role_menu_method rmm on m.code = rmm.menu_code and m.default_action=rmm.method_code and m.app_code = rmm.app_code')
            ->where($condition)
            ->field('m.*')
            ->order('m.sort desc')
            ->select();
        if(empty($menuList)){
            return array();
        }
        //获取菜单类别
        $categoryCodes = array();
        foreach($menuList as $menu){
            $categoryCodes[] = $menu['category_code'];
        }
        //获取菜单类别
        $categoryCodes = array_unique($categoryCodes);
        $categoryCodes = array_values($categoryCodes);
        $condition = array();
        $condition['app_code'] = $appCode;
        $condition['code'] = array('in', $categoryCodes);
        $categoryList = $this->where($condition)->order('sort desc')->select();
        //整理类别菜单
        foreach($categoryList as &$category){
            $category['menuList'] = array();
            foreach($menuList as $menu){
                if($category['code'] == $menu['category_code']){
                    $category['menuList'][] = $menu;
                }
            }
        }
        return $categoryList;
    }
}