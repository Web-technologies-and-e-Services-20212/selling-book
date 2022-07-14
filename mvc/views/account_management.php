<?php
require_once ROOT . DS . 'services' . DS . 'GuestServices.php';

require_once ROOT . DS . 'services' . DS . 'BookServices.php';
$service = new GuestServices();
$guests = $service->getAll();
$listTmpBill = $service->getAllListProductsBill();


$user = "";
$phone = "";
$name = "";

if (array_key_exists("user", $_POST)) {
    $user = strtolower($_POST['user']);
}
if (array_key_exists("name", $_POST)) {
    $name = strtolower($_POST['name']);
}
if (array_key_exists("phone", $_POST)) {
    $phone = strtolower($_POST['phone']);
}

$users = array();
$listBill = array();
foreach ($guests as $g) {
    $guser = strtolower($g->getUsername());
    $gname = strtolower($g->getName());
    $gphone = strtolower($g->getPhoneNumber());
    if (($user == "" || strpos($guser, $user) !== false) && ($name == "" || strpos($gname, $name) !== false) &&
        ($phone == "" || strpos($gphone, $phone) !== false)
    ) {
        array_push($users, $g);
    }
}

?>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/css/style.css" type="text/css">
    <script src="https://kit.fontawesome.com/4326137641.js" crossorigin="anonymous"></script>
    <title>Dashboard</title>

</head>



<body>
    <div class='dashboard'>
        <div class='top-nav-bar'>
            <div class='logo'>
                <img src="public/images/logo/logo_icon.png" />

            </div>
            <div class="search-box">
                <form class="relative w100p">
                    <label htmlFor="search" class="hidden"></label>
                    <input class="search-text" name="search" id="search" type="search" placeholder="Tìm kiếm ..."></input>
                    <button type="submit" class="search-btn absolute">
                        <i class="fa fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <div class='time'> <?php

                                $dt = new DateTime("now", new DateTimeZone('Asia/Ho_Chi_Minh'));
                                echo 'Ngày hôm nay : ';
                                echo  $dt->format('m/d/Y')
                                ?></div>

            <div class='right-items'>
                <i style='vertical-align: middle; margin-right: 15px' class="fa fa-solid fa-bell fa-2x"></i>
                <i style='vertical-align: middle' class="fa fa-thin fa-user fa-2x"></i>
            </div>
        </div>
        <ul>
            <li><a href="/selling-book/admin">Home</a></li>
            <li><a href="/selling-book/product-management">Sản phẩm</a></li>
            <li><a href="/selling-book/account-management">Tài khoản</a></li>
            <li><a href="/selling-book/blog-management">Blog</a></li>
            <li><a href="/selling-book/banner-management">Banner</a></li>
            <li><a href="/selling-book/order-management">Đơn hàng</a></li>
        </ul>

        <div class='content'>
            <div style='margin-top:65px'>
                <h1>Quản lý tài khoản </h1>

                <table style="width:100%;">
                    <tr>
                        <th>UserName</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                    <?php
                    foreach ($users as $u) {
                    ?>
                        <tr>
                            <td><?php echo $u->getUsername() ?></td>
                            <td><?php echo $u->getName() ?></td>
                            <td><?php echo $u->getPhoneNumber() ?></td>
                            <td><?php echo $u->getAddress() ?></td>
                        </tr>
                    <?php } ?>
                </table>


            </div>

        </div>
    </div>


</body>

</html>