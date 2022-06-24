<?php

class RouteController {
    private $_url;
    private $_dispath;
    private $_is_footer;

    function __construct($url) {
        $this->_url = $url;
        $this->_is_footer = 1;

        self::parsingURL();
    }


    /*****
    Hàm xử lý điều hướng URL 
    Author: Trần Lâm
    Update: 23/06/2022
    */
    function parsingURL(){
        // Điều hướng tới HomePage nếu url = "/"
        if(strcmp($this->_url, "/") == 0) {
            require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'HomeController.php';
            $this->_dispath = new HomeController();
            return;
        }

        //Lấy danh sách tham số ở trên url
        $urlArray = explode("/", $this->_url);
        $controller = $urlArray[0]; array_shift($urlArray);
        $id = -1; //id của sản phẩm

        // kiểm tra nếu xem chi tiết => lấy ra id của sản phẩm
        if(strcmp($controller, "details") == 0){
            $id = intval($urlArray[0]); array_shift($urlArray);
        }

        // check if admin -> no footer ??????/
        // Cần kiểm tra lại
        if(strcmp($controller, "admin") == 0
            || strcmp($controller, "product-management") == 0
            || strcmp($controller, "account-management") == 0
            || strcmp($controller, "login-admin") === 0){
            $this->_is_footer = 0;
        }

        // if link is account-management => controller of link is AccountManagementController
        $controller = str_replace('-', ' ', $controller);
        $controller = ucwords($controller);
        $controller = str_replace(' ', '', $controller);
        $controller .= "Controller"; // example : AboutController, ContactController,...

        // Thêm Controller tương ứng
        require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . $controller . '.php';
        if($id == -1){
            $this->_dispath = new $controller();
        } else {
            $this->_dispath = new $controller($id);
        }
    }

    /*****
    Hàm hiển thị giao diện
    Author: Trần Lâm
    Update: 23/06/2022
    */
    function show() {
        $this->_dispath->__render();
        // if($this->_is_footer == 1) $this->_dispath->__footer();
    }
}