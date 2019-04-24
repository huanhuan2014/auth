<?php
/**
 * Created by PhpStorm.
 * User: sqluogui
 * Date: 2018/4/2
 * Time: 11:29
 */

namespace Auth\Model;


use Think\Model;

class AuthSysDataModel extends Model{
    /**
     * @param $type string 数据字典类型
     * @param $showDel boolean 是否返回已经弃用数据
     * @return array
     */
    public function getSysDataByType($type, $showDel = false){
        $condition = array();
        $condition['type'] = $type;
        if(!$showDel){
            $condition['status'] = 1;
        }
        $list = $this->where($condition)->select();
        return $list;
    }
}