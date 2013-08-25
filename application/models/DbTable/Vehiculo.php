<?php

class Application_Model_DbTable_Vehiculo extends Zend_Db_Table_Abstract
{

    protected $_name = 'vehiculos';
	
    protected $_sql = "SELECT 
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

    public function listar2()
    {
        $db = Zend_Registry::get('db');
        $stmt = $db->query($this->_sql);     
        $stmt->setFetchMode(Zend_Db::FETCH_OBJ);
        return $stmt->fetchAll();
    }
    
    //BEGIN - METDODOS DATATABLE
    public function listar($DATAGET)
    {
        
        $sLimit = $this->getLimitListar($DATAGET);
        $sOrder = $this->getOrderListar($DATAGET);
        $sWhere = $this->getWhereListar($DATAGET);        
            
        $db = Zend_Registry::get('db');	
	$stmt = $db->query($this->_sql." ".$sWhere." ".$sOrder." ".$sLimit);     
        $stmt->setFetchMode(Zend_Db::FETCH_NUM);
        return $stmt->fetchAll();		

    }
    
    public function getLimitListar($DATAGET)
    {
        
        $sLimit = "";
        
	if ( isset( $DATAGET['iDisplayStart'] ) && $DATAGET['iDisplayLength'] != '-1' )
	{
		$sLimit = "LIMIT ".intval( $DATAGET['iDisplayStart'] ).", ".
			intval( $DATAGET['iDisplayLength'] );
	}
        
        return $sLimit;
                
        
    }
    
    public function getOrderListar($DATAGET)
    {
        
        $sOrder = "";
        $aColumns = $this->getColumns();
        
	if ( isset( $DATAGET['iSortCol_0'] ) )
	{
		$sOrder = "ORDER BY  ";
		for ( $i=0 ; $i<intval( $DATAGET['iSortingCols'] ) ; $i++ )
		{
			if ( $DATAGET[ 'bSortable_'.intval($DATAGET['iSortCol_'.$i]) ] == "true" )
			{
				$sOrder .= "`".$aColumns[ intval( $DATAGET['iSortCol_'.$i] ) ]."` ".
					($DATAGET['sSortDir_'.$i]==='asc' ? 'asc' : 'desc') .", ";
			}
		}
		
		$sOrder = substr_replace( $sOrder, "", -2 );
		if ( $sOrder == "ORDER BY" )
		{
			$sOrder = "";
		}
	} 
        
        return $sOrder;
        
        
    }

    public function getWhereListar($DATAGET)
    {
        
        $sWhere = "";
        $aColumns = $this->getColumns();
        
	if ( isset($DATAGET['sSearch']) && $DATAGET['sSearch'] != "" )
	{
		$sWhere = "WHERE (";
		for ( $i=0 ; $i<count($aColumns) ; $i++ )
		{
			$sWhere .= "`".$aColumns[$i]."` LIKE '%".mysql_real_escape_string( $DATAGET['sSearch'] )."%' OR ";
		}
		$sWhere = substr_replace( $sWhere, "", -3 );
		$sWhere .= ')';
	}
	
	/* Individual column filtering */
	for ( $i=0 ; $i<count($aColumns) ; $i++ )
	{
		if ( isset($DATAGET['bSearchable_'.$i]) && $DATAGET['bSearchable_'.$i] == "true" && $DATAGET['sSearch_'.$i] != '' )
		{
			if ( $sWhere == "" )
			{
				$sWhere = "WHERE ";
			}
			else
			{
				$sWhere .= " AND ";
			}
			$sWhere .= "`".$aColumns[$i]."` LIKE '%".mysql_real_escape_string($DATAGET['sSearch_'.$i])."%' ";
		}
	}
        
        return $sWhere;	        
        
        
    }
    
    
    public function getColumns()
    {
        
        $db = Zend_Registry::get('db');	
	$stmt = $db->query($this->_sql);     
        return array_keys($stmt->fetch());		
        
    }
    
    public function countVehiculos()
    {
        
        $db = Zend_Registry::get('db');	
	$stmt = $db->query("SELECT COUNT(placa) nvehics FROM vehiculos");     
        $row = $stmt->fetch();
        return $row['nvehics'];		
        
    }
    //END - METDODOS DATATABLE  
    



}

