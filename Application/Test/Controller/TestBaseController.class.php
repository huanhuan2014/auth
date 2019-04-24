<?php

namespace Test\Controller;
use Think\Controller;
class TestBaseController extends Controller{
    public function index(){
        $json = "[{\"geo_id\":\"5400\",\"geo_name\":\"Default Mapping\",\"protocol\":\"http\",\"pop\":\"hongkong\",\"lb_type\":\"ha\",\"port\":[\"80\"],\"geo_domain\":\"testapi1.stagedns.top\",\"pop_name\":\"\u9999\u6e2f\",\"balancer\":\"roundrobin\",\"server_ip\":[\"192.168.0.0\"]},{\"geo_id\":\"3131\",\"geo_name\":\"bj\",\"protocol\":\"http\",\"pop\":\"hongkong\",\"lb_type\":\"nginx\",\"port\":[\"80\"],\"geo_domain\":\"jwang.stagedns.top\",\"pop_name\":\"\u9999\u6e2f\",\"balancer\":\"roundrobin\",\"server_ip\":[\"192.168.0.0\"]},{\"geo_id\":\"3132\",\"geo_name\":\"js\",\"protocol\":\"http\",\"pop\":\"hongkong\",\"lb_type\":\"nginx\",\"port\":[\"80\"],\"geo_domain\":\"test.stagedns.top\",\"pop_name\":\"\u9999\u6e2f\",\"balancer\":\"roundrobin\",\"server_ip\":[\"192.168.0.0\"]},{\"geo_id\":\"3133\",\"geo_name\":\"sh\",\"protocol\":\"http\",\"pop\":\"hongkong\",\"lb_type\":\"ha\",\"port\":[\"80\"],\"geo_domain\":\"test.jason.stagedns.top\",\"pop_name\":\"\u9999\u6e2f\",\"balancer\":\"roundrobin\",\"server_ip\":[\"192.168.0.0\"]}]";  
        $datas = json_decode($json, true);
        //同一个geo_id,lb模式，pop，统计在一起
        $temps = array();
        foreach($datas as $data){
            $flag = false;//标记该，条数据是否被统计到
            $portInfoTempArr = array();
            foreach($data['port'] as $port){
                $is_ssl = $port == 443 ? 1 : 0;
                $portInfoTemp = array('port'=>$port, 'protocol'=>$data['protocol'], 'is_ssl'=>$is_ssl);
                $portInfoTempArr[] = $portInfoTemp;
                $portIsIn = false;//标记是否包含端口
                foreach($temps as &$temp){
                    if($temp['pop_name'] != $data['pop_name'] || $data['geo_id'] != $temp['geo_id'] || $data['lb_type'] != $temp['lb_type']){
                        continue;
                    }
                    $flag = true;
                    if(empty($temp['port_infos'])){
                        $temp['port_infos'] = array();
                    }
                    foreach($temp['port_infos'] as $portInfo){
                        if($port == $portInfo['port']){
                            $portIsIn = true;
                            break;
                        }
                    }
                    if(!portIsIn){
                        $temp['port_infos'][] = $portInfoTemp;
                        break;
                    }   
                }    
                unset($temp);
            }
            if(!$flag){
                $temps[] = array('pop_name'=>$data['pop_name'], 'geo_id'=>$data['geo_id'], 'lb_type'=>$data['lb_type'], 'port_infos'=>$portInfoTempArr);
            }
        }

        //筛选相同的机房lb模式，pop，port_infos统计在一起
        $datas = array();
        foreach($temps as $temp){
            $flag = true;
            foreach($temp['port_infos'] as $port_info){
                $portIsIn = false;
                foreach($datas as $data){
                    if($temp['pop_name'] != $data['pop_name'] || $temp['lb_type'] != $data['lb_type']){
                        continue;
                    }
                    foreach($data['port_infos'] as $port_infos_temp){
                        if($port_info['port'] == $port_infos_temp['port'] && $port_info['protocol'] == $port_infos_temp['protocol']){
                            $portIsIn = true;
                            break;
                        }
                    }
                }
                if(!$portIsIn){
                    $flag = false;
                    break;
                }
            }
            if(!$flag){
                $datas[] = $temp;
            }
        }
        var_dump($datas, $datas['0'], $datas['1']);
    }
}