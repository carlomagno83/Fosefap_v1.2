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
            
		$role = $this->_auth->hasIdentity() ? $this->_auth->getInstance()->getIdentity()->role : 'alumno';
                                
		// toma el nombre del recurso actual
                $resource = $this->getRequest()->getControllerName();
    		if( !$this->_acl->has( $this->getRequest()->getControllerName() ) )
                    die('Recurso: '.$this->getRequest()->getControllerName().' No existe');                        

                
		if ( !$this->_acl->isAllowed($role, $resource,$this->getRequest()->getActionName()) )
		{
			$request->setControllerName('index')
                                ->setActionName('error');
		}
 
	}
}