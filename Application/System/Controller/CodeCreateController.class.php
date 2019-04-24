<?php

namespace System\Controller;
use Think\Controller;
class CodeCreateController extends Controller{
    public function index(){
        $model = M();
        $tables = $model->db()->getTables();
        $table_name = I('param.table_name');
        if(!empty($table_name)){
            $this->assign('table_name', $table_name);
            $sql = 'select * from information_schema.columns where table_schema = \'auth\' and table_name =\''.$table_name.'\'';
            $fields = $model->query($sql);
            $this->assign('fields', $fields);
            //var_dump($fields);
        }
        $this->assign('tables', $tables);
        $this->display();
    }
}