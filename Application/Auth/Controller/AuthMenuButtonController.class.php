<?php
namespace Auth\Controller;
use Think\Controller;
class AuthMenuButtonController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthMenuButton");
    }

    public function index(){
        $menuCategoryCode = $this->getParam('category');
        $menuCategoryDao = D("Auth/AuthMenuCategory");
        $menuCategoryList = $menuCategoryDao->getAllMenuCategory($this->appCode);
        //默认获取第一个类别
        if(empty($menuCategoryCode) && !empty($menuCategoryList)){
            $menuCategoryCode = $menuCategoryList[0]['code'];
        }
        $menuButtonDao = D('Auth/AuthMenuButton');
        $menuCategory = $menuButtonDao->getCategoryMenuButton($menuCategoryCode ,$this->appCode);
        //所有按钮
        $buttonDao = D('Auth/AuthButton');
        $buttonList = $buttonDao->getAllButton();
        if(!empty($menuCategoryCode)){
            $this->assign('category_code',$menuCategoryCode);
        }
        $this->assign("menuCategory",$menuCategory);
        $this->assign("menuCategoryList",$menuCategoryList);
        $this->assign("buttonList",$buttonList);
        $this->display();
    }

    public function ajax_save(){
        $menuCodeList = $this->getParam('menu_code');
        $menu_buttonList = $this->getParam('menu_button');
        $menuButtonDao = D('Auth/AuthMenuButton');
        $menuButton = array();
        foreach($menu_buttonList as $param){
            $menuButton[] = array('menu_code'=>$param['menu_code'],'button_code'=>$param['button_code']);
        }
        $menuButtonDao->where(array('menu_code'=>array('in',$menuCodeList)))->delete();
        $addResult = $menuButtonDao->addAll($menuButton);
        if(!$addResult){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功！");
        }
    }
}