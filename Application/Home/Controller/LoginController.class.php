<?php
/**
 * Created by PhpStorm.
 * User: lg
 * Date: 2017/8/16
 * Time: 23:17
 */

namespace Home\Controller;
use Think\Controller;

class LoginController extends CommonController{
    public function index(){
        $this->display();
    }

    public function getCheckCode(){
        $Verify = new \Think\Verify();
        $Verify->entry('loginCode');
    }

    public function ajaxCheckCode(){
        $code = I("loginCode");
        $verify = new \Think\Verify();
        if(!$verify->check($code,'loginCode')){
            $this->ajaxReturn(0,'验证码不正确');
        }else{
            $this->ajaxReturn(1,'');
        }
    }

    public function login(){
        $code = I('code');
        $loginCode = I("loginCode");
        $pwd = I('pwd');
        $this->_doCheck($code, $loginCode, $pwd);
        $this->ajaxReturn(1,'');
    }

    private function _doCheck($code, $loginCode, $pwd){
        if(empty($code)){
            $this->ajaxReturn(0,'请输入电话号码/邮箱');
        }
        $reg = '/^1[3|4|5|7|8|9][0-9]{9}$/';
        $regEmail = '/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/';
        if(!preg_match($reg,$code) && !preg_match($regEmail,$code)){
            $this->ajaxReturn(0,'请输入正确的手机号码/邮箱');
        }
        if(preg_match($reg,$code) && strlen($code) != 11 ){
            $this->ajaxReturn(0,'请输入正确的手机号码/邮箱');
        }


        if(empty($loginCode)){
            $this->ajaxReturn(0,'请输入验证码');
        }
        $verify = new \Think\Verify();
        if(!$verify->check($loginCode,'loginCode')){
            $this->ajaxReturn(0,'验证码不正确');
        }

        if(empty($pwd)){
            $this->ajaxReturn(0,'请输入密码');
        }
        $userDao = D('Auth/AuthUser');
        $getUserResult = $userDao->getUser($code,$pwd);
        if($getUserResult['code'] != 1 ){
            $this->ajaxReturn(0,$getUserResult['msg']);
        }
        $session['user'] = $getUserResult['data'];
    }
}