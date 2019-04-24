<?php
namespace Auth\Model;
use Think\Model;
class AuthButtonModel extends Model{
    public function getAllButton(){
        return $this->where(array('status'=>1))->order('sort desc')->select();
    }

    public function getButtonByCode($code){
        return $this->where(array('status'=>1,'code'=>$code))->find();
    }

    public function getButtonByControlRole($controller, $roles, $appCode, $companyCode){
        $menuDao = D('Auth/AuthMenu');
        //获取菜单编号
        $condition = array();
        $condition['controller'] = $controller;
        $condition['app_code'] = $appCode;
        $menuCode = $menuDao->where($condition)->getField('code');

        //获取角色，菜单，按钮
        $condition = array();

        $condition['role_code'] = array('in', $roles);
        $condition['menu_code'] = $menuCode;
        $condition['app_code'] = $appCode;
        $condition['company_code'] = $companyCode;

        $roleMenuButtonDao = D('Auth/AuthRoleMenuButton');
        $roleMenuButtonCodeList = $roleMenuButtonDao->where($condition)->getField('button_code',true);

        //获取按钮
        if(!empty($roleMenuButtonCodeList) && !empty($roleMenuButtonCodeList[0])){
            $buttonModel = D("Auth/AuthButton");
            $buttonList = $buttonModel->where(array('code'=>array('in',$roleMenuButtonCodeList)))->order('sort desc')->select();
        }else{
            $buttonList = array();
        }
        return $buttonList;
    }
}