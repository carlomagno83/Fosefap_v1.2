<?php

require_once 'models/DbTable/ModeloAtaud.php';

class Application_Form_ModeloAtaud extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('ModeloAtaud');

        //campo hidden para guardar id del velatorio
        $idmodeloAtaudes = new Zend_Form_Element_Hidden('idmodeloAtaudes'); 
        $idmodeloAtaudes->addFilter('Int');

        //creamos <input text> para escribir nombre del modelo de ataud
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Nombre del Modelo del Ataud:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir nombre de la observacion del modelo del ataud
        $observacion = new Zend_Form_Element_Text('observacion');
        $observacion->setLabel('Observacion del Modelo del Ataud:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        $this->addElements(array($idmodeloAtaudes,$nombre,$observacion,$submit));
	
    }


}

