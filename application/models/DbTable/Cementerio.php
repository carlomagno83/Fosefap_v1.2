<?php

class Application_Model_DbTable_Cementerio extends Zend_Db_Table_Abstract
{

    protected $_name = 'cementerios';
	
	public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcementerio = ' . $id);
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

    
    public function cambiar($idcementerio,$RUC,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion)
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
		
        $this->update($data, 'idcementerio = ' . (int) $idcementerio);
    }


    public function borrar($id)
    {
        //$this->delete borrar album donde id=$id
        $this->delete('idcementerio =' . (int) $id);
    }

    public function listar()
    {
        //devuelve todos los registros de la tabla
        return $this->fetchAll();
    }



}

