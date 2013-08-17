<?php

class Application_Form_Tipo extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Tipo');

        //campo hidden para guardar id del velatorio
        $idtipo = new Zend_Form_Element_Hidden('idtipo'); 
        $idtipo->addFilter('Int');

        //creamos <input text> para escribir nombre del velatorio
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Nombre del Tipo:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idtipo,$nombre,$submit));
    }


}

