<?php
/**
 * 菜单方法
 */

namespace Auth\Controller;


class AuthMenuMethodController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthMenuMethod");
    }

    public function index(){
        parent::getAuthButton();
        parent::getColumns();
        $menuCategoryCode = $this->getParam('search_menu_category_code');
        $menuCategoryDao = D("Auth/AuthMenuCategory");
        $menuCategoryList = $menuCategoryDao->getAllMenuCategory($this->appCode);
        //默认获取第一个类别
        if(empty($menuCategoryCode) && !empty($menuCategoryList)){
            $menuCategoryCode = $menuCategoryList[0]['code'];
        }
        $this->assign('search_menu_category_code', $menuCategoryCode);
        $menuCode = $this->getParam('search_menu_code');
        if(empty($menuCode)){
        //获取该类别下第一个菜单
            $menuDao = D('Auth/AuthMenu');
            $menuList = $menuDao->getMenuByCategoryCode($menuCategoryCode, $this->appCode);
            if(!empty($menuList)){
                $menuCode = $menuList[0]['code'];
            }
        }
        //获取已存在的菜单方法
        $list = $this->model->getDataByMenu($menuCode, $this->appCode);
        $list = $this->_formatData($list);
        $this->assign("menuCategoryList",$menuCategoryList);
        $this->assign("list",$list);
        $this->assign('search_menu_code', $menuCode);
        $this->display();
    }

    public function addView(){
        $menuCode = $this->getParam('menu_code');
        $menuName = $this->getParam('menu_name');
        $this->assign('menuCode',$menuCode);
        $this->assign('menuName',$menuName);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function editView(){
        $id = $this->getParam("id");
        if(empty($id)){
            $this->ajaxReturn(0,'',"id参数不能为空");
        }
        $menuCode = $this->getParam('menu_code');
        $menuName = $this->getParam('menu_name');
        $this->assign('menuCode',$menuCode);
        $this->assign('menuName',$menuName);
        $menuList = $this->_getAllMenu();
        $this->assign('menuList', $menuList);
        $data = $this->model->where(array("id"=>$id))->find();
        $this->assign("data",$data);
        $html = $this->fetch("edit");
        $this->ajaxReturn(1,$html);
    }

    public function ajax_save(){
        $data = array();

        $data['id'] = $this->getParam('id');
        $data['name'] = $this->getParam('name', true);
        $data['code'] = $this->getParam('code',true);
        $data['remark'] = $this->getParam('remark');

        $data['menu_code'] = $this->getParam('menu_code', true);
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;
        $data['app_code'] = $this->appCode;

        $data['company_code'] = $this->companyCode;
        $data['status'] = $this->getParam('status');

        $where = array('menu_code'=>$data['menu_code']);
        if(empty($data['id'])){
            $this->add($data,$where);
        }else{
            $this->edit($data,$where);
        }
    }

    private function _formatData($list){
        $menuList = $this->_getAllMenu();
        foreach($list as &$item){
            foreach($menuList as $menu){
                if($item['menu_code'] == $menu['code']){
                    $item['menu'] = $menu;
                    $item['menu_code'] = $menu['name'];
                }
            }
            $item['status'] = $item['status'] == 1? '启用' :'停用';
        }
        return $list;
    }

    private function _getAllMenu(){
        $authMenuDao = D('Auth/AuthMenu');
        $list = $authMenuDao->getAllMenu($this->appCode);
        return $list;
    }

    public function ajax_get_menu(){
        $categoryCode = $this->getParam('category_code');
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getMenuByCategoryCode($categoryCode, $this->appCode);
        $this->ajaxReturn(1, $menuList,'');
    }
}