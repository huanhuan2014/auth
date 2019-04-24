<?php

namespace Common\Controller;

define('SHOW_IN_MENU_YES',1);//在菜单中显示
define('SHOW_IN_MENU_NO',0);//不在菜单中显示
define('IN_ROW_RULE_YES',1);//参与数据行权限
define('IN_ROW_RULE_NO', 0);//不参与数据行权限

use Think\Controller;

//权限验证通用controller

class AuthController extends Controller{

    protected $userName;
    protected $userCode;
    protected $companyCode;
    protected $appCode;

    protected $roleCodes = array();
    protected $orgCodes = array();
    protected $menuCode;//菜单编号
    protected $menu;//访问的菜单详情信息

    public function _initialize(){
        //登录状态验证
        $this->_checkLogin();
        //权限判断,controller,action 验证
        $this->_checkAuth();
    }

    //登录状态验证
    private function _checkLogin(){
        $ticket = I('ticket');
        if(!empty($ticket)){
            //ticket验证(单点登录)
            $ticketUserResult = $this->_getTicketUserInfo($ticket);
            $userInfo = $ticketUserResult['data'];
        }else{
            //session验证
            $sessionUserResult = $this->_getSessionUserInfo();
            $userInfo = $sessionUserResult['data'];
        }
        if(empty($userInfo)){
            header('Location:/Auth/AuthLogin');
        }
        //用户信息添加到公共变量
        $this->userName = $userInfo['name'];
        $this->userCode = $userInfo['code'];
        $this->companyCode = $userInfo['company_code'];
        $this->appCode = 'auth';

        //用户角色
        if(!empty($userInfo['role'])){
            foreach($userInfo['role'] as $role){
                $this->roleCodes[] = $role['code'];
            }
        }
        //用户组织架构
        if(!empty($userInfo['org'])){
            foreach($userInfo['org'] as $org){
                $this->orgCodes[] = $org['code'];
            }
        }
    }

    private function _getSessionUserInfo(){
        if(empty(session('user_info'))){
            //方便调试，初始化用户,正式环境删除该代码
            $pass = md5('123456');
            $userDao = D('Auth/AuthUser');
            $userInfo = $userDao->getUserInfo('admin', $pass, 'auth');
            if(!empty($userInfo)){
                session('user_info', $userInfo);                
            }
        }
        $userInfo = session('user_info');
        $result = array('code'=>0,'data'=>array() ,'msg'=>'');
        if(empty($userInfo)){
            $result['msg'] = '登录失败';
            return $result;
        }
        $result['code'] = 1;
        $result['data'] = $userInfo;
        return $result;
    }

    //获取ticket登录的用户信息
    //其他应用嵌入权限页面，用ticket验证用户
    private function _getTicketUserInfo($ticket){
        //获取第三方应用登录的用户信息
        $tokenStatusDao = D('Auth/AuthTokenStatus');
        $condition = array();
        $condition['ticket'] = $ticket;
        $tokenStatus = $tokenStatusDao->where($condition)->find();
        $result = array('code'=>0, 'data'=>'', 'msg'=>'');
        if(empty($tokenStatus)){
            $result['msg'] = '凭证错误';
            return $result;
        }

        //超时检测
        $ssoConfig = C('TOKEN');
        $time = time();
        $timeDiff = $time - $tokenStatus['time'];
        if($timeDiff > $ssoConfig['INTERVAL']){
            $result['msg'] = '登录超时';
            return $result;
        }

        //验证成功重新设置当前登录时间
        $tokenStatusDao->where($condition)->save(array('time'=>$time));

        //收集用户信息
        $userInfo = json_decode($tokenStatus['data'], true);
        $result['code'] = 1;
        $result['data'] = $userInfo;
        return $result;
    }

    //权限判断
    private function _checkAuth(){
        $controller = CONTROLLER_NAME;
        //首页不做权限判断
        if($controller == 'Index'){
            return;
        }

        //菜单检测
        $checkMenuResult = $this->_checkMenu();
        if($checkMenuResult['code'] !=1){
            $this->_errManage($checkMenuResult['msg']);
        }
        $this->menu = $checkMenuResult['data'];
        $this->menuCode = $this->menu['code'];

        //action检测
        $checkMethodResult = $this->_checkMethod($this->menuCode);
        if($checkMethodResult['code']!=1){
            $this->_errManage($checkMethodResult['msg']);
        }

        //检测角色action权限
        $checkRoleAuthResult = $this->_checkRoleMethod($this->menuCode);
        if($checkRoleAuthResult['code'] !=1){
            $this->_errManage($checkRoleAuthResult['msg']);
        }
    }

    //检测菜单是否存在
    private function _checkMenu(){
        $controller = CONTROLLER_NAME;
        //获取菜单编号
        $menuDao = D('Auth/AuthMenu');
        $menuInfo = $menuDao->getMenuByController($this->appCode, $controller);
        $result = array('code'=>0,'msg','data'=>'');
        if(empty($menuInfo)){
            $result['msg'] = '找不到菜单资源';
            return $result;
        }
        $result['code'] = 1;
        $result['data'] = $menuInfo;
        return $result;
    }

    //检测方法（action）是否存在
    private function _checkMethod($menuCode){
        $action = ACTION_NAME;

        $menuMethodDao = D('Auth/AuthMenuMethod');
        $condition = array();
        $condition['menu_code'] = $menuCode;
        $condition['code'] = $action;
        $condition['app_code'] = $this->appCode;
        $menuMethodCount = $menuMethodDao->where($condition)->count();
        $result = array('code'=>0,'msg','data'=>'');
        if(empty($menuMethodCount) || $menuMethodCount<=0){
            $result['msg'] = '找不到该请求的方法';
            return $result;
        }
        $result['code'] =1;
        $result['data'] = $menuMethodCount;
        return $result;
    }

    //检测角色方法权限
    private function _checkRoleMethod($menuCode){
        $action = ACTION_NAME;
        $roleMenuMethodDao = D('Auth/AuthRoleMenuMethod');
        $condition = array();
        $condition['role_code'] = array('in', $this->roleCodes);
        $condition['menu_code'] = $menuCode;
        $condition['method_code'] = $action;
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;
        $count = $roleMenuMethodDao->where($condition)->count();
        $result = array('code'=>0,'msg','data'=>'');
        if(empty($count) || $count<=0){
            $result['msg'] = '对不起你没有权限';
            return $result;
        }
        $result['code'] =1;
        $result['data'] = $count;
        return $result;
    }

    //错误信息处理（ajax请求,普通请求)
    private function _errManage($errMsg){
        if(IS_AJAX){
            //ajax 请求
            $this->ajaxReturn(0, '', $errMsg);
        }else{
            //普通请求
            $this->error($errMsg);
        }
    }

    //根据角色，获取数据权限
    protected function getAuthCondition(){
        $condition = array();
        //数据行权限
        if($this->menu['in_row_rule'] == IN_ROW_RULE_NO){
            return $condition;
        }
        $condition = $this->_getDataRowRule();
        return $condition;
    }

    //获取数据行权限
    private function _getDataRowRule(){
        $roleMenuRuleDao = D('Auth/AuthRoleMenuRule');
        $condition = array();
        $condition['role_code'] = array('in', $this->roleCodes);
        $condition['menu_code'] = $this->menuCode;
        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;

        $list = $roleMenuRuleDao->where($condition)->select();
        $result = array();
        foreach($list as $item){
            $result[] = array($item['column_code']=>array($item['rule'], $item['value']));
        }
        return $result;
    }
}