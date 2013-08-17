<?php
require_once 'models/DbTable/Departamento.php';
require_once 'models/DbTable/Provincia.php';
require_once 'models/DbTable/Distrito.php';
require_once 'models/DbTable/Titular.php';


class Application_Form_Titular extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Titular');

        //creamos <input text> para escribir NSA del titular
        $NSA = new Zend_Form_Element_Text('NSA');
        $NSA->setLabel('NSA :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir DNI del titular
        $DNI = new Zend_Form_Element_Text('DNI');
        $DNI->setLabel('DNI :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir Plana del titular
        $Plana = new Zend_Form_Element_Text('Plana');
        $Plana->setLabel('Plana :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir Grado del titular
        $Grado = new Zend_Form_Element_Text('Grado');
        $Grado->setLabel('Grado :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir Apellido Paterno del titular
        $ApellidoPaterno = new Zend_Form_Element_Text('ApellidoPaterno');
        $ApellidoPaterno->setLabel('ApellidoPaterno :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir Apellido Materno del titular
        $ApellidoMaterno = new Zend_Form_Element_Text('ApellidoMaterno');
        $ApellidoMaterno->setLabel('ApellidoMaterno :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir Nombre del titular
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('nombre :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir Sexo del titular
        $Sexo = new Zend_Form_Element_Text('Sexo');
        $Sexo->setLabel('Sexo :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir FechaNacimiento del titular
        $FechaNacimiento = new Zend_Form_Element_Text('FechaNacimiento');
        $FechaNacimiento->setLabel('FechaNacimiento :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir FechaIngresoFAP del titular
        $FechaIngresoFAP = new Zend_Form_Element_Text('FechaIngresoFAP');
        $FechaIngresoFAP->setLabel('FechaIngresoFAP :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir FechaEgresoFAP del titular
        $FechaEgresoFAP = new Zend_Form_Element_Text('FechaEgresoFAP');
        $FechaEgresoFAP->setLabel('FechaEgresoFAP :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir Situacion del titular
        $Situacion = new Zend_Form_Element_Text('Situacion');
        $Situacion->setLabel('Situacion :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir Unidad del titular
        $Unidad = new Zend_Form_Element_Text('Unidad');
        $Unidad->setLabel('Unidad :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir CodigoPromocion del titular
        $CodigoPromocion = new Zend_Form_Element_Text('CodigoPromocion');
        $CodigoPromocion->setLabel('CodigoPromocion :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir EstadoCivil del titular
        $EstadoCivil = new Zend_Form_Element_Text('EstadoCivil');
        $EstadoCivil->setLabel('EstadoCivil :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir Direccion del titular
        $Direccion = new Zend_Form_Element_Text('Direccion');
        $Direccion->setLabel('Direccion :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//Combo del Departamento        
        $iddepartamento = new Zend_Form_Element_Select('iddepartamento');
        $iddepartamento->setLabel('Departamento :')->setRequired(true); 
		
		$iddepartamento->addMultiOption(0, "Seleccionar Departamento");		

		//cargo en un select los departamentos
        $table = new Application_Model_DbTable_Departamento();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $iddepartamento->addMultiOption($c->iddepartamento, $c->nombre);
        }
		  
        //Combo de la Provincia
        $idprovincias = new Zend_Form_Element_Select('idprovincias');
        $idprovincias->setLabel('Provincia :')
					 ->setRegisterInArrayValidator(false)
					 ->setRequired(true);        
	       
        //cargo en un select las provincias
        $table = new Application_Model_DbTable_Provincia();
        //obtengo listado de todas los provincias y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idprovincias->addMultiOption($c->idprovincia, $c->nombres);
        }
	
		//Combo del Distrito
        $iddistrito = new Zend_Form_Element_Select('iddistrito');
        $iddistrito->setLabel('Distrito :')
				   ->setRegisterInArrayValidator(false)
				   ->setRequired(true); 

    	//cargo en un select los distritos
        $table = new Application_Model_DbTable_Distrito();
        //obtengo listado de todos los distritos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $iddistrito->addMultiOption($c->iddistrito, $c->nombre);
        }
		
		//creamos <input text> para escribir TelefonoFijo del titular
        $TelefonoFijo = new Zend_Form_Element_Text('TelefonoFijo');
        $TelefonoFijo->setLabel('TelefonoFijo :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir TelefonoMovil del titular
        $TelefonoMovil = new Zend_Form_Element_Text('TelefonoMovil');
        $TelefonoMovil->setLabel('TelefonoMovil :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir Email del titular
        $Email = new Zend_Form_Element_Text('Email');
        $Email->setLabel('Email :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir FechaFallecimiento del titular
        $FechaFallecimiento = new Zend_Form_Element_Text('FechaFallecimiento');
        $FechaFallecimiento->setLabel('FechaFallecimiento :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir EstadoAfiliacion del titular
        $EstadoAfiliacion = new Zend_Form_Element_Text('EstadoAfiliacion');
        $EstadoAfiliacion->setLabel('EstadoAfiliacion :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir FichaAfiliacion del titular
        $FichaAfiliacion = new Zend_Form_Element_Text('FichaAfiliacion');
        $FichaAfiliacion->setLabel('FichaAfiliacion :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir FechaInicioDescuento del titular
        $FechaInicioDescuento = new Zend_Form_Element_Text('FechaInicioDescuento');
        $FechaInicioDescuento->setLabel('FechaInicioDescuento :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//creamos <input text> para escribir observacion del cementerio
        $observacion = new Zend_Form_Element_Textarea('observacion');
        $observacion->setLabel('Observación :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');

		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');
				
        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($NSA,$DNI,$Plana,$Grado,$ApellidoPaterno,$ApellidoMaterno,$nombre,$Sexo,$FechaNacimiento,
								 $FechaIngresoFAP,$FechaEgresoFAP,$Situacion,$Unidad,$CodigoPromocion,$EstadoCivil,
								 $Direccion,$iddistrito,$TelefonoFijo,$TelefonoMovil,$Email,$FechaFallecimiento,      
								 $EstadoAfiliacion,$FichaAfiliacion,$FechaInicioDescuento,$Observacion,$submit));	
		/* Form Elements & Other Definitions Here ... *//* Form Elements & Other Definitions Here ... */
		
		//DECORATOR GRUPOS
		$this->addDisplayGroups(array(
			'left' => array(
				'options'  => array('description' => 'Left Column'),
				'elements' => array($NSA,$DNI,$Plana,$Grado,$ApellidoPaterno,$ApellidoMaterno,$nombre,$Sexo,$FechaNacimiento,
									$FechaIngresoFAP,$FechaEgresoFAP,$Situacion,$Unidad,$CodigoPromocion),
			),
			'right' => array(
				'options'  => array('description' => 'Right Column'),
				'elements' => array($EstadoCivil,$Direccion,$iddistrito,$TelefonoFijo,$TelefonoMovil,$Email,$FechaFallecimiento,      
									$EstadoAfiliacion,$FichaAfiliacion,$FechaInicioDescuento,$Observacion),
			),
			'bottom' => array(
				'elements' => array($submit),
			)
		));
		 
		//$this->setDisplayGroupDecorators(array('Description', 'FormElements', 'Fieldset'));		
		$this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));	
		
    }


}

