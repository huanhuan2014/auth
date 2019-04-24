<?php
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
    function ajaxReturn ($code,$msg,$data){
        $return = array();
        $return["code"] = $code;
        $return["msg"] = $msg;
        $return['data'] = $data;
        echo json_encode($return);
        exit;
    }
}