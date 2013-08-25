<?php
require_once 'models/DbTable/Provincia.php';

class ProvinciaController extends Zend_Controller_Action
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
       
    }
    
    public function listarprovinciasAction()
    {
        $this->_helper->layout->disableLayout();

        $table = new Application_Model_DbTable_Provincia(); 
                
        $output = array(
		"sEcho" => intval($_GET['sEcho']),
		"iTotalRecords" => $table->countProvincias(),
		"iTotalDisplayRecords" => $table->countProvincias(),
		"aaData" => array()
	);
        
        $output['aaData'] = $table->listar($_GET);
        
        echo Zend_Json::encode($output);
        
        
        $this->_helper->viewRenderer->setNoRender();
    }

}

