<?php
require_once 'models/DbTable/Departamento.php';
require_once 'models/DbTable/Provincia.php';
require_once 'models/DbTable/Distrito.php';
require_once 'models/DbTable/Proveedor.php';
require_once 'models/DbTable/Categoria.php';

class Application_Form_Proveedor extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Proveedor');

        //creamos <input text> para escribir RUC del cementerio
        $RUC = new Zend_Form_Element_Text('RUC');
        $RUC->setLabel('RUC :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		

		
        //Combo del Categoria        
        $idcategoria = new Zend_Form_Element_Select('idcategoria');
        $idcategoria->setLabel('Categoria :')->setRequired(true); 
		
		$idcategoria->addMultiOption(0, "Seleccionar Categoria");		

		//cargo en un select los departamentos
        $table = new Application_Model_DbTable_Categoria();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar3() as $c)
        {
            $idcategoria->addMultiOption($c->idcategoria, $c->nombre);
        }

		
        //creamos <input text> para escribir nombre del cementerio
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Nombre :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		 
		 
        //creamos <input text> para escribir direccion del cementerio
        $direccion = new Zend_Form_Element_Text('direccion');
        $direccion->setLabel('Dirección :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
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
	//$iddepartamento->setValue('6');
		
	
    
        //Combo de la Provincia
        $idprovincias = new Zend_Form_Element_Select('idprovincias');
        $idprovincias->setLabel('Provincia :')
					 ->setRegisterInArrayValidator(false)
					 ->setRequired(true);        
		
        
        //cargo en un select las provincias
        $table = new Application_Model_DbTable_Provincia();
        //obtengo listado de todas los provincias y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar2() as $c)
        {
            $idprovincias->addMultiOption($c->idprovincia, $c->nombres);
        }
	
	//$idprovincias->setValue('35');		
				
				
				
	//Combo del Distrito
        $iddistrito = new Zend_Form_Element_Select('iddistrito');
        $iddistrito->setLabel('Distrito :')
				   ->setRegisterInArrayValidator(false)
				   ->setRequired(true); 

        
	//cargo en un select los distritos
        $table = new Application_Model_DbTable_Distrito();
        //obtengo listado de todos los distritos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar2() as $c)
        {
            $iddistrito->addMultiOption($c->iddistrito, $c->nombre);
        }
	
		
		//creamos <input text> para escribir telefono del cementerio
        $telefono_fijo = new Zend_Form_Element_Text('telefono_fijo');
        $telefono_fijo->setLabel('Teléfono :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir celular del cementerio
        $telefono_celular = new Zend_Form_Element_Text('telefono_celular');
        $telefono_celular->setLabel('Celular :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir correo electronico del cementerio
        $mail = new Zend_Form_Element_Text('mail ');
        $mail->setLabel('Correo Electronico :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty')->addValidator('EmailAddress',  TRUE );
		
		//creamos <input text> para escribir costo alquiler del cementerio
        $costo = new Zend_Form_Element_Text('costo');
        $costo->setLabel('Costo Alquiler :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
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
		$this->addElements(array($RUC,$idcategoria,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito,$telefono_fijo,$telefono_celular,$mail,$costo,$observacion,$submit));	
		/* Form Elements & Other Definitions Here ... *//* Form Elements & Other Definitions Here ... */
		
		//DECORATOR GRUPOS
		$this->addDisplayGroups(array(
			'left' => array(
				'options'  => array('description' => 'Left Column'),
				'elements' => array($RUC,$idcategoria,$nombre,$direccion,$iddepartamento,$idprovincias,$iddistrito),
			),
			'right' => array(
				'options'  => array('description' => 'Right Column'),
				'elements' => array($telefono_fijo,$telefono_celular,$mail,$costo,$observacion),
			),
			'bottom' => array(
				'elements' => array($submit),
			)
		));
		 
		//$this->setDisplayGroupDecorators(array('Description', 'FormElements', 'Fieldset'));		
		$this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));	
		
    }


}

