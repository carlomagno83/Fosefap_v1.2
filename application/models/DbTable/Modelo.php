<?php

class Application_Model_DbTable_Modelo extends Zend_Db_Table_Abstract
{

    protected $_name = 'modelos';

	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idmodelo = ' . $id);
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
    
    public function cambiar($idmodelo,$nombre)
	    {
		
    	$data = array ('nombre'=>$nombre);
		$this->update($data, 'idmodelo = ' . (int) $idmodelo);
    }

    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idmodelo =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }

}

