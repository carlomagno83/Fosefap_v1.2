<?php
require_once 'models/DbTable/Categoria.php';

class Application_Form_Categoria extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Categoria');

        //campo hidden para guardar id del velatorio
        $idcategoria = new Zend_Form_Element_Hidden('idcategoria'); 
        $idcategoria->addFilter('Int');

        //creamos <input text> para escribir nombre del velatorio
        $nombre = new Zend_Form_Element_Text('nombre');
        $nombre->setLabel('Categoria :')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		//boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idcategoria,$nombre,$submit));
		
		
		//DECORATOR GRUPOS
		$this->addDisplayGroups(array(
			'left' => array(
				'options'  => array('description' => 'Left Column'),
				'elements' => array($nombre),
			),
			//'right' => array(
			//	'options'  => array('description' => 'Right Column'),
			//	'elements' => array($nombre),
			//),//
			'bottom' => array(
				'elements' => array($submit),
			)
		));
		 
		//$this->setDisplayGroupDecorators(array('Description', 'FormElements', 'Fieldset'));		
		$this->setDisplayGroupDecorators(array('FormElements', 'Fieldset'));
				
	}

}

