<?php
/*
 * AuthorizationPlugin.php
 * Extención de la clase Zend_Controller_Plugin_Abstract
*/
class Plugins_Myplugin extends Zend_Controller_Plugin_Abstract
{
        
	private $_auth;
	private $_acl;
 
	public function __construct(Zend_Auth $auth, Zend_Acl $acl)
	{
        	$this->_auth = $auth;
        	$this->_acl = $acl;
	}
        
	public function preDispatch ( Zend_Controller_Request_Abstract $request )
	{
            
                //echo $this->_acl->isAllowed('alumno', 'alumno','index') ? 'allowed' : 'denied';           
                //die();
                //die('Entro al plugin');
		// revisa que exista una identidad
		// obtengo la identidad y el "role" del usuario, sino tiene le pone 'guest'
		$role = $this->_auth->hasIdentity() ? $this->_auth->getInstance()->getIdentity()->role : 'alumno';
                
                /*
                if($this->_auth->hasIdentity())
                    $role = $this->_auth->getInstance()->getIdentity()->role;    
                else
                    return $request->setControllerName('auth');
                */
            
                //die('COGIO PARAMETROS:'.$role);
                
		// toma el nombre del recurso actual
                $resource = $this->getRequest()->getControllerName();
    		if( !$this->_acl->has( $this->getRequest()->getControllerName() ) )
                    die('Recurso: '.$this->getRequest()->getControllerName().' No existe');                        
                    //$resource = $this->getRequest()->getControllerName();

                //var_dump($this->getRequest()->getControllerName());
                //if(!isset($resource))
                //die('Recurso: '.$this->getRequest()->getControllerName().' No existe');
		// Si, la persona no pasa la prueba de autorización y su "role" es 'guest'
		// entonces no ha echo "login" y lo dirigo al controlador "login" del modulo "auth"
                
                /*
                if($resource == 'index')
                {
                        $request->setControllerName('auth');
                }        
                */        
                //echo $role.' - '.$resource.' - '.$this->getRequest()->getActionName();
                //echo !$this->_acl->isAllowed($role, $resource);
		if ( !$this->_acl->isAllowed($role, $resource,$this->getRequest()->getActionName()) )
		{
			//$request->setModuleName('auth');
                    //echo "aa";
			$request->setControllerName('index')
                                ->setActionName('error');
		}
		// Ahora si la persona tiene un "role" distinto de 'guest' y aun así no pasa
		// la prueba de identificación lo mando a una página de error.
                /*
		elseif (!$this->_acl->isAllowed($role, $resource, $this->getRequest()->getActionName()) )
		{
			//$request->setModuleName('auth');
			$request->setControllerName('error');
		}
                
                */
 
	}
}