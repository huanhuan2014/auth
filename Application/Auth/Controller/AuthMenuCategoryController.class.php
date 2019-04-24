<?php
namespace Auth\Controller;
use Think\Controller;
class AuthMenuCategoryController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthMenuCategory");
    }
    public function index(){
        parent::getAuthButton();
        $appCode = $this->getParam('search_app');
        $condition = array();
        if(!empty($appCode)){
            $condition['app_code'] = $appCode;
            $this->assign('search_app', $appCode);
        }
        $count = $this->model->count();
        $page = new \Think\Page($count,20);
        $show =  $page->show();
        $list = $this->model->where($condition)->limit($page->firstRow.','.$page->listRows)->order('sort desc')->select();
        $list = $this->_formatData($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $appList = $this->_getApp();
        $this->assign('appList',$appList);
        $this->display(); // 输出模板
    }

    public function ajax_save(){
        $data = array();

        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['icon'] = $this->getParam('icon', true);
        $data['status'] = $this->getParam('status');

        $data['sort'] = $this->getParam('sort');
        $data['id'] = $this->getParam('id');
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;

        $data['app_code'] = $this->getParam('app_code', true);

        if(empty($data["id"])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function addView(){
        $appList = $this->_getApp();
        $this->assign("appList",$appList);
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
        $appList = $this->_getApp();
        $this->assign("appList",$appList);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    private function _getApp(){
        $appDao = D('Auth/AuthApp');
        $appList = $appDao->where(array('status'=>1))->select();
        return $appList;
    }

    //整理数据
    private function _formatData($list){
        if(empty($list)){
            return;
        }
        $appList = $this->_getApp();
        foreach($list as &$item){
            $item['status'] = $item['status'] == 1 ? "启用" : "停用";
            $item['icon'] = '<span class=\''.$item['icon'].'\'>'.'</span>';
            foreach($appList as $app){
                if($item['app_code'] == $app['code']){
                    $item['app_name'] = $app['name'];
                    break;
                }
            }
        }
        unset($item);
        return $list;
    }
}