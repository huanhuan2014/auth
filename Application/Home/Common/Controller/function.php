<?php

//ajax 返回数据，$code 编号正确为1，错误未0，$msg返回内容
//返回json串
function ajaxReturn ($code,$data=array(),$msg=''){
    $return = array();
    $return["code"] = $code;
    $return["msg"] = $msg;
    $return['data'] = $data;
    echo json_encode($return);
    exit;
}