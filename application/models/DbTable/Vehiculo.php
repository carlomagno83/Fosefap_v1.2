<?php

class Application_Model_DbTable_Vehiculo extends Zend_Db_Table_Abstract
{

    protected $_name = 'vehiculos';
	
	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {

        $row = $this->fetchRow("placa = '" . $id."'");

        if (!$row)
        {
            throw new Exception("No existe placa $id");
        }
        
        return $row->toArray();
    }

    public function agregar ($placa,$idmarca,$idmodelo,$idtipo,$idcolor,$idcombustible,$motor,$serie,$pasajero,$asiento,$FechaFab,$observacion)  
    {
        	
		$data = array ('placa'=>$placa,
						'idmarca'=>$idmarca,
					    'idmodelo'=>$idmodelo,
						'idtipo'=>$idtipo,
						'idcolor'=>$idcolor,
						'idcombustible'=>$idcombustible,
						'motor'=>$motor,
						'serie'=>$serie,
						'pasajero'=>$pasajero,
						'asiento'=>$asiento,
						'FechaFab'=>$FechaFab,
						'observacion'=>$observacion);
						
		//die( var_dump($data) );			
						
		$this->insert($data);
		
	}
    		
    public function cambiar($placa,$idmarca,$idmodelo,$idtipo,$idcolor,$idcombustible,$motor,$serie,$pasajero,$asiento,$FechaFab,$observacion)
    {
		   		
		$data = array ('idmarca'=>$idmarca,
					   'idmodelo'=>$idmodelo,
						'idtipo'=>$idtipo,
						'idcolor'=>$idcolor,
						'idcombustible'=>$idcombustible,
						'motor'=>$motor,
						'serie'=>$serie,
						'pasajero'=>$pasajero,
						'asiento'=>$asiento,
						'FechaFab'=>$FechaFab,
						'observacion'=>$observacion);
		
		$this->update($data, "placa = '" . $placa."'");
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id              
        $this->delete("placa = '" . $id."'");
        
    }

    public function listar()
    {
        $db = Zend_Registry::get('db');
        $SQL = "SELECT 
				a.placa,
				b.nombre as marca,
				c.nombre as modelo,
				d.nombre as tipo,
				e.nombre as color,
				f.nombre as combustible,
				a.motor,
				a.serie,
				a.pasajero,
				a.asiento,
				a.FechaFab,
				a.observacion
				FROM vehiculos as a
					left join marcas as b on a.idmarca = b.idmarca 
					left join modelos as c on a.idmodelo = c.idmodelo 
					left join tipos as d on a.idtipo = d.idtipo 
					left join colores as e on a.idcolor = e.idcolor
					left join combustibles as f on a.idcombustible = f.idcombustible";
        $stmt = $db->query($SQL);     
        $stmt->setFetchMode(Zend_Db::FETCH_OBJ);
        return $stmt->fetchAll();
    }



}

