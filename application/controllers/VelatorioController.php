<?php
require_once 'models/DbTable/Velatorio.php';
require_once 'models/DbTable/Provincia.php';
require_once 'models/DbTable/Distrito.php';
require_once 'forms/Velatorio.php';

class VelatorioController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
		$this->initView();
         if(!Zend_Auth::getInstance()->hasIdentity()) $this->_helper->redirector('index','auth');                    
         $this->view->baseUrl = $this->_request->getBaseUrl();
         
         $this->view->DatosUser = Zend_Auth::getInstance()->getIdentity(); 
    }

    public function indexAction()
    {
        // action body
		$table = new Application_Model_DbTable_Velatorio(); 
				
        $this->view->datos = $table->listar();

		
    }

    public function getAction()
    {
        // action body
				
    }

    public function agregarAction()
    {
        // action body
    }

    public function cambiarAction()
    {
        // action body
    }

    public function addAction()
    {
	
	
        // action body
		//titulo para la pagina
        $this->view->title = "Agregar Velatorios";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Velatorio();
        //cambio el texto del boton submit
        $form->submit->setLabel('Agregar Velatoriosss');
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
				$iddepartamento = $form->getValue('iddepartamento');
				$idprovincias = $form->getValue('idprovincias');
				$iddistrito = $form->getValue('iddistrito');
				$telefono_fijo = $form->getValue('telefono_fijo');
				$telefono_celular = $form->getValue('telefono_celular');
				$mail = $form->getValue('mail');
				$costo = $form->getValue('costo');
				$observacion = $form->getValue('observacion');
								
                //$nombre = $form->getValue('nombre');
                //$Descripcion = $form->getValue('Descripcion');
                //$idProfesor = $form->getValue('idProfesor');
                
                //creo objeto Album que controla la talba Album de la base de datos
                $velatorio = new Application_Model_DbTable_Velatorio();
                //llamo a la funcion agregar, con los datos que recibi del form
                //$velatorios->agregar($nombre,$Descripcion,$idProfesor);
				

				$velatorio->agregar($RUC,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion);
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
        $id = $this->_getParam('id', 0);
        //creo objeto tabla Album
        $tabla = new Application_Model_DbTable_Velatorio();
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
        $this->view->title = "Agregar Velatorios";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Velatorio();
        //cambio el texto del boton submit
        $form->submit->setLabel('Agregar Velatoriosss');
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
				$idvelatorio = $form->getValue('idvelatorio'); 								
				$RUC = $form->getValue('RUC'); 				
				$nombre = $form->getValue('nombre'); 
				$direccion = $form->getValue('direccion');
				$iddepartamento = $form->getValue('iddepartamento');
				$idprovincias = $form->getValue('idprovincias');
				$iddistrito = $form->getValue('iddistrito');
				$telefono_fijo = $form->getValue('telefono_fijo');
				$telefono_celular = $form->getValue('telefono_celular');
				$mail = $form->getValue('mail');
				$costo = $form->getValue('costo');
				$observacion = $form->getValue('observacion');
								
                //$nombre = $form->getValue('nombre');
                //$Descripcion = $form->getValue('Descripcion');
                //$idProfesor = $form->getValue('idProfesor');
                
                //creo objeto Album que controla la talba Album de la base de datos
                $velatorio = new Application_Model_DbTable_Velatorio();
                //llamo a la funcion agregar, con los datos que recibi del form
                //$velatorios->agregar($nombre,$Descripcion,$idProfesor);
				

				$velatorio->cambiar($idvelatorio,$RUC,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion);
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
            $id = $this->_getParam('id', 0);
            //si viene algun id
            if ($id > 0)
            {
               //CREO FORM
                $velatorio = new Application_Model_DbTable_Velatorio();
                //extraigo de la talba el album id= $id
                $vela= $velatorio->get($id);
                //populate() toma los datos de $album y los coloca en el formualrio.
                //PARA QUE ESTO FUNCIONE, EL NOMBRE DE LOS OBJETOS DEL FORM DEBE
                //SER IGUAL AL NOMBRE DE LOS CAMPOS EN LA TABLA!!
                $form->populate($vela);
            }
        }		
		
    }

    
}



