<?php
/* Seteo y Configuración de Directorios */ 
$rootPath = dirname(dirname(__FILE__)); 
   
$paths = new ArrayObject();
$paths->append(get_include_path());
$paths->append($rootPath .'/application');
$paths->append($rootPath .'/application/configs');
$paths->append($rootPath .'/library');

set_include_path(implode(PATH_SEPARATOR, $paths->getArrayCopy())); 


require 'Bootstrap.php'; 
Bootstrap::setBaseDir($rootPath);
Bootstrap::main();
			