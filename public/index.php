<?php

$path_project = 'selling-book';


// Định nghĩa đường dẫn gốc và ký hiệu /
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', $_SERVER['DOCUMENT_ROOT'] . DS . $path_project);

require_once ROOT . DS . 'mvc' . DS . 'controllers' . DS . 'RouteController.php';
// Lấy url trên đường dẫn
$url = isset($_GET["url"]) ? $_GET["url"] : "/";


// // /* Test backend - Do not delete - Only comment this - love you !!!
// echo "<pre>";

// $bookService = new BookServices();
// // $book = $bookService->getAllSortByPriceDesc(12, 2, 10);
// // $book = $bookService->search(1, 10, 'Chào');
// // $book = $bookService->getBookByCategory(63);
// $book = $bookService->getBookByAuthor('Akihito Tsukushi');
// print_r($book);

// echo "</pre>";
// exit(1);
// // */

$route = new RouteController($url);
$route->show();


