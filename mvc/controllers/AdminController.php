<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class AdminController extends DefaultController implements Controller
{

    private $route;
    public function __construct($route)
    {
        $this->route = $route;
    }
    public function __render()
    {
        switch ($this->route) {
            case 'dashboard':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'dashboard.php';
                break;
            case 'manage-product':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'manage_product.php';
                break;
            default:
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'dashboard.php';
                break;
        }
    }
}
