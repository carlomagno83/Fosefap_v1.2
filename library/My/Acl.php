<?php
/*
 * library/My/Acl.php
 * Extiende Zend_Acl para nuestro sitio web
*/
class My_Acl extends Zend_Acl
{
	public function __construct()
	{
                           
                //PERMISOS POR RECURSO
                
                //ROLES
                $ROL1 = 'alumno';
                $ROL2 = 'profesor';
                $ROL3 = 'admin';
                $ROL4 = 'secretaria';
                
                $this->addRole(new Zend_Acl_Role($ROL1));
                $this->addRole(new Zend_Acl_Role($ROL2));
                $this->addRole(new Zend_Acl_Role($ROL3));
                $this->addRole(new Zend_Acl_Role($ROL4));
                
                
                //RECURSOS Y PRIVILEGIOS
            
                //Recurso Cementerios
                $resource1 = 'error';                
		$this->add(new Zend_Acl_Resource($resource1));                                                
                $this->allow($ROL1,$resource1);
                $this->allow($ROL2,$resource1);
                $this->allow($ROL3,$resource1);                                
                $this->allow($ROL4,$resource1);                                                
                
                
                //Recurso Cementerios
                $resource2 = 'categoria';                
		$this->add(new Zend_Acl_Resource($resource2));                                                
                $this->allow($ROL1,$resource2,array('index'));
                $this->allow($ROL2,$resource2,array('index'));
                $this->allow($ROL3,$resource2,array('index','add','delete','update'));                                
                $this->allow($ROL4,$resource2,array('index','add','delete','update'));                                                
                                                              
                //Recurso Crematorios
                $resource3 = 'proveedor';                                
		$this->add(new Zend_Acl_Resource($resource3));                                                
                $this->allow($ROL1,$resource3,array('index'));
                $this->allow($ROL2,$resource3,array('index'));
                $this->allow($ROL3,$resource3,array('index','add','delete','update','listarprov','listardistri','busquedaxnombre','busquedaxruc','exportarpdf','exportarpd','listarproveedores'));                                
                $this->allow($ROL4,$resource3,array('index','add','delete','update'));                                               
                                                                
                //Recurso Departamento
                $resource4 = 'departamento';                
		$this->add(new Zend_Acl_Resource($resource4));                                               
                $this->allow($ROL1,$resource4,array('index'));
                $this->allow($ROL2,$resource4,array('index'));
                $this->allow($ROL3,$resource4,array('index','add','delete','update'));                                
                $this->allow($ROL4,$resource4,array('index','add','update'));                                
                
                
                //Recurso Provincia
                $resource5 = 'provincia';                
		$this->add(new Zend_Acl_Resource($resource5));                                               
                $this->allow($ROL3,$resource5,array('index','add','delete','update','listarprovincias','test1'));                                
                $this->allow($ROL4,$resource5,array('index','add','update'));                                
                
                //Recurso Index
                $resource6 = 'index';                
		$this->add(new Zend_Acl_Resource($resource6));                                               
                $this->allow($ROL1,$resource6,array('index'));
                $this->allow($ROL2,$resource6,array('index'));
                $this->allow($ROL3,$resource6,array('index'));                                
                $this->allow($ROL4,$resource6,array('index'));                                
                
                //Recurso Auth
                $resource7 = 'auth';                
		$this->add(new Zend_Acl_Resource($resource7));                                               
                $this->allow($ROL1,$resource7,array('index','logout'));
                $this->allow($ROL2,$resource7,array('index','logout'));
                $this->allow($ROL3,$resource7,array('index','logout'));                                
                $this->allow($ROL4,$resource7,array('index','logout'));                                

                //Recurso Distrito
                $resource8 = 'distrito';                
		$this->add(new Zend_Acl_Resource($resource8));                                               
                $this->allow($ROL1,$resource8);
                $this->allow($ROL2,$resource8);
                $this->allow($ROL3,$resource8,array('index','add','delete','update'));                                
                $this->allow($ROL4,$resource8,array('index'));                                                

//Recurso tablas
                $resource9 = 'tablas';                
		$this->add(new Zend_Acl_Resource($resource9));                                               
                $this->allow($ROL1,$resource9);
                $this->allow($ROL2,$resource9);
                $this->allow($ROL3,$resource9);                                
                $this->allow($ROL4,$resource9);                            
                
		//Recurso vehiculos
                $resource10 = 'vehiculo';                
		$this->add(new Zend_Acl_Resource($resource10));                                               
                $this->allow($ROL1,$resource10);
                $this->allow($ROL2,$resource10);
                $this->allow($ROL3,$resource10);                                
                $this->allow($ROL4,$resource10);                            
					
		//Recurso marcas
                $resource11 = 'marca';                
		$this->add(new Zend_Acl_Resource($resource11));                                               
                $this->allow($ROL1,$resource11);
                $this->allow($ROL2,$resource11);
                $this->allow($ROL3,$resource11);                                
                $this->allow($ROL4,$resource11);                            
				        
		//Recurso modelos
                $resource12 = 'modelo';                
		$this->add(new Zend_Acl_Resource($resource12));                                               
                $this->allow($ROL1,$resource12);
                $this->allow($ROL2,$resource12);
                $this->allow($ROL3,$resource12);                                
                $this->allow($ROL4,$resource12);                            
		 
		//Recurso tipos
                $resource13 = 'tipo';                
		$this->add(new Zend_Acl_Resource($resource13));                                               
                $this->allow($ROL1,$resource13);
                $this->allow($ROL2,$resource13);
                $this->allow($ROL3,$resource13);                                
                $this->allow($ROL4,$resource13);  

		//Recurso colores
                $resource14 = 'color';                
		$this->add(new Zend_Acl_Resource($resource14));                                               
                $this->allow($ROL1,$resource14);
                $this->allow($ROL2,$resource14);
                $this->allow($ROL3,$resource14);                                
                $this->allow($ROL4,$resource14); 
				
		//Recurso combustible
                $resource15 = 'combustible';                
		$this->add(new Zend_Acl_Resource($resource15));                                               
                $this->allow($ROL1,$resource15);
                $this->allow($ROL2,$resource15);
                $this->allow($ROL3,$resource15);                                
                $this->allow($ROL4,$resource15); 
		
		//Recurso ataud
                $resource16 = 'ataud';                
		$this->add(new Zend_Acl_Resource($resource16));                                               
                $this->allow($ROL1,$resource16);
                $this->allow($ROL2,$resource16);
                $this->allow($ROL3,$resource16);                                
                $this->allow($ROL4,$resource16); 
				
		//Recurso ataud
                $resource17 = 'modeloataud';                
		$this->add(new Zend_Acl_Resource($resource17));                                               
                $this->allow($ROL1,$resource17);
                $this->allow($ROL2,$resource17);
                $this->allow($ROL3,$resource17);                                
                $this->allow($ROL4,$resource17); 
				
		//Recurso ataud
                $resource18 = 'tamanoataud';                
		$this->add(new Zend_Acl_Resource($resource18));                                               
                $this->allow($ROL1,$resource18);
                $this->allow($ROL2,$resource18);
                $this->allow($ROL3,$resource18);                                
                $this->allow($ROL4,$resource18); 
				
		//Recurso ataud
                $resource19 = 'candelabro';                
		$this->add(new Zend_Acl_Resource($resource19));                                               
                $this->allow($ROL1,$resource19);
                $this->allow($ROL2,$resource19);
                $this->allow($ROL3,$resource19);                                
                $this->allow($ROL4,$resource19); 
				
		//Recurso ataud
                $resource20 = 'tipocandelabro';                
		$this->add(new Zend_Acl_Resource($resource20));                                               
                $this->allow($ROL1,$resource20);
                $this->allow($ROL2,$resource20);
                $this->allow($ROL3,$resource20);                                
                $this->allow($ROL4,$resource20); 
		
		//Recurso ataud
                $resource21 = 'capilla';                
		$this->add(new Zend_Acl_Resource($resource21));                                               
                $this->allow($ROL1,$resource21);
                $this->allow($ROL2,$resource21);
                $this->allow($ROL3,$resource21);                                
                $this->allow($ROL4,$resource21);

		//Recurso reporte
                $resource22 = 'reporte';                
		$this->add(new Zend_Acl_Resource($resource22));                                               
                $this->allow($ROL1,$resource22);
                $this->allow($ROL2,$resource22);
                $this->allow($ROL3,$resource22);                                
                $this->allow($ROL4,$resource22);
				
		
				
    }
}



