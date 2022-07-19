<?php
require_once '../lib_config.php';

// check session
ob_start();
session_start();

require_once ROOT . DS . 'services' . DS . 'GuestServices.php';
// require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Bill.php';

$service = new GuestServices();
$listCartProducts = $service->getListCartBooks($_SESSION['username']);
$billBookArray = array();
foreach ($listCartProducts as $key => $cartBook) {
    $book = $cartBook['book'];
    $bookId = $book->getBookId();
    $bookQuantity = $cartBook['quantity'];
    if($bookQuantity != $_POST['quantity-product' .$bookId ]){
        $service->updateBookToCart($_SESSION['username'],$book, $_POST['quantity-product' .$bookId ] );
    }
}
header("Location: ../../checkout");

