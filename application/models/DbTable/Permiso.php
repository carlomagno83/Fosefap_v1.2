<?php

class Application_Model_DbTable_Permiso extends Zend_Db_Table_Abstract
{

    protected $_name = 'permisos';

    public function listar(){
        
        return $this->fetchAll();
        
    }    

}

