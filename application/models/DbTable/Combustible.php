<?php

class Application_Model_DbTable_Combustible extends Zend_Db_Table_Abstract
{

    protected $_name = 'combustibles';

	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcombustible = ' . $id);
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
    
    public function cambiar($idcombustible,$nombre)
	    {
		
    	$data = array ('nombre'=>$nombre);
		$this->update($data, 'idcombustible = ' . (int) $idcombustible);
    }

    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcombustible =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();       
    }

	

}

