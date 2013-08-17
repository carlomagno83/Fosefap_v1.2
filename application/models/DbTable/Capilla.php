<?php

class Application_Model_DbTable_Capilla extends Zend_Db_Table_Abstract
{

    protected $_name = 'capillas';
	
	/**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcapilla = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }

    public function agregar ($idataud,$idcandelabros,$manto,$cristo,$velas,$flamas,$alfombra,$letrero,$tarjetero,$observacion)  
    {
        	
		$data = array ('idataud'=>$idataud,
					    'idcandelabros'=>$idcandelabros,
					    'manto'=>$manto,
					    'cristo'=>$cristo,
						'velas'=>$velas,
						'flamas'=>$flamas,
						'alfombra'=>$alfombra,
						'letrero'=>$letrero,
						'tarjetero'=>$tarjetero,
						'observacion'=>$observacion);
						
		$this->insert($data);
		
	}
    		
    public function cambiar($idcapilla,$idataud,$idcandelabros,$manto,$cristo,$velas,$flamas,$alfombra,$letrero,$tarjetero,$observacion)
	    {
		   		
		$data = array ('idataud'=>$idataud,
					    'idcandelabros'=>$idcandelabros,
					    'manto'=>$manto,
					    'cristo'=>$cristo,
						'velas'=>$velas,
						'flamas'=>$flamas,
						'alfombra'=>$alfombra,
						'letrero'=>$letrero,
						'tarjetero'=>$tarjetero,
						'observacion'=>$observacion);
		
		$this->update($data, 'idcapilla = ' . (int) $idcapilla);
    }
	
    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcapilla =' . (int) $id);
    }

    public function listar()
    {
				
	$db = Zend_Registry::get('db');
        $SQL = "SELECT
capillas.idcapilla,
capillas.manto,
capillas.cristo,
capillas.velas,
capillas.flamas,
capillas.alfombra,
capillas.letrero,
capillas.tarjetero,
capillas.observacion,
capillas.idcandelabros,
capillas.ataudes_idcolor,
capillas.ataudes_idmodeloAtaudes,
capillas.ataudes_idtamanoAtaudes,
candelabros.idcandelabros,
candelabros.observacion,
candelabros.idtipoCandelabros,
tipocandelabros.idtipoCandelabros,
tipocandelabros.nombre,
tipocandelabros.observacion,
ataudes.idcolor,
ataudes.idmodeloAtaudes,
ataudes.idtamanoAtaudes,
ataudes.observacion,
modeloataudes.idmodeloAtaudes,
modeloataudes.nombre,
modeloataudes.observacion,
tamanoataudes.idtamanoAtaudes,
tamanoataudes.nombre,
tamanoataudes.observacion,
colores.idcolor,
colores.nombre
FROM
capillas
INNER JOIN candelabros ON capillas.idcandelabros = candelabros.idcandelabros
INNER JOIN tipocandelabros ON candelabros.idtipoCandelabros = tipocandelabros.idtipoCandelabros
INNER JOIN ataudes ON capillas.ataudes_idcolor = ataudes.idcolor AND capillas.ataudes_idmodeloAtaudes = ataudes.idmodeloAtaudes AND capillas.ataudes_idtamanoAtaudes = ataudes.idtamanoAtaudes
INNER JOIN modeloataudes ON ataudes.idmodeloAtaudes = modeloataudes.idmodeloAtaudes
INNER JOIN tamanoataudes ON ataudes.idtamanoAtaudes = tamanoataudes.idtamanoAtaudes
INNER JOIN colores ON ataudes.idcolor = colores.idcolor";
					
		$stmt = $db->query($SQL);     
        $stmt->setFetchMode(Zend_Db::FETCH_OBJ);
        return $stmt->fetchAll();
		
		
		
    }

}

