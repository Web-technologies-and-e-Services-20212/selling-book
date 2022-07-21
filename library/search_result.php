<?php
require_once '../lib_config.php';


$searchText = $_POST['search'];

require_once ROOT . DS . 'services' . DS . 'BookServices.php';
$service = new BookServices();
$service->search(1, 12, $searchText);
// echo "<script>alert("Thêm thành công!")</script>"
header("Location: /search ");