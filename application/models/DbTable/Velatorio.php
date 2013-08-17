<?php   

class Application_Model_DbTable_Velatorio extends Zend_Db_Table_Abstract
{

    protected $_name = 'velatorios';
 /**
     * devuelve un arreglo con los datos del album con id=$id
     * @param  $id id del album
     * @return  arreblo asociativo
     */
    public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idvelatorio = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }


    public function agregar ($RUC,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion)  
    {
        $data = array ('RUC'=>$RUC,
					   'nombre'=>$nombre,
					   'direccion'=>$direccion,
					   'iddepartamento'=>$iddepartamento,
					   'idprovincias'=>$idprovincias,
					   'iddistrito'=>$iddistrito,
					   'telefono_fijo'=>$telefono_fijo,
					   'telefono_celular'=>$telefono_celular,
					   'mail'=>$mail,
					   'costo'=>$costo,
					   'observacion'=>$observacion);
		
	    $this->insert($data);
    }

    
    public function cambiar($idvelatorio,$RUC,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion)
	    {
		
    	 $data = array ('RUC'=>$RUC,
					   'nombre'=>$nombre,
					   'direccion'=>$direccion,
					   'iddepartamento'=>$iddepartamento,
					   'idprovincias'=>$idprovincias,
					   'iddistrito'=>$iddistrito,
					   'telefono_fijo'=>$telefono_fijo,
					   'telefono_celular'=>$telefono_celular,
					   'mail'=>$mail,
					   'costo'=>$costo,
					   'observacion'=>$observacion);
		
        $this->update($data, 'idvelatorio = ' . (int) $idvelatorio);
    }


    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idvelatorio =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }

}

