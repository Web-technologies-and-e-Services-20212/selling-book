<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class BannerManagementController extends DefaultController implements Controller
{
    public function __render()
    {
        require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'banner_management.php';
    }
}
