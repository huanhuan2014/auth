<?php
namespace Auth\Controller;
use Think\Controller;
class AuthRoleMenuButtonController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthRoleMenuButton");
    }

    public function index(){
        $menuCategoryCode = I('category');
        $roleCode = I('role');
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
        $menuButtonDao = D('Auth/AuthMenuButton');
        $menuCategory = $menuButtonDao->getCategoryMenuButton($menuCategoryCode, $this->appCode);
        //角色菜单，按钮关系
        $roleMenuButtonList= $this->model->where(array('role_code'=>$roleCode))->select();

        $this->assign('category_code',$menuCategoryCode);
        $this->assign('roleList',$roleList);
        $this->assign('role_code',$roleCode);
        $this->assign("menuCategory",$menuCategory);
        $this->assign("menuCategoryList",$menuCategoryList);
        $this->assign("roleMenuButtonList",$roleMenuButtonList);
        $this->display();
    }

    public function ajax_save(){
        $roleCode = I('role_code');
        $menuCodes = I('menu_codes');
        $menuButtons = I('menu_button');
        $authRoleMenuButtonDatas = array();
        foreach($menuButtons as $menuButton){
            $data = array();

            $data['role_code'] = $roleCode;
            $data['menu_code'] = $menuButton['menu_code'];
            $data['button_code'] = $menuButton['button_code'];
            $data['app_code'] = $this->appCode;

            $data['company_code'] = $this->companyCode;
            $data['opt_user'] = $this->userCode;
            $data['opt_user_name'] = $this->userName;
            $authRoleMenuButtonDatas[] = $data;
        }
        $this->model->where(array('menu_code'=>array('in',$menuCodes)))->delete();
        if(!empty($authRoleMenuButtonDatas)){
            $addResult = $this->model->addAll($authRoleMenuButtonDatas);
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