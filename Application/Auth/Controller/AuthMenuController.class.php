<?php
namespace Auth\Controller;
use Think\Controller;
class AuthMenuController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthMenu");
    }

    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $menuCode = $this->getParam('search_code');
        $menuName = $this->getParam('search_name');
        $cateCode = $this->getParam('search_category');
        $appCode = $this->getParam('search_app');
        $condition = array();
        if(!empty($menuCode)){
            $condition['code'] = array('like','%'.$menuCode.'%');
            $this->assign('search_code',$menuCode);
        }
        if(!empty($menuName)){
            $condition['name'] = array('like','%'.$menuName.'%');
            $this->assign('search_name',$menuName);
        }
        if(!empty($cateCode)){
            $condition['category_code'] = $cateCode;
            $this->assign('search_category',$cateCode);
        }
        if(!empty($appCode)){
            $condition['app_code'] = $appCode;
            $this->assign('search_app', $appCode);
        }
        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->order('sort desc')->select();
        $list = $this->_formatList($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->assign('categoryList',$this->_getMenuCategory());

        //app列表
        $appList = $this->_getApp();
        $this->assign('appList',$appList);
        $this->display(); // 输出模板
    }

    public function getMenuById(){
        $id = $this->getParam('id', true);
        $data = $this->model->where(array("id"=>$id))->find();
        if(!empty($data)){
            $this->ajaxReturn(1,$data);
        }else{
            $this->ajaxReturn(0,'',"获取菜单数据失败！");
        }
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['code'] = $this->getParam('code', true);
        $data['name'] = $this->getParam('name', true);
        $data['sort'] = $this->getParam('sort', true);

        $data['status'] = $this->getParam('status');
        $data['category_code'] = $this->getParam('category_code', true);
        $data['controller'] = $this->getParam('controller', true);
        $data['default_action'] = $this->getParam('default_action', true);

        $data['url'] = $this->getParam('url', true);
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['app_code'] = $this->getParam('app_code', true);

        $data['in_org_rule'] = $this->getParam('in_org_rule');
        $data['show_in_menu'] = $this->getParam('show_in_menu');
        $data['in_row_rule'] = $this->getParam('in_row_rule');

        if(empty($data["id"])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function addView(){
        $this->assign('categoryList',$this->_getMenuCategory());
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
        $this->assign('categoryList',$this->_getMenuCategory());
        $appList = $this->_getApp();
        $this->assign("appList",$appList);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    private function _getMenuCategory(){
        $menuCategoryDao = D('Auth/AuthMenuCategory');
        $categoryList = $menuCategoryDao->select();
        return $categoryList;
    }

    private function _getApp(){
        $appDao = D('Auth/AuthApp');
        $appList = $appDao->where(array('status'=>1))->select();
        return $appList;
    }

    private function _formatList($list){
        if(empty($list)){
            return $list;
        }
        $menuCateDao = D('Auth/AuthMenuCategory');
        $cateList = $menuCateDao->getAllMenuCategory($this->appCode);
        $appList = $this->_getApp();
        foreach($list as &$item){
            $item['status'] = $item['status'] == 1 ? '正常' : '停用';
            $item['in_org_rule'] = $item['in_org_rule'] == 0 ? '不参与' : '参与';
            $item['show_in_menu'] = $item['show_in_menu'] == 0 ? '不显示' : '显示';
            $item['in_row_rule'] = $item['in_row_rule'] == 0 ? '不参与' : '参与';
            foreach($cateList as $cate){
                if($item['category_code'] == $cate['code']){
                    $item['category_name'] = $cate['name'];
                    break;
                }
            }
            foreach($appList as $app){
                if($item['app_code'] == $app['code']){
                    $item['app_name'] = $app['name'];
                }
            }
        }
        unset($item);
        return $list;
    }
}