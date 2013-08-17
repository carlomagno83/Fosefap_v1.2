<?php

class Application_Model_DbTable_TamanoAtaud extends Zend_Db_Table_Abstract
{

    protected $_name = 'TamanoAtaudes';
	
	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idtamanoAtaudes = ' . $id);
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
    		
    public function cambiar($idtamanoAtaudes,$nombre,$observacion)
	    {
		   		
		$data = array (	'nombre'=>$nombre,
						'observacion'=>$observacion);
		
		$this->update($data, 'idtamanoAtaudes = ' . (int) $idtamanoAtaudes);
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idtamanoAtaudes =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }


	


}

