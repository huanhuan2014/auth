<?php

namespace Auth\Controller;
use Think\Controller;

class SsoController extends Controller{
    public function login(){
        $domain = I('url');
        $appCode = I('app');
        $this->assign('domain', $domain);
        $this->assign('appCode', $appCode);
        $this->display();
    }

    public function ajax_login(){
        $domain = I('domain');
        $user = I('user');
        $pass = I('pwd');
        $appCode = I('app_code');
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
        $userInfo = $userDao->getUserInfo($user, $pass, $appCode);
        if(empty($userInfo)){
            ajaxReturn(0, '', '用户名或密码错误');
        }
        //制作临时公开密钥
        $tokenConfig = C('TOKEN');
        $rand = rand(1000,9999);//产生四位数随机数
        $stringTemp = $domain.$tokenConfig['KEY'].microtime().$rand;
        $ticket = md5($stringTemp);

        //登录用户信息保留在session中
        //session('user_info', $userInfo);

        //用户信息保存到临时表中
        $this->saveTokenStatus($ticket, $domain, $userInfo);
        //跳转到应用页面
        $url = $domain.'?ticket='.$ticket;
        ajaxReturn(1, $url);
    }

    public function ajax_verify_token(){
        $ticket = I('ticket');
        $app = I('app');
        $url = I('url');
        $ip = I('ip');

        $sign = I('sign');
        $time = I('time');

        //验证私钥，token
        $verifyTokenResult = $this->verifyToken($app, $url, $ip, $sign, $time, $ticket);
        if($verifyTokenResult['code'] !=1){
            ajaxReturn(0, '', $verifyTokenResult['msg']);
        }

        //验证公钥，Ticket及时效
        $verifyTicketResult = $this->verifyTicket($url, $ticket);
        if($verifyTicketResult['code'] !=1){
            ajaxReturn(0, '', $verifyTicketResult['msg']);
        }
        $userInfo = $verifyTicketResult['data'];

        ajaxReturn(1,$userInfo,'');
    }

    //验证公钥，Ticket
    private function verifyTicket($url, $ticket){
        //时效性检查,
        $time = time();//当前时间
        $tokenConfig = C('TOKEN');
        $interval = $tokenConfig['INTERVAL'];//配置的时间间隔
        $AuthTokenStatusDao = D('Auth/AuthTokenStatus');
        $condition = array();
        $condition['ticket'] = $ticket;
        $condition['url'] = $url;
        $tokenStatus = $AuthTokenStatusDao->where($condition)->find();
        $result = array('code'=>0,'data'=>array(), 'msg'=>'');
        //session不存在
        if(empty($tokenStatus)){
            $result['msg'] = 'failed';
            return $result;
        }
        $diffTime = $time - $tokenStatus['time'];
        if($diffTime > $interval){
            $result['msg'] = 'time out';
            return $result;
        }
        if($tokenStatus['ticket'] != $ticket){
            $result['msg'] = 'ticket err';
            return $result;
        }
        //验证成功，重置时间
        $AuthTokenStatusDao->where($condition)->save(array('time'=>$time));
        $result['code'] = 1;
        $result['data'] = $tokenStatus['data'];
        return $result;
    }

    //验证私钥，token
    private function verifyToken($app, $url, $ip, $sign ,$time, $ticket){
        //token配置信息验证
        $appDao = D('Auth/AuthApp');
        $tokenDao = D('Auth/AuthToken');
        $condition = array();
        $condition['code'] = $app;
        $condition['ip'] = $ip;
        $condition['url'] = $url;
        $condition['status'] = array('neq',0);
        $appInfo = $appDao->where($condition)->find();
        if(empty($appInfo)){
            $result['msg'] = 'app not exit';
            return $result;
        }
        $tokenInfo = $tokenDao->where(array('app_code'=>$app))->find();
        $result = array('code'=>0, 'msg'=>'');
        if(empty($tokenInfo)){
            $result['msg'] = 'token err';
            return $result;
        }
        //私钥token验证
        $stringTemp = md5($tokenInfo['token'] . $time . $ticket);
        if($sign != $stringTemp){
            $result['msg'] = 'auth err';
            return $result;
        }
        $result['code'] = 1;
        return $result;
    }

    //保存用户数据
    private function saveTokenStatus($ticket,$url, $value){
        //删除一天前数据
        $AuthTokenStatusDao = D('Auth/AuthTokenStatus');
        $time = time();
        $time = $time - 24*60*60;
        $condition = array();
        $condition['time'] = array('elt', $time);
        $AuthTokenStatusDao->where($condition)->delete();

        $data = array();

        $data['ticket'] = $ticket;
        $data['time'] = time();
        $data['url'] = $url;
        $data['data'] = json_encode($value);

        $data['opt_user'] = $value['code'];
        $data['opt_user_name'] = $value['name'];

        $AuthTokenStatusDao->add($data);
    }
}