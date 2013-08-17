<?php

require_once 'models/DbTable/TipoCandelabro.php';


class Application_Form_Candelabro extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		
		$this->setName('Candelabro');

        //campo hidden para guardar id del candelabro
        $idcandelabros = new Zend_Form_Element_Hidden('idcandelabros'); 
        $idcandelabros->addFilter('Int');
		
		//Combo de Tipo Candelabro
        $idtipoCandelabros = new Zend_Form_Element_Select('idtipoCandelabros');
        $idtipoCandelabros->setLabel('Seleccione Tipo de Candelabro:')->setRequired(true); 

		//cargo en un select los Tipos
        $table = new Application_Model_DbTable_TipoCandelabro();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idtipoCandelabros->addMultiOption($c->idtipoCandelabros, $c->nombre);
        }
		
		$observacion = new Zend_Form_Element_Textarea('observacion');
        $observacion->setLabel('Observaciones:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		 
        //boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idcandelabros,$idtipoCandelabros,$observacion,$submit));
    }


}

