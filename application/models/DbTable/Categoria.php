<?php

class Application_Model_DbTable_Categoria extends Zend_Db_Table_Abstract
{

    protected $_name = 'categorias';
	
    private $_sql = "SELECT idcategoria,nombre,'xx'
                    FROM
                    categorias";	
    
    private $_sql2 = "SELECT idcategoria,nombre
                    FROM
                    categorias";	

    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcategoria = ' . $id);
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
    
    public function cambiar($idcategoria,$nombre)
	    {
		
    	$data = array ('nombre'=>$nombre);
		$this->update($data, 'idcategoria = ' . (int) $idcategoria);
    }

    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcategoria =' . (int) $id);
    }
		
    public function listar()
    {
        $db = Zend_Registry::get('db');	
	$stmt = $db->query($this->_sql2);     
        $stmt->setFetchMode(Zend_Db::FETCH_ASSOC);
        return $stmt->fetchAll();	
    }
    
    
    //BEGIN - METDODOS DATATABLE
    public function listar2($DATAGET)
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
	$stmt = $db->query("SELECT COUNT(*) nctg FROM categorias");     
        $row = $stmt->fetch();
        return $row['nctg'];		
        
    }
    //END - METDODOS DATATABLE  
    
    
}

