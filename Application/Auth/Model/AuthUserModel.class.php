<?php
namespace Auth\Model;
use Think\Model;
class AuthUserModel extends Model{
    public function addData($code, $pwd){
        $time = time();
        $formatTime = date("y-m-d  H:i:s",$time);
        $md5Pwd =  md5($pwd);
        $data = array();
        $data['code'] = $code;
        $data['create_time'] = $formatTime;
        $data['password'] = $md5Pwd;
        if(preg_match('/^1[3|4|5|7|8|9][0-9]{9}$/',$code)){
            $data['phone'] = $code;
        }else{
            $data['email'] = $code;
        }
        $result = $this->add($data);
        if($result !== false){
            return true;
        }else{
            return true;
        }
    }

    public function getUser($code, $pwd){
        $result = array('code'=>0,'data'=>array(),'msg'=>'');
        $md5Pwd =  md5($pwd);
        $data = $this->where(array('code'=>$code,'password'=>$md5Pwd))->find();
        if(empty($data)){
            $result['msg'] = '用户名或密码不正确';
            return $result;
        }
        $result['code'] = 1;
        $result['data'] = $data;
        return $result;
    }

    public function getUserInfo($code, $pwd){
        $condition = array();
        $condition['code'] = $code;
        $condition['password'] = $pwd;
        $userInfo = $this->where($condition)->field('id,code,name,email,phone,sex,birthday,company_code,app_code')->find();
        if(empty($userInfo)){
            return $userInfo;
        }
        //获取用户部门信息
        $orgDao = D('Auth/AuthOrganization');
        $orgList = $orgDao->alias('o')
            ->distinct(true)
            ->join('auth_user u on o.leader = u.code')
            ->join('auth_user_organization uo on uo.organization_code = o.code and uo.user_code = \''.$userInfo['code'].'\'')
            ->field('o.code,o.name,u.name as leader_name,u.code as leader_code')
            ->select();
        if(empty($orgList)){
            $orgList = array();
        }
        $userInfo['org'] = $orgList;

        //获取角色信息
        $roleDao = D('Auth/AuthRole');
        $roleList = $roleDao->alias('r')
            ->distinct(true)
            ->join('auth_user_role as ur on r.code = ur.role_code and ur.user_code = \''.$userInfo['code'].'\'')
            ->field('r.name,r.code')
            ->select();
        if(empty($roleList)){
            $roleList = array();
        }
        $userInfo['role'] = $roleList;

        //获取公司信息
        $companyDao = D('Auth/AuthCompany');
        $company =  $companyDao->where(array('code'=>$userInfo['company_code']))->find();
        if(empty($company)){
            $company = array();
        }
        $userInfo['company'] = $company;

        return $userInfo;
    }

    public function getAllUser(){
        
    }
}