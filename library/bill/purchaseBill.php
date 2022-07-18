<?php
require_once '../lib_config.php';

// check session
ob_start();
session_start();

require_once ROOT . DS . 'services' . DS . 'GuestServices.php';
require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Bill.php';

$service = new GuestServices();
$billId = $_POST['billId'];
$bill = $service->getBill($billId);
if($bill->getUsername() == $_SESSION['username']){
    $service->updateStatusBill($billId, 'PAID');
}