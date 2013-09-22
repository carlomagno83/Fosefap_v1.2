<?php

require_once 'models/DbTable/RolRecursoPermiso.php';
require_once 'forms/RolRecursoPermiso.php';

class PermisosController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here **/ 
        $this->initView();
        if(!Zend_Auth::getInstance()->hasIdentity()) $this->_helper->redirector('index','auth');           
        $this->view->baseUrl = $this->_request->getBaseUrl();
        $this->view->DatosUser = Zend_Auth::getInstance()->getIdentity(); 
    }

    public function indexAction()
    {
        // action body
    }

    public function listarpermisosAction()
    {

        $this->_helper->layout->disableLayout();

        $table = new Application_Model_DbTable_RolRecursoPermiso();
        //die(  var_dump($table->getColumns() ));

        $output = array(
                "sEcho" => intval($_GET['sEcho']),
                "iTotalRecords" => $table->countProveedores(),
                "iTotalDisplayRecords" => $table->countProveedores(),
                "aaData" => array()
        );

        $output['aaData'] = $table->listar2($_GET);

        echo Zend_Json::encode($output);


        $this->_helper->viewRenderer->setNoRender();    

    }

    public function addAction()
    {
        // action body
		//titulo para la pagina
        $this->view->title = "Permisos";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_RolRecursoPermiso();
        //cambio el texto del boton submit
        $form->submit->setLabel('Agregar');
        //lo asigno a la accion (la pag web que se mostrara)
        $this->view->form = $form;

        //los formularios envian sus datos a traves de POST
        //si vienen datos de post, es que el usuario ha enviado el formulario
        if ($this->getRequest()->isPost())
        {
			
		
            //extrae un arreglo con los datos recibidos por POST
            //es decir, los datos clave=>valor del formulario
            $formData = $this->getRequest()->getPost();

            //isValid() revisa todos los validadores y filtros que le
            //aplicamos a los objetos del formulario: se asegura de que los
            //campos requeridos se hallan llenado, que el formato de la fecha
            //sea el correcto, etc
            if ($form->isValid($formData))
            {
            //aca ya estamos seguros de que los datos son validos
            //ahora los extraemos como se ve abajo
                $role = $form->getValue('role');
                $recurso = $form->getValue('recurso'); 
                $permiso = $form->getValue('permiso');
										
                $rrp = new Application_Model_DbTable_RolRecursoPermiso();                    
                $rrp->agregar($role,$recurso,$permiso);
                $this->_helper->redirector('index');
            }
            //si los datos del formulario no son validos, es decir, falta ingresar
            //algunos o el formato es incorrecto...
            else
            {
                //esta funcion vuelve a cargar el formulario con los datos que se
                //enviaron, Y ADEMAS CON LOS MENSAJES DE ERROR, los que se le mostrarán
                //al usuario
                $form->populate($formData);
            }        
        
        }
    }


}





