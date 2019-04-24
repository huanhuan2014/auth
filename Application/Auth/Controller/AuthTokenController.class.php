<?php

namespace Auth\Controller;


class AuthTokenController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D('Auth/AuthToken');
    }

    public function index(){
        parent::getAuthButton();
        $list = $this->model->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);// 赋值数据集
        $this->display(); // 输出模板
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['app_code'] = $this->getParam('app_code', true);
        $data['status'] = $this->getParam('status',false);
        $data['remark'] = $this->getParam('remark');

        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['token'] = $this->getParam('token', true);

        if(empty($data['id'])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    protected function add($data){
        $condition = array("app_code"=>$data["app_code"]);
        if($this->model->where($condition)->count()>0){
            $this->ajaxReturn(0,'',"该应用已经存在！");
        }
        $addResult = $this->model->add($data);
        if(!$addResult){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功！");
        }
    }

    protected function edit($data){
        $condition = array();
        $condition["id"] = array("neq"=>$data["id"]);
        $condition["app_code"] = $data["app_code"];
        if($this->model->where($condition)->count()>0){
            $this->ajaxReturn(0,'',"该应用已经存在！");
        }

        $editResult = $this->model->save($data);
        if($editResult==0){
            $this->ajaxReturn(0,'',"无数据更新");
        }else if($editResult===false){
            $this->ajaxReturn(0,'',"保存失败！");
        }else{
            $this->ajaxReturn(1,'',"保存成功");
        }
    }

    public function addView(){
        $this->assign('appList',$this->_getApp());
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function editView(){
        $id = $this->getParam('id', true);
        if(empty($id)){
            $this->ajaxReturn(0,'',"id参数不能为空");
        }
        $data = $this->model->where(array("id"=>$id))->find();
        $this->assign("data",$data);
        $this->assign('appList',$this->_getApp());
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function ajax_get_token(){
        $time = time();
        $md5 = md5($time);
        $this->ajaxReturn(1, $md5);
    }

    //加载app数据
    private function _formatList($list){
        $appList = $this->_getApp();
        foreach($list as &$item){
            foreach($appList as $app){
                if($item['app_code'] == $app['code']){
                    $item['app'] = $app;
                    break;
                }
            }
        }
        return $list;
    }

    private function _getApp(){
        $appDao = D('Auth/AuthApp');
        $appList = $appDao->select();
        return $appList;
    }
}