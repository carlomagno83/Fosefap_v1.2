<?php
require_once 'models/DbTable/Categoria.php';
require_once 'forms/Categoria.php';

class CategoriaController extends Zend_Controller_Action
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
    
    
    public function listarcategoriasAction()
    {
        

        $this->_helper->layout->disableLayout();

        $table = new Application_Model_DbTable_Categoria();
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
        $this->view->title = "Categoria";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Categoria();
        //cambio el texto del boton submit
        $form->submit->setLabel('Agregar');
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
				
				$nombre = $form->getValue('nombre'); 				
				                               
                //creo objeto Album que controla la talba Album de la base de datos
                $categoria = new Application_Model_DbTable_Categoria();
                //llamo a la funcion agregar, con los datos que recibi del form
                				
				$categoria->agregar($nombre);
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
    }

    public function deleteAction()
    {
        // action body
		//debe venir un parametro, por GET o POST, llamado id, con el id del album a borrar
        $id = $this->_getParam('idcategoria', 0);
        //creo objeto tabla Album
        $tabla = new Application_Model_DbTable_Categoria();
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
        $this->view->title = "Categoria";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Categoria();
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
				$idcategoria = $form->getValue('idcategoria'); 								
				$nombre = $form->getValue('nombre'); 
				               
                //creo objeto Album que controla la talba Album de la base de datos
                $categoria = new Application_Model_DbTable_Categoria();
                //llamo a la funcion agregar, con los datos que recibi del form
                				
				$categoria->cambiar($idcategoria,$nombre);
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
            $id = $this->_getParam('idcategoria', 0);
            //si viene algun id
            if ($id > 0)
            {
               //CREO FORM
                $categoria = new Application_Model_DbTable_Categoria();
                //extraigo de la talba el album id= $id
                $cate= $categoria->get($id);
                //populate() toma los datos de $album y los coloca en el formualrio.
                //PARA QUE ESTO FUNCIONE, EL NOMBRE DE LOS OBJETOS DEL FORM DEBE
                //SER IGUAL AL NOMBRE DE LOS CAMPOS EN LA TABLA!!
                $form->populate($cate);
            }
        }	
    }
    

    
    public function exportarpdfAction()
    {
        
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender();        
                
        require_once("dompdf/dompdf_config.inc.php");

        $table = new Application_Model_DbTable_Categoria();

        $dataObj = $table->listar();
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
 
        $table = new Application_Model_DbTable_Categoria();

        $dataObj = $table->listar();
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

