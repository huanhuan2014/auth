<?php
/**
 * Created by PhpStorm.
 * User: sqluogui
 * Date: 2018/4/3
 * Time: 17:23
 */

namespace Auth\Controller;


use Think\Controller;

class AuthLoginController extends Controller{
    public function index(){
        $this->display();
    }

    public function ajax_login(){
        $user = I('user');
        $pass = I('pwd');
        $loginCode = I('loginCode');

        if(empty($user)){
            ajaxReturn(0,'','请输入用户名');
        }
        if(empty($pass)){
            ajaxReturn(0,'','请输入密码');
        }
        if(empty($loginCode)){
            ajaxReturn(0,'','请输入验证码');
        }
        $verify = new \Think\Verify();
        if(!$verify->check($loginCode,'loginCode')){
            ajaxReturn(0,'','验证码不正确');
        }
        $pass = md5($pass);
        $userDao = D('Auth/AuthUser');
        $userInfo = $userDao->getUserInfo($user, $pass);
        if(empty($userInfo)){
            ajaxReturn(0, '', '用户名或密码错误');
        }
        //用于信息添加到session中
        session('user_info', $userInfo);
        ajaxReturn(1, '');
    }

    public function getCheckCode(){
        $Verify = new \Think\Verify();
        $Verify->entry('loginCode');
    }
}