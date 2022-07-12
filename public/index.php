<?php

$path_project = 'selling-book';


// Định nghĩa đường dẫn gốc và ký hiệu /
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', $_SERVER['DOCUMENT_ROOT'] . DS . $path_project);

require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'RouteController.php';
require_once ROOT . DS . 'services' . DS . 'BookServices.php';
// Lấy url trên đường dẫn
$url = isset($_GET["url"]) ? $_GET["url"] : "/";

echo "Hello";
echo '<br/>';
echo "Hello";
echo '<br/>';

$bookService = new BookServices();
$books = $bookService->getAll(1);
$firstBook = $books[0];
print_r($firstBook->getCategory());
exit(1);

$route = new RouteController($url);
$route->show();


