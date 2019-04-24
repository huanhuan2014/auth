<?php
namespace Auth\Controller;
use Common\Common\AjaxPage;
use Think\Controller;
class AuthUserController extends CommonController {
    public function _initialize(){
        parent::_initialize();
        $this->model = D("Auth/AuthUser");
    }

    public function index(){
        parent::getAuthButton();
        $userName = $this->getParam('user_name');
        $userCode = $this->getParam('user_code');
        $roleCode = $this->getParam('role_code');
        $condition = array();
        if(!empty($userName)){
            $condition['u.name'] = array('like', '%'.$userName.'%');
            $this->assign('user_name', $userName);
        }
        if(!empty($userCode)){
            $condition['u.code'] = array('like', '%'.$userCode.'%');
            $this->assign('user_code', $userCode);
        }
        if(!empty($roleCode)){
            $condition['ur.role_code'] = $roleCode;
            $this->assign('role_code', $roleCode);
        }
        $count = $this->model->alias('u')
            ->join('left join auth_user_role ur on u.code = ur.user_code')
            ->join('left join auth_company c on c.code = u.company_code')
            ->distinct('true')->where($condition)->count();
        $page = new \Think\Page($count,$this->pageSize);
        $show =  $page->show();
        $list = $this->model->alias('u')
            ->join('left join auth_user_role ur on u.code = ur.user_code')
            ->join('left join auth_company c on c.code = u.company_code')
            ->distinct('true')->limit($page->firstRow.','.$page->listRows)->where($condition)
            ->field('u.*, c.name as company_name')->select();
        $list = $this->formatUser($list);
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $roleDao = D('Auth/AuthRole');
        $roleList = $roleDao->select();
        $this->assign('roleList', $roleList);
        $this->display();
    }

    public function save(){
        $data = $this->model->create();
        if(empty($data["id"])){
            $this->add($data);
        }else{
            $this->edit($data);
        }
    }

    public function changePwd(){
        $this->display();
    }

    //修改密码
    public function ajax_change_pwd(){
        $userInfo = session('user_info');
        $userCode = $userInfo['code'];
        $old_pwd = $this->getParam('old_pwd',true);
        $new_pwd = $this->getParam('new_pwd',true);
        $old_pwd = md5($old_pwd);
        $condition = array();
        $condition['code'] = $userCode;
        $condition['pwd'] = $old_pwd;
        $count = $this->model->where($condition)->count();
        if($count <=0){
            $this->ajaxReturn(0, '', '密码错误');
        }
        $new_pwd = md5($new_pwd);
        $saveReslut = $this->model->where(array('code'=>$userCode))->save(array('pwd'=>$new_pwd));
        if($saveReslut === false){
            $this->ajaxReturn(0, '', '保存失败');
        }
        $this->ajaxReturn(1, '', '保存成功');
    }

    public function ajax_user_search(){
        //$deptCode = $this->getParam('orgCode');
        $userCode = $this->getParam('user_code');
        $userName = $this->getParam('user_name');
        $condition = array();
        if(!empty($userCode)){
            $condition['code'] = array('like','%'.$userCode.'%');
            $this->assign('user_code', $userCode);
        }
        if(!empty($userName)){
            $condition['name'] = array('like', '%'.$userName.'%');
            $this->assign('user_name', $userName);
        }
        $count = $this->model->where($condition)->count();
        $page = new AjaxPage($count,$this->pageSize,'ajax_user_search');
        $show = $page->show();
        $list = $this->model->limit($page->firstRow.','.$page->listRows)->where($condition)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $html = $this->fetch('search-info');
        $this->ajaxReturn(1,$html,'');
        $this->display(); // 输出模板
    }

