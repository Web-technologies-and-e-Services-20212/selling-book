<?php

$path_project = 'selling-book';


// Định nghĩa đường dẫn gốc và ký hiệu /
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', $_SERVER['DOCUMENT_ROOT'] . DS . $path_project);

require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'RouteController.php';
// Lấy url trên đường dẫn
$url = isset($_GET["url"]) ? $_GET["url"] : "/";




$route = new RouteController($url);
$route->show();


