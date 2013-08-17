<?php
require_once 'models/DbTable/Marca.php';

class Application_Form_Marca extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		 
		$this->setName('Marca');

        //campo hidden para guardar id del velatorio
        $idmarca = new Zend_Form_Element_Hidden('idmarca'); 
        $idmarca->addFilter('Int');

        //creamos <input text> para escribir nombre del velatorio
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Nombre de la Marca:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idmarca,$nombre,$submit));	
		
    }


}

