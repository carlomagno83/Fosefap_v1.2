<?php

class DepartamentoController extends Zend_Controller_Action
{

    public function init()
    {
$this->initView();
         
         //$auth = Zend_Auth::getInstance();
         if(!Zend_Auth::getInstance()->hasIdentity()) $this->_helper->redirector('index','auth');           

         $this->view->baseUrl = $this->_request->getBaseUrl();
         
         $this->view->DatosUser = Zend_Auth::getInstance()->getIdentity();  
    }

    public function indexAction()
    {
        // action body
    }


}

