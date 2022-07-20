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
            case '/':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'dashboard.php';
                break;
            case 'product-management':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'product_management.php';
                break;
            case 'account-management':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'account_management.php';
                break;
            case 'banner-management':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'banner_management.php';
                break;
            case 'product-management':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'product_management.php';
                break;
            case 'blog-management':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'blog_management.php';
                break;

            case 'order-management':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'order_management.php';
                break;
            default:
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'admin' . DS . 'dashboard.php';
                break;
        }
    }
}
