<?php
require_once 'models/DbTable/Proveedor.php';
require_once 'models/DbTable/Provincia.php';
require_once 'models/DbTable/Distrito.php';
require_once 'forms/Proveedor.php';

class ProveedorController extends Zend_Controller_Action
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

    }
    
    public function listarproveedoresAction()
    {
        $this->_helper->layout->disableLayout();

        $table = new Application_Model_DbTable_Proveedor(); 
        
        $output = array(
		"sEcho" => intval($_GET['sEcho']),
		"iTotalRecords" => $table->countProveedores(),
		"iTotalDisplayRecords" => 10,
		"aaData" => array()
	);
	        
        $output['aaData'] = $table->listar($_GET);
        
        echo Zend_Json::encode($output);
        
        
        $this->_helper->viewRenderer->setNoRender();
    }
    
    

    public function addAction()
    {
	
        // action body
		//titulo para la pagina
        $this->view->title = "Proveedor";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Proveedor();
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
				
                $proveedor = new Application_Model_DbTable_Proveedor();                    
				$proveedor->agregar($RUC,$nombre,$direccion,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion,$idcategoria);
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
        $id = $this->_getParam('ruc', 0);
		//$id = $this->_getParam('id', 0);
        //creo objeto tabla Album
        $tabla = new Application_Model_DbTable_Proveedor();
        //llamo a la funcion borrar
        $tabla->borrar($id);
        //redirijo a la accion index de este controlador, es decir,
        //al listado de albumes
        $this->_helper->redirector('index');
    }

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

    public function listarProvinciasAction()
    {
		die('data');
    }

    public function listarprovAction()
    {
        $provincias = new Application_Model_DbTable_Provincia();	

		//listarFiltro($_GET['codDepa']	
		$dataProv = array();	
		foreach($provincias->listarFiltro($_GET['codDepa']) as $key=>$value){
			$dataProv[] = array( $value->idprovincia , $value->nombres );
		}
		
		echo Zend_Json::encode($dataProv);
        die();
		
    }

    public function listardistriAction()
    {
        $distritos = new Application_Model_DbTable_Distrito();	
				
		$dataDistr = array();	
		foreach($distritos->listarFiltroDistritos($_GET['codDistr']) as $key=>$value){
			$dataDistr[] = array( $value->iddistrito , $value->nombre );
		}
		
		echo Zend_Json::encode($dataDistr);
        die();
		
    }

    public function busquedaxnombreAction()
    {
	
	$this->_helper->layout->disableLayout();
		
        $table = new Application_Model_DbTable_Proveedor(); 
        
	//die( $table->listarxnombre($_GET['valueBusq']) );			
        $this->view->datos = $table->listarxnombre($_GET['valueBusq']);
		
    }

    public function busquedaxrucAction()
    {
        		

        $this->_helper->layout->disableLayout();
        
        $table = new Application_Model_DbTable_Proveedor(); 
        
        $this->view->datos = $table->listarxruc($_GET['valueBusq']);
        
                        
    }

    public function exportarpdfAction($tipoFiltro)
    {
        
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();        
                
        require_once("dompdf/dompdf_config.inc.php");

        $table = new Application_Model_DbTable_Proveedor();

		$dataObj = $table->listar();
		/*
		if( $tipoFiltro == ){	
        $dataObj = $table->listarxnombre($_GET['valueBusq']);
        }
		
		if( $tipoFiltro == ){
		$dataObj = $table->listarxruc($_GET['valueBusq'])
		}
		*/
		
        $PDFTempFile = $this->_arrayToTableHtml( $dataObj->toArray() );
        
		$newHTML = '<table width="200" border="1">
  <tr>
    <td bgcolor="#003399">&nbsp;</td>
    <td bgcolor="#003399">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#CC3333">&nbsp;</td>
    <td bgcolor="#CC3333">&nbsp;</td>
  </tr>
</table>';
		
		$PDFTempFile = $newHTML.$PDFTempFile.$newHTML;
		
		//die( $PDFTempFile );
		
        $dompdf = new DOMPDF();
        $dompdf->load_html($PDFTempFile);
        $dompdf->render();
        $dompdf->stream("sample.pdf");

        exit();

    }

    
    public function _arrayToTableHtml($data){
    
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

