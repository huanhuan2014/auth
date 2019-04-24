<?php
namespace Auth\Model;
use Think\Model;
class AuthOrganizationModel extends Model{
    //根据code获取子组织结构
    public function getSonOrganization($code){
        $condition = array();
        $condition['parent_code'] = $code;
        $sonOrganization = $this->where($condition)->select();
        if($sonOrganization == null){
            $sonOrganization = array();
        }
        return $sonOrganization;
    }

    //根据组织结构code获取组织结构
    public function getOrganizationByCode($code){
        $condition = array();
        $condition['status'] = array('neq', 0);
        $condition['code'] = $code;
        return $this->where($condition)->find();
    }

    //根据组织结构负责人获取
    public function getOrganizationByLeader($leaderCode){
        $condition = array();
        $condition['status'] = array('neq', 0);
        $condition['leader_code'] = $leaderCode;
        return $this->where($condition)->find();
    }

    //获取最顶层的组织架构
    public function getTopOrganization(){
        $condition = array();
        $condition['status'] = array('neq', 0);
        $condition['parent_code'] = '';
        return $this->where($condition)->find();
    }

    public function getAllOrganization($condition){
        return $this->alias('o')->join('left join auth_user u on o.leader = u.code')->where($condition)->field('o.*,u.name as user_name')->select();
    }

    private function formatData($list,&$organization){
        foreach($list as $item){
            if($item['parent_code'] == $organization['code']){
                $children = $this->formatData($list, $item);
                $organization['children'][] = $children;
            }
        }
        return $organization;
    }

    //获取所有子部门
    public function getSonOrgCodes($appCode, $companyCode, $orgCodes, $returnCodes){
        if(empty($returnCodes)){
            $returnCodes = array();
        }
        foreach($orgCodes as $code){
            $condition = array();
            $condition['status'] = 1;
            $condition['parent_code'] = $code;
            $condition['app_code'] = $appCode;
            $condition['company_code'] = $companyCode;

            $codesTemp = $this->where($condition)->getField('code', true);
            if(!empty($codesTemp)){
                $returnCodes = array_merge($returnCodes,$codesTemp);
                $this->getSunOrgCodes($codesTemp, $returnCodes);
            }
        }
        return array_values(array_unique($returnCodes));
    }
}