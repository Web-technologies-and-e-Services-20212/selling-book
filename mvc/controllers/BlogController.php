<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class BlogController extends DefaultController implements Controller{


    public function __render(){
        $blogId = $this->getRoute();
        require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'blog.php';
    }
}