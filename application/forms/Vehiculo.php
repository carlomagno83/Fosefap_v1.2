<?php
require_once 'models/DbTable/Marca.php';
require_once 'models/DbTable/Modelo.php';
require_once 'models/DbTable/Tipo.php';
require_once 'models/DbTable/Color.php';
require_once 'models/DbTable/Combustible.php';

class Application_Form_Vehiculo extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Vehiculo');
		
        $placa = new Zend_Form_Element_Text('placa');
        $placa->setLabel('Placa :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');		

        //campo hidden para guardar id del velatorio
        $idvehiculo = new Zend_Form_Element_Hidden('idvehiculo'); 
        $idvehiculo->addFilter('Int');
		
		//Combo de Marca        
        $idmarca = new Zend_Form_Element_Select('idmarca');
        $idmarca->setLabel('Marca :')->setRequired(true); 

		//cargo en un select las Marcas
        $table = new Application_Model_DbTable_Marca();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idmarca->addMultiOption($c->idmarca, $c->nombre);
        }
		
		//Combo de Modelo        
        $idmodelo = new Zend_Form_Element_Select('idmodelo');
        $idmodelo->setLabel('Modelo :')->setRequired(true); 

		//cargo en un select los Modelos
        $table = new Application_Model_DbTable_Modelo();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idmodelo->addMultiOption($c->idmodelo, $c->nombre);
        }
		
		//Combo del Tipo        
        $idtipo = new Zend_Form_Element_Select('idtipo');
        $idtipo->setLabel('Tipo :')->setRequired(true); 

		//cargo en un select los tipos
        $table = new Application_Model_DbTable_Tipo();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idtipo->addMultiOption($c->idtipo, $c->nombre);
        }
		
		//Combo del Color     
        $idcolor = new Zend_Form_Element_Select('idcolor');
        $idcolor->setLabel('Color :')->setRequired(true); 

		//cargo en un select los Colores
        $table = new Application_Model_DbTable_Color();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idcolor->addMultiOption($c->idcolor, $c->nombre);
        }
		
		//Combo del Departamento        
        $idcombustible = new Zend_Form_Element_Select('idcombustible');
        $idcombustible->setLabel('Combustible :')->setRequired(true); 

		//cargo en un select los departamentos
        $table = new Application_Model_DbTable_Combustible();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idcombustible->addMultiOption($c->idcombustible, $c->nombre);
        }
					

        $motor = new Zend_Form_Element_Text('motor');
        $motor->setLabel('Motor :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		$serie = new Zend_Form_Element_Text('serie');
        $serie->setLabel('Serie :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		$pasajero = new Zend_Form_Element_Text('pasajero');
        $pasajero->setLabel('Pasajeros :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		$asiento = new Zend_Form_Element_Text('asiento');
        $asiento->setLabel('Asientos :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		$FechaFab = new Zend_Form_Element_Text('FechaFab'); 
        $FechaFab->setLabel('Fecha Fabricación :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty'); 
		
		$observacion = new Zend_Form_Element_Textarea('observacion');
        $observacion->setLabel('Observación :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		 
        //boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($placa,$idvehiculo,$idmarca,$idmodelo,$idtipo,$idcolor,$idcombustible,$motor,$serie,$pasajero,$asiento,$FechaFab,$observacion,$submit));	
		
		
		//DECORATOR GRUPOS
		$this->addDisplayGroups(array(
			'left' => array(
				'options'  => array('description' => 'Left Column'),
				'elements' => array($placa,$idmarca,$idmodelo,$idtipo,$idcolor,$idcombustible,$motor),
			),
			'right' => array(
				'options'  => array('description' => 'Right Column'),
				'elements' => array($serie,$pasajero,$asiento,$FechaFab,$observacion),
			),
			'bottom' => array(
				'elements' => array($submit),
			)
		));
		 
		//$this->setDisplayGroupDecorators(array('Description', 'FormElements', 'Fieldset'));		
		$this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
		
		
    }
}

