<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class ListProductsController extends DefaultController implements Controller
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
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_products.php';
                break;
            case 'detective':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_detective.php';
                break;
            case 'modern-literature':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_modern.php';
                break;
            case 'classic-literature':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_classic.php';
                break;
            case 'fantasy':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_fantasy.php';
                break;
            case 'light-novel':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_novel.php';
                break;
            case 'manga':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_manga.php';
                break;
            case 'learning-book':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_learning.php';
                break;

            default:
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'listCategory' . DS . 'list_products.php';
                break;
        }
    }
}
