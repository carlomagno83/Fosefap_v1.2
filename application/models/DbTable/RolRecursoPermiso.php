<?php

class Application_Model_DbTable_RolRecursoPermiso extends Zend_Db_Table_Abstract
{

    protected $_name = 'rol_recurso_permiso';
    
    private $_sql = "SELECT role,recurso,permiso,'xx' FROM rol_recurso_permiso";
    
    
    public function listar(){
        
        return $this->fetchAll();
        
    }
        
    public function agregar ($role,$recurso,$permiso)  
    {
        $data = array ( 'role'=>$role,
                        'recurso'=>$recurso,
                        'permiso'=>$permiso
                       );
        
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
	$stmt = $db->query("SELECT COUNT(*) nperm FROM rol_recurso_permiso");     
        $row = $stmt->fetch();
        return $row['nperm'];		
        
    }
    //END - METDODOS DATATABLE  
    
    
}

