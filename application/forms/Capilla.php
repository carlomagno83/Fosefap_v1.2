<?php

require_once 'models/DbTable/Ataud.php';
require_once 'models/DbTable/ModeloAtaud.php';
require_once 'models/DbTable/Candelabro.php';
require_once 'models/DbTable/Capilla.php';

class Application_Form_Capilla extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Capilla');

        //campo hidden para guardar id de la capilla
        $idcapilla = new Zend_Form_Element_Hidden('idcapilla'); 
        $idcapilla->addFilter('Int');
		
		//Combo de Ataud        
        $idataud = new Zend_Form_Element_Select('idataud');
        $idataud->setLabel('Seleccione Ataud:')->setRequired(true); 

		//cargo en un select las Ataud
        $table = new Application_Model_DbTable_Ataud();
		//obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
		
		//die("fin");
		
        foreach ($table->listar() as $c)
        {	//$idataud->addMultiOption($c->idataud,$c->observacion);
			$idataud->addMultiOption($c->idataud, $c->modelo."-".$c->tamano."-".$c->color);
		}
		
		//Combo de Candelabros
        $idcandelabros = new Zend_Form_Element_Select('idcandelabros');
        $idcandelabros->setLabel('Seleccione Candelabros:')->setRequired(true); 

		//cargo en un select los Modelos
        $table = new Application_Model_DbTable_Candelabro();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            //$idcandelabros->addMultiOption($c->idcandelabros, $c->observacion);
			$idcandelabros->addMultiOption($c->idcandelabros, $c->tipo);
        }
		
		$manto = new Zend_Form_Element_Text('manto');
        $manto->setLabel('manto:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		$cristo = new Zend_Form_Element_Text('cristo');
        $cristo->setLabel('cristo:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');

		$velas = new Zend_Form_Element_Text('velas');
        $velas->setLabel('velas:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		$flamas = new Zend_Form_Element_Text('flamas');
        $flamas->setLabel('flamas:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		$alfombra = new Zend_Form_Element_Text('alfombra'); 
        $alfombra->setLabel('alfombra:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty'); 
		
		$letrero = new Zend_Form_Element_Text('letrero'); 
        $letrero->setLabel('letrero:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty'); 
		
		$tarjetero = new Zend_Form_Element_Text('tarjetero'); 
        $tarjetero->setLabel('tarjetero:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty'); 
				
		$observacion = new Zend_Form_Element_Textarea('observacion');
        $observacion->setLabel('Observaciones:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');

			 
        //boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idcapilla,$idataud,$idcandelabros,$manto,$cristo,$velas,$flamas,$alfombra,$letrero,$tarjetero,$observacion,$submit));	
		
	
		//DECORATOR GRUPOS
		$this->addDisplayGroups(array(
			'left' => array(
				'options'  => array('description' => 'Left Column'),
				'elements' => array($idataud, $idcandelabros,$manto, $cristo,$velas),
			),
			'right' => array(
				'options'  => array('description' => 'Right Column'),
				'elements' => array($flamas,$alfombra,$letrero,$tarjetero,$observacion),
			),
			'bottom' => array(
				'elements' => array($submit),
			)
		));
		 
		//$this->setDisplayGroupDecorators(array('Description', 'FormElements', 'Fieldset'));		
		$this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));				
		

    }


}

