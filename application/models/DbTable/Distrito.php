<?php

class Application_Model_DbTable_Distrito extends Zend_Db_Table_Abstract
{

    protected $_name = 'distritos';

	public function listar(){
	
		return $this->fetchAll();
		
	}
	
	public function listarFiltroDistritos($codigo){
		
		return $this->fetchAll('idprovincia = '.$codigo);	
	
	}	
}

