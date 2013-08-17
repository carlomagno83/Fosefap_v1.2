<?php

class Application_Model_DbTable_ModeloAtaud extends Zend_Db_Table_Abstract
{

    protected $_name = 'ModeloAtaudes';

	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idmodeloAtaudes = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }

    public function agregar ($nombre,$observacion)  
    {
        	
		$data = array (	'nombre'=>$nombre,
						'observacion'=>$observacion);
						
		$this->insert($data);
		
	}
    		
    public function cambiar($idmodeloAtaudes,$nombre,$observacion)
	    {
		   		
		$data = array (	'nombre'=>$nombre,
						'observacion'=>$observacion);
		
		$this->update($data, 'idmodeloAtaudes = ' . (int) $idmodeloAtaudes);
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idmodeloAtaudes =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }


	

}

