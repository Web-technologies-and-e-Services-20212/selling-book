<?php
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/d433183ff3.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="public/css/style.css" type="text/css">
        <link rel="shortcut icon" href="public/images/logo/logo_icon.png" type="image/x-icon">
        <title>IPM | Trang chủ</title>
    </head>
    <body>
        <!-- Nội dung phần Header -->
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
        <!-- Kết thúc nội dung phần Header -->

        <!-- Nội dung phần Body -->
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'main_content.php'; ?>
        <!-- Kết thúc nội dung phần Body -->

        <!-- Nội dung phần Footer --> 
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>

        <!-- JS chung  -->
        <!-- JS riêng -->
        <script src="public/javascript/main_content.js"></script>
        <script src="public/javascript/slide.js"></script>
    </body>
</html>

        

    