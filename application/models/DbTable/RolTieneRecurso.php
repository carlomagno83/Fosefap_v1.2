<?php

class Application_Model_DbTable_RolTieneRecurso extends Zend_Db_Table_Abstract
{

    protected $_name = 'rol_tiene_recurso';

    public function listar(){
        
        return $this->fetchAll();
        
    }
}

