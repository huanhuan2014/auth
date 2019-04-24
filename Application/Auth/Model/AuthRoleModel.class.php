<?php
namespace Auth\Model;
use Think\Model;
class AuthRoleModel extends Model{
    public function getAllRole($appCode, $companyCode){
        $condition = array();
        $condition['app_code'] = $appCode;
        $condition['company_code'] = $companyCode;
        $condition['status'] = 1;
        return $this->where($condition)->select();
    }

    public function getRoleByCode($code){
        return $this->where(array('status'=>array('neq',0),'code'=>$code))->find();
    }
}