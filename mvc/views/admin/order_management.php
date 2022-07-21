<?php

require_once ROOT . DS . 'services' . DS . 'GuestServices.php';

require_once ROOT . DS . 'services' . DS . 'BookServices.php';
$service = new GuestServices();
$username = $_GET['username'];

$bills = $service->getListBill($username);



?>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../public/css/style.css" type="text/css">
    <script src="https://kit.fontawesome.com/4326137641.js" crossorigin="anonymous"></script>
    <title></title>

</head>



<body>
    <div class='dashboard'>
        <div class='top-nav-bar'>
            <div class='logo'>
                <img src="../public/images/logo/logo_icon.png" />

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
            <li><a href="/selling-book/admin/product-management">Sản phẩm</a></li>
            <li><a href="/selling-book/admin/account-management">Tài khoản</a></li>
            <li><a href="/selling-book/admin/blog-management">Blog</a></li>
            <li><a href="/selling-book/admin/banner-management">Banner</a></li>
            <li><a href="/selling-book/admin/order-management">Đơn hàng</a></li>
        </ul>

        <div class='content'>
            <div style='margin-top:65px'>
                <h1>Quản lý đơn hàng </h1>
                <br>
                <br>

                <div style="width:28%; float:left; height: 70px;">
                    <p>Username: <?php $username ?> </p>
                    <input class="input1" type="text" name="user">
                </div>

                <table style="width:100%; border:1px solid black">
                    <tr>
                        <th>ID</th>
                        <th>UserName</th>
                        <th>Total price</th>
                        <th>Date of Bill</th>
                        <th>Status</th>
                    </tr>
                    <?php
                    foreach ($bills as $b) {
                    ?>
                        <tr style="text-align: center">
                            <td><?php echo $b->getBillID() ?></td>
                            <td><?php echo $b->getUsername() ?></td>
                            <td><?php echo $b->getTotalPrice() ?></td>
                            <td><?php echo $b->getDateBill() ?></td>
                            <td><?php echo $b->getStatus() ?></td>
                            <!-- <td><button class="btn" onclick=""><i style='vertical-align: middle' class="fa fa-solid fa-trash fa-2x"></i></button></td> -->
                        </tr>
                    <?php } ?>
                </table>
            </div>

        </div>
    </div>


</body>

</html>