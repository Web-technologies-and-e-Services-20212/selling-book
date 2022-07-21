<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";
require_once ROOT . DS . 'library' . DS . 'format.php';

if (!isset($_SESSION)) {
    ob_start();
    session_start();
}
if (!isset($_SESSION['username']) || $_SESSION['username'] == '') {
    header("Location: login");
}


$service = new GuestServices();
$listCartProducts = $service->getListCartBooks($_SESSION['username']);
$billBookArray = array();
foreach ($listCartProducts as $key => $cartBook) {
    $book = $cartBook['book'];
    $bookId = $book->getBookId();
    $quantity = $cartBook['quantity'];
    array_push($billBookArray, ['bookId' => $bookId, 'quantity' => $quantity]);
}

$billId = $service->submitBill($_SESSION['username'], $billBookArray);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d433183ff3.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="/selling-book/public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="/selling-book/public/css/base.css" type="text/css">
    <title>IPM | Hoàn tất đơn hàng</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần About -->
    <div id="cart" class="w100">
        <div class="container">
            <span class="flex f-align_center f-center">
                <i class="fa-solid fa-circle-check" style="font-size:80px ; color:#01a14b"></i>
            </span>

            <div class="flex m-t30 m-b30">
                <div class="w100p text-center">
                    <h2>Hoàn tất đơn hàng</h2>
                </div>

                <p></p>
                <div class="w100p text-center">
                    <h3>Mã đơn hàng của bạn là : <a href=<?php echo "/" . $path_project . "/account" . "/orders" . "/" . sha1($billId) ?>>
                        #<?php echo $billId ?></a>
                    </h3>
                </div>


                <div class="w100p p-lr15">
                    <a href=<?php echo "/" . $path_project  ?> class="back">
                        <i class="fa-solid fa-reply"></i>
                        Tiếp tục mua hàng
                    </a>
                </div>

            </div>

        </div>
    </div>
    <!-- Kết thúc nội dung phần About -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>

    <script src="public/javascript/cart.js"></script>
</body>

</html>