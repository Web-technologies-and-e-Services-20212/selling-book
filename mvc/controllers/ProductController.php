<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class ProductController extends DefaultController implements Controller{

    private $id;

    public function __construct($id)
    {
        $this->id = $id;
    }

    public function __render(){
        $productId = $this->id;
        require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'product.php';
    }
}