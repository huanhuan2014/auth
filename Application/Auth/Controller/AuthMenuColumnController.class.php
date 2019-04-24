<?php
/**
 * Created by PhpStorm.
 * User: sqluogui
 * Date: 2018/4/17
 * Time: 18:54
 */

namespace Auth\Controller;


class AuthMenuColumnController extends CommonController{
    public function _initialize(){
        parent::_initialize();
        $this->model = D('Auth/AuthMenuColumn');
    }

    public function index(){
        parent::getAuthButton();
        $menuCode = $this->getParam('search_menu_code');
        $menuCategoryCode = $this->getParam('search_menu_category_code');
        $code = $this->getParam('search_code');
        $name = $this->getParam('search_name');
        $condition = array();

        if(!empty($code)){
            $this->assign('search_code', $code);
            $condition['code'] = array('like', '%'.$condition.'%');
        }
        if(!empty($name)){
            $this->assign('search_name', $name);
            $condition['name'] = array('like', '%'.$name.'%');
        }
        if(!empty($menuCode)){
            $this->assign('search_menu_code', $menuCode);
            $condition['menu_code'] = $menuCode;
        }
        //获取类别
        $menuCategoryDao = D('Auth/AuthMenuCategory');
        $menuCategoryList = $menuCategoryDao->getAllMenuCategory($this->appCode);
        $this->assign('menuCategoryList', $menuCategoryList);
        if(empty($menuCategoryCode) && !empty($menuCategoryList)){
            $menuCategoryCode = $menuCategoryList[0]['code'];
        }
        $this->assign('search_menu_category_code', $menuCategoryCode);
        //菜单为空则，搜索该类别下所有菜单
        if(empty($menuCode)){
            $menuCodes = $this->_getMenuCodeByCate($menuCategoryCode);
            $condition['menu_code'] = array('in', $menuCodes);
        }

        $condition['app_code'] = $this->appCode;
        $condition['company_code'] = $this->companyCode;

        $count = $this->model->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->order('sort desc')->select();
        $list = $this->_formatData($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display(); // 输出模板
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

        $data['sort'] = $this->getParam('sort',true);
        $data['menu_code'] = $this->getParam('menu_code', true);
        $data['opt_user'] = $this->userCode;
        $data['opt_user_name'] = $this->userName;

        $data['app_code'] = $this->appCode;
        $data['company_code'] = $this->companyCode;
        $data['is_show'] = $this->getParam('is_show');

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
                    $item['menuName'] = $menu['name'];
                }
            }
            $item['status'] = $item['status'] == 1 ? '正常' : '停用';
            $item['is_show'] = $item['is_show'] == 1 ? '显示' : '不显示';
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

    private function _getMenuCodeByCate($cateCode){
        $menuDao = D('Auth/AuthMenu');
        $menuList = $menuDao->getMenuByCategoryCode($cateCode, $this->appCode);
        $menuCodes = array_column($menuList, 'code');
        return $menuCodes;
    }
}