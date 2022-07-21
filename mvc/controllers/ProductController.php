<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class ProductController extends DefaultController implements Controller{


    public function __render(){
        $productId = $this->getRoute();
        require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'product.php';
    }
}