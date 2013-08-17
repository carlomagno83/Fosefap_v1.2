<?php

class Application_Model_DbTable_Departamento extends Zend_Db_Table_Abstract
{

    protected $_name = 'departamentos';

	
	public function listar(){
	
		return $this->fetchAll();
		
	}

}

