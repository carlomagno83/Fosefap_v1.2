<?php

class Application_Form_RolRecursoPermiso extends Zend_Form
{

    public function init()
    {
        
        $this->setName('Permisos');

		
        //Combo del roles
        $role = new Zend_Form_Element_Select('role');
        $role->setLabel('Rol :')->setRequired(true); 
		
	$role->addMultiOption(0, "Seleccionar Rol");		

	//cargo en un select los departamentos
        $table = new Application_Model_DbTable_Rol();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $role->addMultiOption($c->role, $c->role);
        }
        
       
        //Combo del recursos
        $recurso = new Zend_Form_Element_Select('recurso');
        $recurso->setLabel('Recurso :')->setRequired(true); 
		
	$recurso->addMultiOption(0, "Seleccionar Recurso");		

	//cargo en un select los departamentos
        $table = new Application_Model_DbTable_Recurso();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $recurso->addMultiOption($c->recurso, $c->recurso);
        }
        
        
        
        //Combo del permisos
        $permiso = new Zend_Form_Element_Select('permiso');
        $permiso->setLabel('Permiso :')->setRequired(true); 
		
	$permiso->addMultiOption(0, "Seleccionar Permiso");		

	//cargo en un select los departamentos
        $table = new Application_Model_DbTable_Permiso();
        //obtengo listado de todos los departamentos y los recorro en un
        //arreglo para agregarlos a la lista
        foreach ($table->listar() as $c)
        {
            $permiso->addMultiOption($c->permiso, $c->permiso);
        }
 
        
        
        $submit = new Zend_Form_Element_Submit('submit');
        $submit->setAttrib('id', 'submitbutton');

        $this->addElements(array($role,$recurso,$permiso,$submit));	
        
        
    }


}

