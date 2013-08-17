<?php
require_once 'models/DbTable/Titular.php';
require_once 'models/DbTable/Provincia.php';
require_once 'models/DbTable/Distrito.php';
require_once 'forms/Titular.php';

class TitularController extends Zend_Controller_Action
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
		$table = new Application_Model_DbTable_Proveedor(); 
		$this->view->datos = $table->listar();
    }

	public function addAction()
    {
	     // action body
		//titulo para la pagina
        $this->view->title = "Titular";
        //valor para <head><title>
        $this->view->headTitle($this->view->title);
        //creo el formulario
        $form = new Application_Form_Titular();
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
				$NSA = $form->getValue('NSA');
				$DNI = $form->getValue('DNI');
				$Plana = $form->getValue('Plana'); 	
				$Grado = $form->getValue('Grado'); 
				$ApellidoPaterno = $form->getValue('ApellidoPaterno');
				$ApellidoMaterno = $form->getValue('ApellidoMaterno'); 
				$nombre = $form->getValue('nombre'); 
				$Sexo = $form->getValue('Sexo');
				$FechaNacimiento = $form->getValue('FechaNacimiento');
				$FechaIngresoFAP = $form->getValue('FechaIngresoFAP'); 				
				$FechaEgresoFAP = $form->getValue('FechaEgresoFAP'); 				
				$Situacion = $form->getValue('Situacion'); 				
				$Unidad = $form->getValue('Unidad'); 				
				$CodigoPromocion = $form->getValue('CodigoPromocion'); 				
				$EstadoCivil = $form->getValue('EstadoCivil'); 				
				$Direccion = $form->getValue('Direccion');
				$iddistrito = $form->getValue('iddistrito');
				$TelefonoFijo = $form->getValue('TelefonoFijo');
				$TelefonoMovil = $form->getValue('TelefonoMovil');
				$Email = $form->getValue('Email');
				$FechaFallecimiento = $form->getValue('FechaFallecimiento'); 				
				$EstadoAfiliacion = $form->getValue('EstadoAfiliacion'); 				
				$FichaAfiliacion = $form->getValue('FichaAfiliacion'); 				
				$FechaInicioDescuento = $form->getValue('FechaInicioDescuento'); 				
				$Observacion = $form->getValue('Observacion'); 				
								
                $titular = new Application_Model_DbTable_Titular();                    
				$titular->agregar( $NSA,$DNI,$Plana,$Grado,$ApellidoPaterno,$ApellidoMaterno,$nombre,$Sexo,$FechaNacimiento,
								   $FechaIngresoFAP,$FechaEgresoFAP,$Situacion,$Unidad,$CodigoPromocion,$EstadoCivil,
								   $Direccion,$iddistrito,$TelefonoFijo,$TelefonoMovil,$Email,$FechaFallecimiento,      
								   $EstadoAfiliacion,$FichaAfiliacion,$FechaInicioDescuento,$Observacion);
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

