<?php

namespace Auth\Model;


use Think\Model;

class AuthMenuColumnModel extends Model{
    //根据菜单类别获取菜单字段
    public function getColumnByMenuCategory($categoryCode, $appCode){
        //获取菜单信息
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getMenuByCategoryCode($categoryCode, $appCode);
        if(empty($menuList)){
            return $menuList;
        }
        //所有菜单编号
        $menuCodes = array_column($menuList, 'code');
        $condition = array();
        $condition['menu_code'] = array('in', $menuCodes);
        $condition['status'] =1;
        $condition['app_code'] = $appCode;
        $menuColumnList = $this->where($condition)->select();
        if(empty($menuColumnList)){
            $menuColumnList = array();
        }
        //没有数据列的菜单不查找
        $result = array();
        foreach($menuList as $menu){
            $menu['columnList'] = array();
            foreach($menuColumnList as $menuColumn){
                if($menu['code'] == $menuColumn['menu_code']){
                    $menu['columnList'][] = $menuColumn;
                }
            }
            if(!empty($menu['columnList'])){
                $result[] = $menu;
            }
        }
        return $result;
    }
}