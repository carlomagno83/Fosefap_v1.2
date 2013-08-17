<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {                      
         $this->initView();
         
         if(!Zend_Auth::getInstance()->hasIdentity()) $this->_helper->redirector('index','auth');           

         $this->view->baseUrl = $this->_request->getBaseUrl();
         
         $this->view->DatosUser = Zend_Auth::getInstance()->getIdentity();      
    }

    public function indexAction()
    {
        Zend_Session::start();
        $horaIngresoTmp = new Zend_Session_Namespace('horaIngreso');
        $this->view->horaIngreso = $horaIngresoTmp->hora;

    }

    public function errorAction()
    {

    }
    
}