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


    public function deleteAction()
    {
        // action body
	//debe venir un parametro, por GET o POST, llamado id, con el id del album a borrar
        $rol = $this->_getParam('rol', 0);
        $recurso = $this->_getParam('recurso', 0);
        $permiso = $this->_getParam('permiso', 0);        
	//$id = $this->_getParam('id', 0);
        //creo objeto tabla Album
        $tabla = new Application_Model_DbTable_RolRecursoPermiso();
        //llamo a la funcion borrar
        $tabla->borrar($rol,$recurso,$permiso);
        //redirijo a la accion index de este controlador, es decir,
        //al listado de albumes
        $this->_helper->redirector('index');
    }

    /*
    public function updateAction()
    {

         // action body
		//titulo para la pagina
        $this->view->title = "Proveedor";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Proveedor();
        //cambio el texto del boton submit
        $form->submit->setLabel('Modificar');
        //lo asigno oa la accion (la pag web que se mostrara)
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
				$RUC = $form->getValue('RUC'); 				
				$nombre = $form->getValue('nombre'); 
				$direccion = $form->getValue('direccion');
				$iddistrito = $form->getValue('iddistrito');
				$telefono_fijo = $form->getValue('telefono_fijo');
				$telefono_celular = $form->getValue('telefono_celular');
				$mail = $form->getValue('mail');
				$costo = $form->getValue('costo');
				$observacion = $form->getValue('observacion');
				$idcategoria = $form->getValue('idcategoria'); 	
				
                //creo objeto Album que controla la talba Album de la base de datos
                $proveedor = new Application_Model_DbTable_Proveedor();
                //llamo a la funcion agregar, con los datos que recibi del form
                
				$proveedor->cambiar($RUC,$nombre,$direccion,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion,$idcategoria);
                //indico que despues de haber agregado el album,
                //me redirija a la accion index de AlbumController, es decir,
                //a la pagina que me muestra el listado de albumes
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
        else
        {
            //YO HE DECIDIDO QUE DEBE VENIR UN PARAMETRO LLAMADO ID, con el 
            //id del album que deseo editar
            //si vienbe un parametro llamado id le asigno su valor a $id; 
            //si no viene, le asigno cero
            //esto es como llamar a $_REQUEST
            //$id = $this->_getParam('id', 0);
            $id = $this->_getParam('ruc', 0);

            //si viene algun id
            if ($id > 0)
            {
               //CREO FORM
                $proveedor = new Application_Model_DbTable_Proveedor();
                //extraigo de la talba el album id= $id
                $prove = $proveedor->get2($id);
				//$mode= $modelo->get($id);
                //die(var_dump($crema));
                //populate() toma los datos de $album y los coloca en el formualrio.
                //PARA QUE ESTO FUNCIONE, EL NOMBRE DE LOS OBJETOS DEL FORM DEBE
                //SER IGUAL AL NOMBRE DE LOS CAMPOS EN LA TABLA!!
                $form->populate($prove);
            }
        }		
		
    }    
    
    */
    
    public function exportarpdfAction()
    {
        
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();        
                
        require_once("dompdf/dompdf_config.inc.php");

        $table = new Application_Model_DbTable_RolRecursoPermiso();

        $dataObj = $table->listar3();
        $PDFTempFile = $this->_arrayToTableHtml( $dataObj );		
        		
        $dompdf = new DOMPDF();
        $dompdf->load_html($PDFTempFile);
        $dompdf->render();
        $dompdf->stream("sample.pdf");

        exit();

    }
    
    
    public function exportarexcelAction()
    {
    
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();        
 
        $table = new Application_Model_DbTable_RolRecursoPermiso();

        $dataObj = $table->listar3();
        $PDFTempFile = $this->_arrayToTableHtml( $dataObj );		
        		
        header("Content-type: application/octet-stream");
        header("Content-Disposition: attachment; filename=reporte.xls");
        header("Pragma: no-cache");
        header("Expires: 0");
        echo $PDFTempFile;       
        
        
    }

    
    public function _arrayToTableHtml($data)
    {
    
        $str = "";
	$str.= "<table border='1' cellspacing='0' cellpadding='4'>";

		//Header
		$str.= "<tr>";
		$dataHeader = $data[0];
		foreach($dataHeader as $key=>$value){
			
			$str.= "<td> $key";
									
			$str.= "</td>";
			
		}	
		$str.= "</tr>";

		//Registros
		foreach($data as $key=>$value){
			
			$str.= "<tr>";
			
			foreach($value as $key1=>$value1){
				$str.= "<td>$value1</td>";  
			}
						
			$str.= "</tr>";
			
		}

	$str.= "</table>";        
        
        return $str;
        
    }	    
    
}





