<?php

class Wakejoe_Navigation_Navigation extends Zend_Controller_Plugin_Abstract
{
    public function preDispatch(Zend_Controller_Request_Abstract $request) {
             
        $local = Zend_Registry::get('Zend_Locale');
        $model = new Application_Model_Page();
        $pages = $model->getMenu($local);
        
        $container = new Zend_Navigation();
        
        foreach ($pages as $page) {
            if($page['title'] != 'Admin'){
                $menu = new Zend_Navigation_Page_Mvc(array(
                    'label'      => $page['title'],
                    'route'      => 'page',   
                    'params'     => array('titleUrl' => $page['titleURL'],
                                          'lang' => $local)
                ));
                $container->addPage($menu);
            }
        }
        $admin = new Zend_Navigation_Page_Mvc(array(
            'label'      => 'Admin',
            'action'     => 'index',   
            'controller' => 'index',
            'module'     => 'admin'
            
        ));
        $container->addPage($admin);
        
        // get the layout instance
        $layout = new Zend_Layout();
        // get the view instance of the layout
        $view = $layout->getView();
        // container toevoegen aan de navigation
        $view->navigation($container);
    }
}
?>
