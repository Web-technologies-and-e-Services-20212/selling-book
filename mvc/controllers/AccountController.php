<?php
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'Controller.php';
require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'DefaultController.php';

class AccountController extends DefaultController implements Controller
{

    //Override
    public function __render()
    {
        $currentRoute = $this->getRoute();
        if($currentRoute == "/"){
            require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'account.php';

        }else{
            $urlArray = explode("/", $currentRoute);
            if($urlArray[0] == "orders"){
                $orderId = $urlArray[1];
                require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'account_order.php';
            }else{
                require_once ROOT . DS  . '404.php';
            }
            

        }
    }
}
