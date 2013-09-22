<?php

class Application_Model_DbTable_Rol extends Zend_Db_Table_Abstract
{

    protected $_name = 'roles';

    public function listar(){
        
        return $this->fetchAll();
        
    }
}

