<?php

require_once 'models/DbTable/TipoCandelabro.php';

class Application_Form_TipoCandelabro extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('TipoCandelabro');

        //campo hidden para guardar id del velatorio
        $idtipoCandelabros = new Zend_Form_Element_Hidden('idtipoCandelabros'); 
        $idtipoCandelabros->addFilter('Int');

        //creamos <input text> para escribir nombre del modelo de ataud
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Nombre del Tipo de Candelabro:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
				 
		//creamos <input text> para escribir nombre de la observacion del modelo del ataud
        $observacion = new Zend_Form_Element_Text('observacion');
        $observacion->setLabel('Observacion del Tipo de Candelabro:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        $this->addElements(array($idtipoCandelabros,$nombre,$observacion,$submit));
	
    }


}

