<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class DashBoardController extends DefaultController implements Controller
{
    public function __render()
    {
        require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'dashboard.php';
    }
}
