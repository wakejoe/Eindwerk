<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    protected function _initRegisterControllerPlugins() { 
        $this->bootstrap('frontController') ; 
        $front = $this->getResource('frontController') ; 
        $front->registerPlugin(new Wakejoe_Translate_Translate()); 
        $front->registerPlugin(new Wakejoe_Navigation_Navigation()); 
    } 
    
    public function _initDbAdapter(){
        $this->bootstrap('db');
        $db = $this->getResource('db');
        Zend_Registry::set('db', $db);
    }
    
    public function _initMenu(){
        $this->bootstrap('layout');
        $layout = $this->getResource('layout');
        $view = $layout->getView();
        $view->addHelperPath(realpath(APPLICATION_PATH . '/views/helpers'), 'Application_View_Helper');        
    }

}

