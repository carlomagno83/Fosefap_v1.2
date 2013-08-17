<?php

class Application_Model_DbTable_Ataud extends Zend_Db_Table_Abstract
{

    protected $_name = 'Ataudes';

/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idataud = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }

    public function agregar ($idmodeloAtaudes,$idtamanoAtaudes,$idcolor,$observacion)  
    {
        	
		$data = array ('idmodeloAtaudes'=>$idmodeloAtaudes,
					   'idtamanoAtaudes'=>$idtamanoAtaudes,
					   'idcolor'=>$idcolor,
					   'observacion'=>$observacion);
						
		$this->insert($data);
		
	}
    		
    public function cambiar($idataud,$idmodeloAtaudes,$idtamanoAtaudes,$idcolor,$observacion)
	{
		   		
		$data = array ('idmodeloAtaudes'=>$idmodeloAtaudes,
					   'idtamanoAtaudes'=>$idtamanoAtaudes,
					   'idcolor'=>$idcolor,
					   'observacion'=>$observacion);
		
		$this->update($data, 'idataud = ' . (int) $idataud);
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idataud =' . (int) $id);
    }

    public function listar()
    {
        $db = Zend_Registry::get('db');
        $SQL = "SELECT 
				b.nombre as modelo,
				c.nombre as tamano,
				d.nombre as color,
				a.observacion
				FROM ataudes as a
					left join modeloataudes as b on a.idmodeloAtaudes = b.idmodeloAtaudes 
					left join tamanoataudes as c on a.idtamanoAtaudes = c.idtamanoAtaudes 
					left join colores as d on a.idcolor = d.idcolor";
					
        $stmt = $db->query($SQL);     
        $stmt->setFetchMode(Zend_Db::FETCH_OBJ);
        return $stmt->fetchAll();
    }
	
	

}

