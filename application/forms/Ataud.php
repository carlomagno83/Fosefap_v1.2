<?php
require_once 'models/DbTable/ModeloAtaud.php';
require_once 'models/DbTable/TamanoAtaud.php';
require_once 'models/DbTable/Color.php';

class Application_Form_Ataud extends Zend_Form
{

    public function init()
    {
        /* Form Elements & Other Definitions Here ... */
		$this->setName('Ataud');

        //campo hidden para guardar id del velatorio
        $idataud = new Zend_Form_Element_Hidden('idataud'); 
        $idataud->addFilter('Int');
		
		//Combo de Modelo Ataud
        $idmodeloAtaudes = new Zend_Form_Element_Select('idmodeloAtaudes');
        $idmodeloAtaudes->setLabel('Seleccione Modelos de Ataudes:')->setRequired(true); 

		//cargo en un select los Modelos
        $table = new Application_Model_DbTable_ModeloAtaud();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idmodeloAtaudes->addMultiOption($c->idmodeloAtaudes, $c->nombre);
        }
		
		//Combo de Tamaño
        $idtamanoAtaudes = new Zend_Form_Element_Select('idtamanoAtaudes');
        $idtamanoAtaudes->setLabel('Seleccione Tamaño de Ataudes:')->setRequired(true); 

		//cargo en un select los Tamaños
        $table = new Application_Model_DbTable_TamanoAtaud();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idtamanoAtaudes->addMultiOption($c->idtamanoAtaudes, $c->nombre);
        }
					
		//Combo del Color     
        $idcolor = new Zend_Form_Element_Select('idcolor');
        $idcolor->setLabel('Seleccione Colores:')->setRequired(true); 

		//cargo en un select los Colores
        $table = new Application_Model_DbTable_Color();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $idcolor->addMultiOption($c->idcolor, $c->nombre);
        }
	
		$observacion = new Zend_Form_Element_Textarea('observacion');
        $observacion->setLabel('Observaciones:')->setRequired(true)->addFilter('StripTags')->addFilter('StringTrim')->
                 addValidator('NotEmpty');
		
		 
        //boton para enviar formulario
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        //agregolos objetos creados al formulario
        //$this->addElements(array($id, $nombre,$Descripccion,$profesores,$submit));	
		$this->addElements(array($idataud,$idmodeloAtaudes,$idtamanoAtaudes,$idcolor,$observacion,$submit));	
		
    }


}

