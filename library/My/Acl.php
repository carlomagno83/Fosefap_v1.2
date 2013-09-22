<?php
/*
 * library/My/Acl.php
 * Extiende Zend_Acl para nuestro sitio web
*/

require_once 'models/DbTable/Rol.php';
require_once 'models/DbTable/Recurso.php';
require_once 'models/DbTable/Permiso.php';
require_once 'models/DbTable/RolRecursoPermiso.php';
require_once 'models/DbTable/RolTieneRecurso.php';


class My_Acl extends Zend_Acl
{
	public function __construct()
	{
                                           
                //roles
                $roles = array();
                $obj = new Application_Model_DbTable_Rol();                
                foreach ($obj->listar() as $value) {$roles[] = $value->role;}
                                
                foreach ($roles as $value){
                       
                    $this->addRole(new Zend_Acl_Role($value));
                    
                }
                
                
                //recursos                                
                $resources = array();
                $obj = new Application_Model_DbTable_Recurso();                
                foreach ($obj->listar() as $value) {$resources[] = $value->recurso;}

                
                foreach ($resources as $value) {
                    
                    $this->add(new Zend_Acl_Resource($value));                                               
                    
                }
                                
 
                //$rol_recurso_permiso
                $rol_recurso_permiso = array();
                $obj = new Application_Model_DbTable_RolRecursoPermiso();
                $i = 0;
                foreach ($obj->listar() as $value) {
                    $rol_recurso_permiso[$i]['rol'] = $value->role;                    
                    $rol_recurso_permiso[$i]['permiso'] = $value->permiso;                    
                    $rol_recurso_permiso[$i]['recurso'] = $value->recurso;                                        
                $i++;    
                }                
                                          
                
                foreach ($rol_recurso_permiso as $value) {
                    
                    $this->allow($value['rol'],$value['recurso'],$value['permiso']);                        
                        
                }
                
                
                
				
    }
}



