<?php

namespace Auth\Model;


use Think\Model;

class AuthMenuMethodModel extends Model{

    //获取类别菜单方法
    public function getCategoryMenuMethod($categoryCode, $appCode){
        //菜单类别
        $menuCategoryDao = D("Auth/AuthMenuCategory");
        $menuCategory = $menuCategoryDao->getMenuCategoryByCode($categoryCode, $appCode);
        //获取菜单
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getMenuByCategoryCode($categoryCode, $appCode);
        $menuCategory['menus'] = $menuList;
        if(empty($menuList)){
            return $menuCategory;
        }

        //获取菜单，方法关系
        $menuCodes = array_column($menuList, 'code');
        $condition = array();
        $condition['menu_code'] = array('in', $menuCodes);
        $condition['app_code'] = $appCode;
        $menuMethodList = $this->where($condition)->select();
        if(empty($menuMethodList)){
            return $menuCategory;
        }

        //整理数据
        foreach($menuCategory['menus'] as &$menu){
            $menu['methodCodes'] = array();
            $menu['methodList'] = array();
            foreach($menuMethodList as $menuMethod){
                if($menuMethod['menu_code'] == $menu['code']){
                    $menu['methodCodes'][] = $menuMethod['method_code'];
                    $menu['methodList'][] = $menuMethod;
                }
            }
        }
        return $menuCategory;
    }

    public function getDataByMenu($menuCode, $appCode){
        $condition = array();
        $condition['menu_code'] = $menuCode;
        $condition['app_code'] = $appCode;
        $list = $this->where($condition)->select();
        return $list;
    }
}