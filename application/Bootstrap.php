<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    protected function _initRegisterControllerPlugins() { 
        $this->bootstrap('frontController') ; 
        $front = $this->getResource('frontController') ; 
        $front->registerPlugin(new Wakejoe_Navigation_Navigation()); 
    } 
    
    public function _initDbAdapter(){
        $this->bootstrap('db');
        $db = $this->getResource('db');
        Zend_Registry::set('db', $db);
    }

}

