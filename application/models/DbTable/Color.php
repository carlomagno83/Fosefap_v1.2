<?php

class Application_Model_DbTable_Color extends Zend_Db_Table_Abstract
{

    protected $_name = 'colores';
	
	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcolor = ' . $id);
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
    
    public function cambiar($idcolor,$nombre)
	    {
		
    	$data = array ('nombre'=>$nombre);
		$this->update($data, 'idcolor = ' . (int) $idcolor);
    }

    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcolor =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }



}

