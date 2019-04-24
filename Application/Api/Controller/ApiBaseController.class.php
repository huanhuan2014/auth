<?php

namespace Api\Controller;

use Think\Controller;

class ApiBaseController extends Controller{

    protected $userName;
    protected $userCode;
    protected $companyCode;
    protected $appCode;

    protected $roleCodes = array();
    protected $userInfo ;
    protected $orgCodes = array();

    public function _initialize(){
        $this->checkLogin();
    }

    /**
     * 获取参数
     * @param $key string 获取参数的key值
     * @param $must boolean 是否是必须的 默认非必须
     * @return array
     */
    protected function getParam($key,$must=false){
        $param = I('param.'.$key);
        if($must && empty($param)){
            ajaxReturn(0, '', 'param '.$key.' is empty');
        }else{
            return $param;
        }
    }

    //登录验证，返回验证后保存的数据
    protected function checkLogin(){
        $ticket = $this->getParam('ticket', true);
        $this->appCode = $this->getParam('app', true);
        $tokenStatusDao = D('Auth/AuthTokenStatus');
        $condition = array();
        $condition['ticket'] = $ticket;
        $tokenStatus = $tokenStatusDao->where($condition)->find();
        if(empty($tokenStatus)){
            ajaxReturn(0,'','ticket err');
        }
        //超时检测
        $ssoConfig = C('TOKEN');
        $time = time();
        $timeDiff = $time - $tokenStatus['time'];
        if($timeDiff > $ssoConfig['INTERVAL']){
            ajaxReturn(0,'','ticket time out');
        }
        //验证成功重新设置时间
        $tokenStatusDao->where($condition)->save(array('time'=>$time));

        //收集用户信息
        $userInfo = json_decode($tokenStatus['data'], true);

        $this->userInfo = $userInfo;
        $this->userCode = $userInfo['code'];
        $this->userName = $userInfo['name'];

        $this->companyCode = $userInfo['company_code'];

        //用户角色
        if(!empty($userInfo['role'])){
            foreach($userInfo['role'] as $role){
                $this->roleCodes[] = $role['code'];
            }
        }
        //组织机构
        if(!empty($userInfo['org'])){
            foreach($userInfo['org'] as $org){
                $this->orgCodes[] = $org['code'];
            }
        }
        //ajaxReturn(1,'','');
    }
}