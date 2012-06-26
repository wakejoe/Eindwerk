<?php

class Admin_PageController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function addAction()
    {
        //$this->_helper->getHelper('layout')->disableLayout();
        $form = new Admin_Form_Page();
        $this->view->form = $form;
           if ($this->getRequest()->isPost()) 
            {
            // haal alle post variabelen op 
            $postParams = $this->getRequest()->getPost();
            if ($this->view->form->isValid($postParams)){
                $params = $this->view->form->getValues();
                
                $modelPageLocal = new Admin_Model_Pagelocal();
                $modelPage      = new Admin_Model_Page();
                $modelTranslate = new Admin_Model_Translate();
                
                
                // hard gecodeerd, maar zou eigenlijk uit de database moeten komen ingeval dat er nieuwe statussen bij komen. 
                if($params['menu'] == 'ja' && $params['status'] == 'online') {
                    
                    $status = 1;
                    
                } else if ($params['menu'] == 'nee' && $params['status'] == 'online') {
                    
                    $status = 2;
                    
                } else if ($params['menu'] == 'ja' && $params['status'] == 'offline') {
                    
                    $status = 3;
                    
                } else {
                    
                    $status = 4;
                    
                }
                                
                $values = array (
                    'pageID'        => $status,
                    'title'         => $params['pageTitle'],
                    'titleURL'      => $params['titleURL'],
                    'description'   => $params['description'],
                    'local'         => $params['country']
                );          
                
                if($modelPageLocal->insert($values)) {
                    
                    $valuesTeaserTitle = array (
                        'tag'           => $params['pageTitle'].'.teaserTitle',
                        'translation'   => $params['teaserTitle'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTeaserTitle);
                    
                    $valuesTeaserSubtitle = array (
                        'tag'           => $params['pageTitle'].'.teaserSubtitle',
                        'translation'   => $params['teaserSubtitle'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTeaserSubtitle);
                    
                    $valuesTeaserTxt = array (
                        'tag'           => $params['pageTitle'].'.teaserTxt',
                        'translation'   => $params['teaserTxt'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTeaserTxt);
                    
                    $valuesTitle = array (
                        'tag'           => $params['pageTitle'].'.title',
                        'translation'   => $params['title'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTitle);
                    
                    $valuesTxt = array (
                        'tag'           => $params['pageTitle'].'.txt',
                        'translation'   => $params['txt'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTxt);
                    
                    $valuesTeaserPicUrl = array (
                        'tag'           => $params['pageTitle'].'.teaserPicUrl',
                        'translation'   => $params['teaserPicUrl'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTeaserPicUrl);
                    
                    $valuesTeaserPicAlt = array (
                        'tag'           => $params['pageTitle'].'.teaserPicAlt',
                        'translation'   => $params['teaserPicAlt'],
                        'translated'    => 1,
                        'local'         => $params['country']
                    );
                    $modelTranslate->insert($valuesTeaserPicAlt);
                        
                } else {
                    
                        echo '<pre>';
                        print_r('Er heeft zich een error voorgedaan');
                        echo '</pre>';
                        die();
                        
                } 
            }
        }
    }
}



