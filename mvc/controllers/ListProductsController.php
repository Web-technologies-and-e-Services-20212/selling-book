<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class ListProductsController extends DefaultController implements Controller{

    private $route;
    public function __construct($route) {
        $this->route = $route;
    }
    public function __render(){
        switch ($this->route) {
            case '/':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_products.php';
                break;
            case 'detective':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_detective.php';
                break;
            default:
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_products.php';
                break;
        }
        
    }
}