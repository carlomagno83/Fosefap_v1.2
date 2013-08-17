<?php

class Application_Model_DbTable_Candelabro extends Zend_Db_Table_Abstract
{

    protected $_name = 'candelabros';
	
	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcandelabros = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }

    public function agregar ($idtipoCandelabros,$observacion)  
    {
        	
		$data = array (	'idtipoCandelabros'=>$idtipoCandelabros,
						'observacion'=>$observacion);
						
		$this->insert($data);
		
	}
    		
    public function cambiar($idcandelabros,$idtipoCandelabros,$observacion)
	    {
		   		
		$data = array (	'idtipoCandelabros'=>$idtipoCandelabros,
						'observacion'=>$observacion);
		
		$this->update($data, 'idcandelabros = ' . (int) $idcandelabros);
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcandelabros =' . (int) $id);
    }

    public function listar()
    {
        $db = Zend_Registry::get('db');
        $SQL = "SELECT 
				a.idcandelabros,
				b.nombre as tipo,
				a.observacion
				FROM candelabros as a
				left join tipocandelabros as b on a.idtipoCandelabros = b.idtipoCandelabros";
					
        $stmt = $db->query($SQL);     
        $stmt->setFetchMode(Zend_Db::FETCH_OBJ);
        return $stmt->fetchAll();
    }

}

