<?php

class Application_Model_DbTable_Ubprovincia extends Zend_Db_Table_Abstract
{

    protected $_name = 'ubprovincia';
	
	public function listar(){
	
		return $this->fetchAll();
	
	}


}

