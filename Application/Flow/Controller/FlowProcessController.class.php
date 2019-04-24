<?php
/**
 * Created by PhpStorm.
 * User: sqluogui
 * Date: 2018/5/16
 * Time: 18:33
 */

namespace Flow\Controller;


use Auth\Controller\CommonController;

class FlowProcessController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Flow/FlowProcess");
    }

    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $code = $this->getParam('search_code');
        $name = $this->getParam('search_name');
        $condition = array();
        if(!empty($code)){
            $condition['code'] = array('like','%'.$code.'%');
            $this->assign('search_code', $code);
        }
        if(!empty($name)){
            $condition['name'] = array('like','%'.$name.'%'); 
            $this->assign('search_name', $name);
        }
        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->order('sort desc')->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display(); // 输出模板
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['sort'] = $this->getParam('sort', true);

        $data['count'] = $this->getParam('count');
        $data['draft'] = $this->getParam('draft');
        $data['status'] = $this->getParam('status');
        $data['remark'] = $this->getParam('remark');

        $data['design'] = '';
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['app_code'] = $this->appCode;

        $data['company_code'] = $this->companyCode;

        if(empty($data['id'])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    private function _formatList($list){
        if(empty($list)){
            return $list;
        }
        foreach($list as &$item){
            $item['status'] = $item['status'] == 1 ? '正常' : '停用';
        }
        return $list;
    }
}