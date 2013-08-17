<?php

class Application_Model_DbTable_Provincia extends Zend_Db_Table_Abstract
{

    protected $_name = 'provincias';

	public function listar(){
	
		return $this->fetchAll();
		
	}
	
	public function listarFiltro($codigo){
		
		return $this->fetchAll('iddepartamento = '.$codigo);	
	
	}
	
}