    public function formatUser($userList){
        if(empty($userList)){
            return $userList;
        }
        $userCodes = array();
        foreach($userList as $user){
            $userCodes[] = $user['code'];
        }
        $condition = array();
        $condition['user_code'] = array('in', $userCodes);
        //获取组织机构数据
        $userOrganizationDao = D('Auth/AuthUserOrganization');
        $userOrganizationList = $userOrganizationDao->where($condition)->select();
        $orgCodes = array();
        foreach($userOrganizationList as $item){
            $orgCodes[] = $item['organization_code'];
        }
        $orgCodes = array_values(array_unique($orgCodes));
        $orgList = array();
        if(!empty($orgCodes)){
            $orgDao = D('Auth/AuthOrganization');
            $orgList = $orgDao->where(array('code'=>array('in', $orgCodes)))->select();
        }

        //获取角色信息
        $userRoleDao = D('Auth/AuthUserRole');
        $userRoleList = $userRoleDao->where($condition)->select();
        $roleCodes = array();
        foreach($userRoleList as $item){
            $roleCodes[] = $item['role_code'];
        }
        $roleCodes = array_values(array_unique($roleCodes));
        $roleList = array();
        if(!empty($roleCodes)){
            $roleDao = D('Auth/AuthRole');
            $roleList = $roleDao->where(array('code'=>array('in', $roleCodes)))->select();
        }
        //整理user数据
        foreach($userList as &$item){
            $item['org_name'] = array();
            $item['role_name'] = array();
            foreach($userOrganizationList as $userOrg){
                if($userOrg['user_code'] == $item['code']){
                    foreach($orgList as $org){
                        if($org['code'] == $userOrg['organization_code']){
                            $item['org_name'][] = $org['name'];
                            break;
                        }
                    }
                }
            }
            foreach($userRoleList as $userRole){
                if($userRole['user_code'] == $item['code']){
                    foreach($roleList as $role){
                        if($role['code'] == $userRole['role_code']){
                            $item['role_name'][] = $role['name'];
                        }
                    }
                }
            }
            $item['org_name'] = array_values(array_unique($item['org_name']));
            $item['role_name'] = array_values(array_unique($item['role_name']));
            $item['org_name'] = implode(',', $item['org_name']);
            $item['role_name'] = implode(',', $item['role_name']);
        }
        return $userList;
    }

    public function ajax_set_org(){
        $orgCode = $this->getParam('org_code',true);
        $userCode = $this->getParam('user_code',true);
        $userOrgDao = D('Auth/AuthUserOrganization');
        $userOrgDao->where(array('user_code'=>$userCode))->delete();
        $orgCodes = explode(',',$orgCode);
        $userorgDatas = array();
        foreach($orgCodes as $item){
            $data = array();

            $data['user_code'] = $userCode;
            $data['organization_code'] = $item;
            $data['opt_user'] = $this->userCode;
            $data['opt_user_name'] = $this->userName;

            $userorgDatas[] = $data;
        }
        $userOrgDao->addAll($userorgDatas);
        $this->ajaxReturn(1,'','设置成功');
    }

    public function ajax_set_role(){
        $userCode = $this->getParam('user_code',true);
        $roleCode = $this->getParam('role_code', true);
        $userRole = D('Auth/AuthUserRole');
        $userRole->where(array('user_code'=>$userCode))->delete();
        $roleCodes = explode(',', $roleCode);
        $userRoleDatas = array();
        foreach($roleCodes as $item){
            $data = array();

            $data['user_code'] = $userCode;
            $data['role_code'] = $item;
            $data['opt_user'] = $this->userCode;
            $data['opt_user_name'] = $this->userName;

            $userRoleDatas[] = $data;
        }
        $userRole->addAll($userRoleDatas);
        $this->ajaxReturn(1,'','设置成功');
    }

    public function ajax_set_company(){
        $companyCode = $this->getParam('company_code', true);
        $userCode = $this->getParam('user_code', true);
        $setCompanyResult = $this->model->where(array('code'=>$userCode))->save(array('company_code'=>$companyCode));
        if($setCompanyResult >0){
            $this->ajaxReturn(0, '', '设置失败');
        }
        $this->ajaxReturn(1,'','设置成功');
    }
}