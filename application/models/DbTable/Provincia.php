<?php

class Application_Model_DbTable_Provincia extends Zend_Db_Table_Abstract
{

    protected $_name = 'provincias';
    protected $_sql = " SELECT idprovincia,nombres,iddepartamento FROM provincias ";

	public function listar2()
        {
	
		return $this->fetchAll();
		
	}
	
	public function listarFiltro($codigo)
        {
		
		return $this->fetchAll('iddepartamento = '.$codigo);	
	
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
            $aColumns = $this->info(Zend_Db_Table_Abstract::COLS);

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
            $aColumns = $this->info(Zend_Db_Table_Abstract::COLS);

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


        public function countProvincias()
        {

            $db = Zend_Registry::get('db');	
            $stmt = $db->query("SELECT COUNT(idprovincia) nprovs FROM provincias");     
            $row = $stmt->fetch();
            return $row['nprovs'];		

        }
        //END - METDODOS DATATABLE    
        
        
	
}

