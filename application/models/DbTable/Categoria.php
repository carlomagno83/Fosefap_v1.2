<?php

class Application_Model_DbTable_Categoria extends Zend_Db_Table_Abstract
{

    protected $_name = 'categorias';
	
	/**
     * devuelve un arreglo con los datos de la categoria con id=$id
     * @param  $id id de la categoria
     * @return  arreblo asociativo
     */

	public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcategoria = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }

    public function agregar ($nombre)  
    {
        $data = array ('nombre'=>$nombre);
		$this->insert($data);
    }
    
    public function cambiar($idcategoria,$nombre)
	    {
		
    	$data = array ('nombre'=>$nombre);
		$this->update($data, 'idcategoria = ' . (int) $idcategoria);
    }

    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcategoria =' . (int) $id);
    }
		
    public function listar()
    {
        return $this->fetchAll();
    }
}

