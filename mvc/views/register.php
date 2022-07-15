<?php

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/selling-book/public/icon/fontawesome-free-v6/css/all.css">
    <link rel="shortcut icon" href="/selling-book/public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="/selling-book/public/css/style.css" type="text/css">
    <link rel="stylesheet" href="/selling-book/public/css/layout/register.css" type="text/css">
    <title>IPM | Đăng ký </title>

</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Register -->
    <div class="w100p">
        <div class="container p-t30 m-b30">
            <div class="register__title p-tb10 p-lr10 text-center">
                <h1>Tạo tài khoản</h1>
                <div class="line"></div>
            </div>

            <div class="register__form p-lr15 p-tb15 m-b20">
                <form action="/" id="create-customer">
                    <div id="form-last_name" class="form__input">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-user"></i>
                        </label>
                        <input type="text" name="lname" id="last_name" placeholder="Họ">
                    </div>

                    <div id="form-first_name" class="form__input">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-user"></i>
                        </label>
                        <input type="text" name="fname" id="first_name" placeholder="Tên">
                    </div>

                    <div id="form-email" class="form__input">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-envelope"></i>
                        </label>
                        <input type="text" name="lastName" id="email" placeholder="Email">
                    </div>

                    <div id="form-password" class="form__input relative">
                        <label for="" class="form__lable-icon">
                            <i class="fa-solid fa-lock"></i>
                        </label>
                        <input type="password" name="password" id="password" placeholder="Mật khẩu">
                        <div onclick="togglePassword()" class="toggle-password"><i class="fa-solid fa-eye"></i></div>
                    </div>

                    <div id="form-action">
                        <input type="submit" value="Đăng ký" class="btn w100p m-t20 btn-default">
                    </div>

                    <div id="form-back" class="m-t14">
                        <a href="#">Quay về</a>
                    </div>

                    <div id="form-login_social" class="m-t20 m-b10 flex f-space_between ">
                        <button class="btn btn-icon-center w45p icon-fb">
                        <i class="fa-brands fa-facebook-f"></i>
                        </button>

                        <button class="btn btn-icon-center w45p icon-gg">
                        <i class="fa-brands fa-google"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Register -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    <script src="library/javascript/base.js"></script>
</body>

</html>