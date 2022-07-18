<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class AccountController extends DefaultController implements Controller
{

    //Override
    public function __render()
    {
        switch ($this->getRoute()) {
            case 'address':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'account_address.php';
                break;
            case 'order':
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'account_order.php';
                break;
            default:
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'account.php';
        }
    }
}
