<?php
/**
 * Created by PhpStorm.
 * User: lg
 * Date: 2017/8/16
 * Time: 22:06
 */

namespace Auth\Controller;
use Think\Controller;

class IndexController extends CommonController {
    public function index(){
        //获取菜单信息
        $menuCategoryDao = D('Auth/AuthMenuCategory');
        $menuCategoryList = $menuCategoryDao->getCategoryMenuByCode($this->roleCodes, $this->appCode, $this->companyCode);
        $this->assign('menuCategoryList',$menuCategoryList);
        $this->display();
    }
}