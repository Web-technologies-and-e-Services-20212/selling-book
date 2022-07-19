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
    array_push($billBookArray, ['bookId'=> $bookId, 'quantity' => $_POST['quantity-product' .$bookId ]]);
}

$service->submitBill($_SESSION['username'], $billBookArray);
$x = 1;
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

