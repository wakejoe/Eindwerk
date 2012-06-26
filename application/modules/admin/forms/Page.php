<?php

class Admin_Form_Page extends Zend_Form
{

    public function init()
    {
        //TITLE
        $this->addElement(new Zend_Form_Element_Text('pageTitle', array(
            'label' => 'label.title',
            'filters' => array('stringTrim'),
            'required =>' => true
        )));
        
        //URL
        $this->addElement(new Zend_Form_Element_Text('titleURL', array(
            'label' => 'label.titleUrl',
            'filters' => array('stringTrim'),
            'required =>' => true
        )));
        
        //description
        $this->addElement(new Zend_Form_Element_Text('description', array(
            'label' => 'label.description',
            'filters' => array('stringTrim'),
            'required =>' => true
        )));
        
        $menu = new Zend_Form_Element_Radio("menu", array(
            'label' => 'label.menu',
            'required =>' => true
        ));
        
        $menu->addMultiOption("ja","ja")->setAttrib("checked","checked")
               ->addMultiOption("nee","nee");
        
        $status = new Zend_Form_Element_Radio("status", array(
            'label' => 'label.status',
            'required =>' => true
        ));
        
        $status->addMultiOption("online","online")->setAttrib("checked","checked")
               ->addMultiOption("offline","offline");
        
        $this->addElement($menu);
        $this->addElement($status);
        
        $country = new Zend_Form_Element_Select('country');

        $country ->setLabel('label.country')
            ->addMultiOptions(array(
                    'nl_BE' => 'Nederlands',
                    'nl_FR' => 'Frans'
            ));
        $this->addElement($country);
        
        /*
         * CONTENT STUK
         */
        
        //description
        $this->addElement(new Zend_Form_Element_Text('teaserTitle', array(
            'label' => 'label.teaserTitle',
            'filters' => array('stringTrim')
        )));
        //description
        $this->addElement(new Zend_Form_Element_Text('teaserSubtitle', array(
            'label' => 'label.teaserSubtitle',
            'filters' => array('stringTrim')
        )));
        //description
        $this->addElement(new Zend_Form_Element_Text('teaserTxt', array(
            'label' => 'label.teaserTxt',
            'filters' => array('stringTrim')
        )));
        //description
        $this->addElement(new Zend_Form_Element_Text('title', array(
            'label' => 'label.title',
            'filters' => array('stringTrim')
        )));
        //description
        $this->addElement(new Zend_Form_Element_Text('txt', array(
            'label' => 'label.txt',
            'filters' => array('stringTrim')
        )));
        //description
        $this->addElement(new Zend_Form_Element_Text('teaserPicUrl', array(
            'label' => 'label.teaserPicUrl',
            'filters' => array('stringTrim')
        )));
        //description
        $this->addElement(new Zend_Form_Element_Text('teaserPicAlt', array(
            'label' => 'label.teaserPicAlt',
            'filters' => array('stringTrim')
        )));
        
        //button
        $this->addElement(new Zend_Form_Element_Button('submit', array(
            'type' => 'submit', 
            'value' => 'lable.addPage', 
            'required' => false,
            'ignore' => true
        )));
    }


}

