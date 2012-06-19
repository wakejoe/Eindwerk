<?php

class Admin_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $this->loginAction();
    }
    
    public function loginAction()
    {
      
        $this->view->form = new Admin_Form_Users();
        // controle en mail versturen
        if ($this->getRequest()->isPost())
        {die('werk');
            $postParams = $this->getRequest()->getPost();
            
            if ($this->view->form->isValid($postParams)){
                $params = $this->view->form->getValues();
                die('werk');
                $auth = Zend_Auth::getInstance();
                
                $authAdapter = new Zend_Auth_Adapter_DbTable(Zend_Registry::get('db'));
                
                $authAdapter->setTableName('users')
                            ->setIdentityColumn('username')
                            ->setCredentialColumn('password')
                            ->setIdentity($params['login'])
                            ->setCredential(md5($params['password']));
                
                $result = $auth->authenticate($authAdapter);
                
                if ($result->isValid()){
                    
                    $identity = Zend_Auth::getInstance()->getIdentity();
                    echo 'ingelogd als ' . $identity;
                    
                } else {
                    die('ér niet door');
                    foreach($result->getMessages() as $message) {
                        
                        echo $message;
                        
                    }
                    
                    //doen wat je wilt, redirect, error, ...
                }
      
            }else{
                $loginErrors = new Zend_Session_Namespace('loginErrors');
                $loginErrors->errors = $this->view->form->getErrors();
                //die('alles invullen!');
                
           }
        }
    }


}

