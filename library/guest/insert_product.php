<?php
require_once '../lib_config.php';

// check session
ob_start();
session_start();

require_once ROOT . DS . 'services' . DS . 'GuestServices.php';
// require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Bill.php';

$service = new GuestServices();
$listCartProducts = $service->getListCartBooks($_SESSION['username']);
foreach ($listCartProducts as $key => $cartBook) {
    $book = $cartBook['book'];
    $bookId = $book->getBookId();
}
$quantityArr = $_POST['quantity-product'];
// $text = $_POST['list_quantity'];
// $list_text = explode(" ", $text);
$x = 1;
// $list_quantity = array();
// foreach ($list_text as $text) {
//     array_push($list_quantity, intval($text));
// }

// $lens = count($listProducts);
// for($i=0; $i<$lens; $i++){
//     $product = $listProducts[$i];
//     $quantity = $list_quantity[$i];
//     $total_money = $product->getPrice() * $quantity;
//     $bill = new Bill($product->getProductID(), $_SESSION['username'], date_create()->format('Y-m-d h:i:s'), $total_money, $quantity);

//     $service->submitBill($bill);
//     $service->removeProduct($product->getProductID(), $_SESSION['username']);
// }
// header("Location: ../cart");
