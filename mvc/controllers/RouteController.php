<?php

class RouteController
{
    private $_url;
    private $_dispath;

    function __construct($url)
    {
        $this->_url = $url;

        self::parsingURL();
    }


    /*****
    Hàm xử lý điều hướng URL 
    Author: Trần Lâm
    Update: 23/06/2022
     */
    function parsingURL()
    {
        // Điều hướng tới HomePage nếu url = "/"
        if (strcmp($this->_url, "/") == 0) {
            require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'HomeController.php';
            $this->_dispath = new HomeController();
            return;
        }

        //Lấy danh sách tham số ở trên url
        $urlArray = explode("/", $this->_url);
        $controller = $urlArray[0];
        array_shift($urlArray);
        $param = -1; //Khởi tạo param

        // kiểm tra nếu xem chi tiết => lấy ra id của sản phẩm
        switch ($controller) {
            case 'product':
                $param = intval($urlArray[0]);
                array_shift($urlArray);
                break;
            case 'list-products':
                $param = isset($urlArray[0]) ? $urlArray[0] : "/";
                break;
            case 'admin':
                $param = $urlArray[0];
                break;
            case 'account':
                $param = isset($urlArray[1]) ? ($urlArray[0] . "/" . $urlArray[1])  : "/";
                break;
            default:
                # code...
                break;
        }

        // if link is account-management => controller of link is AccountManagementController
        $controller = str_replace('-', ' ', $controller);
        $controller = ucwords($controller);
        $controller = str_replace(' ', '', $controller);
        $controller .= "Controller"; // example : AboutController, ContactController,...

        // Thêm Controller tương ứng
        require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . $controller . '.php';
        if ($param == -1) {
            $this->_dispath = new $controller();
        } else {
            $this->_dispath = new $controller($param);
        }
    }

    /*****
    Hàm hiển thị giao diện
    Author: Trần Lâm
    Update: 23/06/2022
     */
    function show()
    {
        $this->_dispath->__render();
    }
}
