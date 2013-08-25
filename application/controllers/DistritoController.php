<?php
require_once 'models/DbTable/Distrito.php';

class DistritoController extends Zend_Controller_Action
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
       
    }
    
    
    public function listardistritosAction()
    {
        $this->_helper->layout->disableLayout();

        $table = new Application_Model_DbTable_Distrito(); 
                
        $output = array(
		"sEcho" => intval($_GET['sEcho']),
		"iTotalRecords" => $table->countDistritos(),
		"iTotalDisplayRecords" => $table->countDistritos(),
		"aaData" => array()
	);
        
        $output['aaData'] = $table->listar($_GET);
        
        echo Zend_Json::encode($output);
        
        
        $this->_helper->viewRenderer->setNoRender();
    }    
     


}

