<?php
namespace Auth\Model;
use Think\Model;
class AuthMenuModel extends Model{
    public function getAllMenu($appCode){
        $condition = array();
        $condition['app_code'] = $appCode;
        $condition['status'] = 1;
        return $this->where($condition)->select();
    }

    public function getMenuByCode($code){
        return $this->where(array('status'=>array('neq',0),'code'=>$code))->find();
    }

    //根据类别编号获取菜单
    public function getMenuByCategoryCode($categoryCode, $appCode){
        $condition = array();
        $condition['category_code'] = $categoryCode;
        $condition['app_code'] = $appCode;
        $condition['status'] = 1;
        return $this->where($condition)->select();
    }

    public function getCodeByController($appCode, $controller){
        $condition = array();
        $condition['status'] = 1;
        $condition['app_code'] = $appCode;
        $condition['controller'] = $controller;
        return $this->where($condition)->getField('code');
    }

    public function getMenuByController($appCode, $controller){
        $condition = array();
        $condition['status'] = 1;
        $condition['app_code'] = $appCode;
        $condition['controller'] = $controller;
        return $this->where($condition)->find();
    }
}