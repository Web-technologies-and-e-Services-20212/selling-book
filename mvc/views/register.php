<?php
if (array_key_exists("username", $_POST)) {
    $lastName = $_POST['lname'];
    $firstName = $_POST['fname'];
    $username = $_POST['username'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];
    $password = sha1($_POST['password']);
    
    $name = $lastName . " " . $firstName;
    require_once ROOT . DS . 'services' . DS . 'GuestServices.php';
    require_once ROOT . DS . 'mvc' . DS . 'models' . DS . 'Guest.php';
    $guest = new Guest($username, $password, $name, $address,$phone );
    $service = new GuestServices();

    $isExitUser = $service->checkUsernameExist($username);
    $exitUserMessage = "Email đã tồn tại trong hệ thống !";

    if(!$isExitUser) {
        $service->insert($guest);
        header("Location: login");
    } else {
        // echo "<script type='text/javascript'>alert('tài khoản đã tồn tại trong hệ thống');</script>";
        // header("Location: register");
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/selling-book/public/icon/fontawesome-free-v6/css/all.css">
    <link rel="shortcut icon" href="/selling-book/public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="/selling-book/public/css/base.css" type="text/css">
    <link rel="stylesheet" href="/selling-book/public/css/layout/register.css" type="text/css">
    <title>IPM | Đăng ký </title>

</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Register -->
    <div class="w100p">
        <div class="container m-b30">
            <div class="register__title p-tb10 p-lr10 text-center">
                <h1>Tạo tài khoản</h1>
                <div class="line"></div>
            </div>

            <div class="register__form p-lr15 p-tb15 m-b20">
                <?php if(isset($exitUserMessage)){ ?>
                    <div class="error-exits"><?php echo $exitUserMessage; ?></div>
                <?php }?>
                <form action="" id="create-customer" method="POST">
                    <div id="form-last_name" class="form__input">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-user"></i>
                        </label>
                        <input type="text" name="lname" oninput="setCustomValidity('')" required id="last_name" placeholder="Họ">
                    </div>

                    <div id="form-first_name" class="form__input">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-user"></i>
                        </label>
                        <input type="text" name="fname" oninput="setCustomValidity('')" required id="first_name" placeholder="Tên">
                    </div>

                    <div id="form-email" class="form__input">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-envelope"></i>
                        </label>
                        <input type="email" name="username" oninput="setCustomValidity('')" required id="email" placeholder="Email">
                    </div>

                    <div id="form-email" class="form__input">
                        <label for="" class="form__lable-icon">
                        <i class="fa-solid fa-map-location"></i>
                        </label>
                        <input type="text" name="address" required oninput="setCustomValidity('')" id="address" placeholder="Địa chỉ">
                    </div>

                    <div id="form-email" class="form__input">
                        <label for="" class="form__lable-icon">
                        <i class="fa-solid fa-phone"></i>
                        </label>
                        <input type="tel" name="phone" required oninput="setCustomValidity('')" id="phone" placeholder="Số điện thoại">
                    </div>

                    <div id="form-password" class="form__input relative">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <input type="password" name="password" onchange="validateRegister()" oninput="setCustomValidity('')" required id="register-password" placeholder="Mật khẩu">
                    </div>

                    <div id="form-password" class="form__input relative">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <input type="password" name=confirm-password" onkeyup="validateRegister()" oninput="setCustomValidity('')" required id="confirm-password" placeholder="Xác nhận mật khẩu">
                        
                    </div>

                    <div id="form-action">
                        <input type="submit" value="Đăng ký" class="btn w100p m-t20 btn-default">
                    </div>

                    <div id="form-back" class="m-t14">
                        <a href=<?php echo "/" . $path_project . "/" ?>>Quay về</a>
                    </div>

                    <!-- <div id="form-login_social" class="m-t20 m-b10 flex f-space_between ">
                        <button class="btn btn-icon-center w45p icon-fb">
                            <i class="fa-brands fa-facebook-f"></i>
                        </button>

                        <button class="btn btn-icon-center w45p icon-gg">
                            <i class="fa-brands fa-google"></i>
                        </button>
                    </div> -->
                </form>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Register -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    <script src="public/javascript/base.js"></script>
</body>

</html>