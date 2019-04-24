<?php
namespace Auth\Model;
use Think\Model;
class AuthMenuButtonModel extends Model{
    public function getButtonCodeByMenuCode($menuCode){
        return $this->where(array('menu_code'=>$menuCode))->getField('button_code',true);
    }

    public function delByMenuCode($menuCode){
        return $this->where(array('menu_code'=>$menuCode))->delete();
    }

    //获取类别按钮，菜单关系
    public function getCategoryMenuButton($categoryCode, $appCode){
        //菜单类别
        $menuCategoryDao = D("Auth/AuthMenuCategory");
        $menuCategory = $menuCategoryDao->getMenuCategoryByCode($categoryCode, $appCode);
        //所有菜单
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getAllMenu($appCode);
        //所有菜单按钮
        $menuButtonDao = D('Auth/AuthMenuButton');
        $menuButtonList = $menuButtonDao->select();
        //所有按钮
        $buttonDao = D('Auth/AuthButton');
        $buttonList = $buttonDao->getAllButton();
        foreach($menuList as $menu){
            if($menuCategory['code'] != $menu['category_code']){
                continue;
            }
            $menu['buttonCodes'] = array();
            $menu['buttonList'] = array();
            foreach($menuButtonList as $menuButton){
                if($menu['code']!=$menuButton['menu_code']){
                    continue;
                }
                $menu['buttonCodes'][] = $menuButton['button_code'];
                foreach($buttonList as $button){
                    if($menuButton['button_code']!=$button['code']){
                        continue;
                    }
                    $menu['buttonList'][] = $button;
                }
            }
            $menuCategory['menus'][] = $menu;
        }
        return $menuCategory;
    }
}