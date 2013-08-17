<?php

class Application_Model_DbTable_Tipocandelabro extends Zend_Db_Table_Abstract
{

    protected $_name = 'TipoCandelabros';
	
	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idtipoCandelabros = ' . $id);
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
    		
    public function cambiar($idtipoCandelabros,$nombre,$observacion)
	    {
		   		
		$data = array (	'nombre'=>$nombre,
						'observacion'=>$observacion);
		
		$this->update($data, 'idtipoCandelabros = ' . (int) $idtipoCandelabros);
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idtipoCandelabros =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }


}

