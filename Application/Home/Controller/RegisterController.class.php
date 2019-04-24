<?php
/**
 * Created by PhpStorm.
 * User: lg
 * Date: 2017/8/18
 * Time: 22:24
 */

namespace Home\Controller;
use Think\Controller;

class RegisterController extends CommonController{
    public function index(){
        $this->display();
    }

    public function getCheckCode(){
        $Verify = new \Think\Verify();
        $Verify->entry('registerCode');
    }

    public function ajaxCheckCode(){
        $code = I("code");
        $verify = new \Think\Verify();
        if(!$verify->check($code,'registerCode')){
            $this->ajaxReturn(0,'验证码不正确');
        }else{
            $this->ajaxReturn(1,'');
        }
    }

    public function register(){
        $phone = I('phone');
        $code = I('code');
        $pwd = I('pwd');

        $pwd2 = I('pwd2');
        $this->_doCheck($phone, $code, $pwd, $pwd2);
        $userDao = D('Auth/AuthUser');
        if($userDao -> addData($phone, $pwd)){
            $this->ajaxReturn(1,'');
        }else{
            $this->ajaxReturn(0,'注册失败，请稍后重试');
        }
    }

    private function _doCheck($phone, $code, $pwd, $pwd2){
        if(empty($phone)){
            $this->ajaxReturn(0,'请输入电话号码/邮箱');
        }
        $reg = '/^1[3|4|5|7|8|9][0-9]{9}$/';
        $regEmail = '/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/';
        if(!preg_match($reg,$phone) && !preg_match($regEmail,$phone)){
            $this->ajaxReturn(0,'请输入正确的手机号码/邮箱');
        }
        if(preg_match($reg,$phone) && strlen($phone) != 11 ){
            $this->ajaxReturn(0,'请输入正确的手机号码/邮箱');
        }
        $userDao = D('Auth/AuthUser');
        $count = $userDao->where(array('code'=>$phone))->count();
        if( $count > 0 ){
            $this->ajaxReturn(0,'该手机/邮箱已经注册！');
        }

        if(empty($code)){
            $this->ajaxReturn(0,'请输入验证码');
        }
        $verify = new \Think\Verify();
        if(!$verify->check($code,'registerCode')){
            $this->ajaxReturn(0,'验证码不正确');
        }

        if(empty($pwd)){
            $this->ajaxReturn(0,'请输入密码');
        }
        if(strlen($pwd) < 8){
            $this->ajaxReturn(0,'密码长度小于8');
        }
        if(strlen($pwd) > 20 ){
            $this->ajaxReturn(0,'密码长度大于20');
        }
        if($pwd != $pwd2){
            $this->ajaxReturn(0,'密码验证和密码不相同！');
        }
    }

    public function success(){
        $this->display();
    }
}