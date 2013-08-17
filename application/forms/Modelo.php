<?php
require_once 'models/DbTable/Modelo.php';

class Application_Form_Modelo extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Modelo');

        //campo hidden para guardar id del velatorio
        $idmodelo = new Zend_Form_Element_Hidden('idmodelo'); 
        $idmodelo->addFilter('Int');

        //creamos <input text> para escribir nombre del velatorio
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Nombre del Modelo:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idmodelo,$nombre,$submit));
    }


}

