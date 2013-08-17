<?php

require_once 'Zend/Loader/Autoloader.php';
$loader = Zend_Loader_Autoloader::getInstance();

final class BootStrap
{
    
    private static $_basedir = null;
    
    public static function main()
    {

        /* Carga el archivo de configuracion ini */
        self::initConfig();        
        
        /* Configuracion de manejo de error y Locale */
        self::initEnvironmet();
        
        /* Inicializa Layout */
        self::initLayout();
                                
        /* Base de Datos*/
        self::initDataBase();
        
        /*Lenjuaje*/
        self::initLanguaje();
        
        /* Front Controller y Dispatch */
        /*Agregar cualquier otra función antes de esta*/
        self::initFrontController();
        
        
    }
    
    
    public static function initEnvironmet()
    {
        error_reporting(E_ALL | E_STRICT); 
        $timezone = (string)Zend_Registry::get('config')->parametros->timezone;
        
        if(empty($timezone)){
            $timezone = "America/Lima";
        }
        
        date_default_timezone_set($timezone); 
        
    }    
 
    
    public static function initConfig()
    {
        
        $config = new Zend_Config_Ini('application.ini', 'default'); 
        Zend_Registry::set('config', $config); 
        return $config;
    }
    
    
    public static function initLayout()
    {       
        $config = Zend_Registry::get('config');
        $layout = Zend_Layout::startMvc($config->propertieslayout);
        //$layout->titulo = $config->parametros->titulo;
        return $layout;
    }    
    
    public static function initFrontController()
    {
        require_once 'Plugins/Myplugin.php';
        require_once 'My/Acl.php';
   
        $acl = new My_Acl();
        $auth = Zend_Auth::getInstance();

        $frontController = Zend_Controller_Front::getInstance();
 
        $frontController->registerPlugin(new Plugins_Myplugin($auth,$acl));
        
        $frontController->setControllerDirectory(self::getRootApp().'/controllers')
                        ->throwExceptions(true)
                        ->dispatch(); 

        //$frontController->addModuleDirectory(self::getRootApp().'/modules')
          //              ->throwExceptions(true)
           //             ->dispatch(); 
        
    } 
    
    public static function initDataBase()
    {
        
        $config = Zend_Registry::get('config');        
        $db = Zend_Db::factory($config->database); 
        Zend_Db_Table_Abstract::setDefaultAdapter($db); 
        Zend_Registry::set('db', $db); 
        
    }
    
    public static function initLanguaje()
    {
       
        $translate = new Zend_Translate('array', self::getRootApp().'/resources/languages/es/Zend_Validate.php', 'es');        
        Zend_Validate_Abstract::setDefaultTranslator($translate);  
        
    }
    
    public static function setBaseDir($dir)
    {
        self::$_basedir = $dir;
    }

    public static function getBaseDir()
    {
        return self::$_basedir;
    }    

    public static function getRootApp()
    {
        return self::getBaseDir().DIRECTORY_SEPARATOR.'application';
    }    
    
}