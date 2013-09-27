<?php

class Application_Model_DbTable_Proveedor extends Zend_Db_Table_Abstract
{

    protected $_name = 'proveedores';

    private $_sql = "SELECT
		proveedores.RUC,
		categorias.nombre categoria,
		proveedores.nombre,
		proveedores.direccion,
		departamentos.nombre departamento,
		provincias.nombres provincia,
		distritos.nombre distrito,
		proveedores.telefono_fijo,
                'xx'
		FROM
		proveedores
		INNER JOIN categorias ON proveedores.idcategoria = categorias.idcategoria
		INNER JOIN distritos ON proveedores.iddistrito = distritos.iddistrito
		INNER JOIN provincias ON distritos.idprovincia = provincias.idprovincia
		INNER JOIN departamentos ON provincias.iddepartamento = departamentos.iddepartamento";	
    
    
    private $_sql2 = "SELECT
		proveedores.RUC,
		categorias.nombre categoria,
		categorias.idcategoria,                
		proveedores.nombre,
		proveedores.direccion,
		departamentos.nombre departamento,
		departamentos.iddepartamento,                
		provincias.nombres provincia,
		provincias.idprovincia idprovincias,                
		distritos.nombre distrito,
		distritos.iddistrito,                
		proveedores.telefono_fijo,
		proveedores.telefono_celular,
		proveedores.mail,
		proveedores.costo,
		proveedores.observacion,
		proveedores.user,
		proveedores.fecha
		FROM
		proveedores
		INNER JOIN categorias ON proveedores.idcategoria = categorias.idcategoria
		INNER JOIN distritos ON proveedores.iddistrito = distritos.iddistrito
		INNER JOIN provincias ON distritos.idprovincia = provincias.idprovincia
		INNER JOIN departamentos ON provincias.iddepartamento = departamentos.iddepartamento";	    
    
    private $_sql3 = "SELECT
		proveedores.RUC,
		categorias.nombre categoria,
		proveedores.nombre,
		proveedores.direccion,
		departamentos.nombre departamento,
		provincias.nombres provincia,
		distritos.nombre distrito,
		proveedores.telefono_fijo
		FROM
		proveedores
		INNER JOIN categorias ON proveedores.idcategoria = categorias.idcategoria
		INNER JOIN distritos ON proveedores.iddistrito = distritos.iddistrito
		INNER JOIN provincias ON distritos.idprovincia = provincias.idprovincia
		INNER JOIN departamentos ON provincias.iddepartamento = departamentos.iddepartamento";	
    
    public function get($id)
    {

        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow("RUC = '" . $id."' ");
        
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }
    
    
    public function get2($id)
    {

        $db = Zend_Registry::get('db');	
	
        $stmt = $db->query($this->_sql2." WHERE RUC = '" . $id."' ");
        if (!$stmt)
        {
            throw new Exception("Could not find row $id");
        }
        
        return $stmt->fetch();

    }    


    public function agregar ($RUC,$nombre,$direccion,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion,$idcategoria)  
    {
        $data = array ('RUC'=>$RUC,
					   'nombre'=>$nombre,
					   'direccion'=>$direccion,
					   'iddistrito'=>$iddistrito,
					   'telefono_fijo'=>$telefono_fijo,
					   'telefono_celular'=>$telefono_celular,
					   'mail'=>$mail,
					   'costo'=>$costo,
					   'observacion'=>$observacion,
					   'idcategoria'=>$idcategoria);
        
        try {
        $this->insert($data);
        } catch (Exception $e) {
            
        $redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('redirector');
        $redirector->gotoSimple('error',
                                'error', 
                                null,
                                array('error_handler' => $e->getMessage()));                   

            
        }       
          
      
    }

    
    public function cambiar($RUC,$nombre,$direccion,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion,$idcategoria)
    {
		
    	 $data = array ('nombre'=>$nombre,
					   'direccion'=>$direccion,
					   'iddistrito'=>$iddistrito,
					   'telefono_fijo'=>$telefono_fijo,
					   'telefono_celular'=>$telefono_celular,
					   'mail'=>$mail,
					   'costo'=>$costo,
					   'observacion'=>$observacion,
					   'idcategoria'=>$idcategoria);
					   		
        $this->update($data, "RUC = '" .$RUC."'");
    }


    public function borrar($id)
    {
        $this->delete("RUC = '" .$id."'"  );
    }
    
    
    public function listar2()
    {
        
        $db = Zend_Registry::get('db');		
        $stmt = $db->query($this->_sql3); 
        $stmt->setFetchMode(Zend_Db::FETCH_ASSOC);        
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
		$sWhere = "HAVING (";
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
				$sWhere = "HAVING ";
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
    
    public function countProveedores()
    {
        
        $db = Zend_Registry::get('db');	
	$stmt = $db->query("SELECT COUNT(RUC) nprovs FROM proveedores");     
        $row = $stmt->fetch();
        return $row['nprovs'];		
        
    }
    //END - METDODOS DATATABLE  

}

