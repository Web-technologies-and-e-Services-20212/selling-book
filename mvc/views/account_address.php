<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";

ob_start();
session_start();
if (!isset($_SESSION['username']) || $_SESSION['username'] == '') {
    header("Location: ../login");
} else {
    if (!isset($currentUser)) {
        $guestService = new GuestServices();
        $currentUser = $guestService->get($_SESSION['username']);
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d433183ff3.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="../public/css/style.css" type="text/css">
    <link rel="stylesheet" href="/selling-book/public/css/layout/register.css" type="text/css">

    <title>IPM | Địa chỉ của bạn</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Account -->
    <div class="w100p" id="account">
        <div class="container">
            <span class="w100p account-title">
                <h1>Địa chỉ của bạn
                    <a href=<?php echo "/" . $path_project . "/account" ?> class="log-out">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Trở lại tài khoản
                    </a>
                </h1>
            </span>

            <div class="customer-info">
                <h2><?php echo $currentUser->getName(); ?></h2>
                <p><?php echo $currentUser->getUsername(); ?></p>
                <p></p>
                <div class="address">
                    <p><?php if (!empty($currentUser->getAddress())) {
                            echo $currentUser->getAddress();
                        } else echo "Bạn chưa cập nhật địa chỉ";
                        ?></p>
                    <p></p>
                    <p>VietNam</p>
                    <p></p>
                    <p><?php if (!empty($currentUser->getPhoneNumber())) {
                            echo $currentUser->getPhoneNumber();
                        } else echo "Bạn chưa cập nhật số điện thoại";
                        ?></p>
                    <p></p>
                    <p><a href=<?php echo "/" . $path_project . "/" . "account" . "/" . "address" ?>>Xem địa chỉ</a></p>
                </div>
            </div>

            <div class="input-group m-t10 m-b10">
                <span class="input-group-addon">
                    <i class="fa-solid fa-user"></i>
                </span>
                <input required type="name" id="contactFormName" size="40" placeholder="Tên của bạn" class="p-b15 textbox form-control">
            </div>


        </div>
    </div>
    <!-- Kết thúc nội dung phần Account -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>