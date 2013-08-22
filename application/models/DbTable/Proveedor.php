<?php

class Application_Model_DbTable_Proveedor extends Zend_Db_Table_Abstract
{

    protected $_name = 'proveedores';

    private $_sql = "SELECT
		proveedores.RUC,
		categorias.nombre categoria,
		#categorias.idcategoria,                
		proveedores.nombre,
		proveedores.direccion,
		departamentos.nombre departamento,
		#departamentos.iddepartamento,                
		provincias.nombres provincia,
		#provincias.idprovincia idprovincias,                
		distritos.nombre distrito,
		#distritos.iddistrito,                
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
	
        $stmt = $db->query($this->_sql." WHERE RUC = '" . $id."' ");
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

    public function listar()
    {
		
        $db = Zend_Registry::get('db');	
	$stmt = $db->query($this->_sql);     
        $stmt->setFetchMode(Zend_Db::FETCH_NUM);
        return $stmt->fetchAll();
		

    }

    public function listarxnombre($codigo)
    {
	
	$db = Zend_Registry::get('db');	
	$stmt = $db->query($this->_sql." WHERE proveedores.nombre like ? ", array("%".$codigo."%"));     
    $stmt->setFetchMode(Zend_Db::FETCH_OBJ);        
    return $stmt->fetchAll();			
    //return $this->fetchAll("nombre like '%".$codigo."%'");
    }

    public function listarxruc($codigo)
    {
        $db = Zend_Registry::get('db');	
		$stmt = $db->query($this->_sql." WHERE RUC = ? ", array($codigo));     
        $stmt->setFetchMode(Zend_Db::FETCH_OBJ);
        return $stmt->fetchAll();                
        
    }	

}

