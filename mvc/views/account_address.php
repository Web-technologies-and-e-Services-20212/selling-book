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

            

            <div class="input-group m-t10 m-b10">
                <span class="input-group-addon">
                    <i class="fa-solid fa-user"></i>
                </span>
                <input required name="lname" type="text" id="contactFormName" size="40" placeholder="Họ" class="p-b15 textbox form-control">
            </div>

            <div class="input-group m-t10 m-b10">
                <span class="input-group-addon">
                    <i class="fa-solid fa-user"></i>
                </span>
                <input required name="fname" type="text" id="contactFormName" size="40" placeholder="Tên" class="p-b15 textbox form-control">
            </div>

            <div class="input-group m-t10 m-b10">
                <span class="input-group-addon">
                    <i class="fa-solid fa-user"></i>
                </span>
                <input required name="address" type="text" id="contactFormName" size="40" placeholder="Địa chỉ" class="p-b15 textbox form-control">
            </div>

            <div class="input-group m-t10 m-b10">
                <span class="input-group-addon">
                    <i class="fa-solid fa-user"></i>
                </span>
                <input required name="phone" type="tel" id="contactFormName" size="40" placeholder="Địa chỉ" class="p-b15 textbox form-control">
            </div>


        </div>
    </div>
    <!-- Kết thúc nội dung phần Account -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>