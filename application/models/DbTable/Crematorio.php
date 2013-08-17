<?php

class Application_Model_DbTable_Crematorio extends Zend_Db_Table_Abstract
{

    protected $_name = 'crematorios';


	public function get($id)
    {
        $id = (int) $id;
        //$this->fetchRow devuelve fila donde id = $id
        $row = $this->fetchRow('idcrematorio = ' . $id);
        if (!$row)
        {
            throw new Exception("Could not find row $id");
        }
        return $row->toArray();
    }


    public function agregar ($RUC,$nombre,$direccion,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion)  
    {
        $data = array ('RUC'=>$RUC,
					   'nombre'=>$nombre,
					   'direccion'=>$direccion,
					   'iddistrito'=>$iddistrito,
					   'telefono_fijo'=>$telefono_fijo,
					   'telefono_celular'=>$telefono_celular,
					   'mail'=>$mail,
					   'costo'=>$costo,
					   'observacion'=>$observacion);
		
	    $this->insert($data);
    }

    
    public function cambiar($idcrematorio,$RUC,$nombre,$direccion,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion)
	    {
		
    	 $data = array ('RUC'=>$RUC,
					   'nombre'=>$nombre,
					   'direccion'=>$direccion,
					   'iddistrito'=>$iddistrito,
					   'telefono_fijo'=>$telefono_fijo,
					   'telefono_celular'=>$telefono_celular,
					   'mail'=>$mail,
					   'costo'=>$costo,
					   'observacion'=>$observacion);
		
        $this->update($data, 'idcrematorio = ' . (int) $idcrematorio);
    }


    public function borrar($id)
    {
        $this->delete('idcrematorio =' . (int) $id);
    }

    public function listar()
    {
        return $this->fetchAll();
    }

    public function listarxnombre($codigo)
    {
        return $this->fetchAll("nombre like '%".$codigo."%'");
    }

    public function listarxruc($codigo)
    {        
        return $this->fetchAll("RUC like '%".$codigo."%'");        
    }
    
    
}
	
