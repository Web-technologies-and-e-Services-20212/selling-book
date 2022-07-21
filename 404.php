<?php
$path_project = 'selling-book';


// Định nghĩa đường dẫn gốc và ký hiệu /
define('DS', DIRECTORY_SEPARATOR);
define('ROOT', $_SERVER['DOCUMENT_ROOT'] . DS . $path_project);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d433183ff3.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="/selling-book/public/css/base.css" type="text/css">
    <link rel="stylesheet" href="/selling-book/public/css/layout/404.css" type="text/css">
    <title>IPM | 404</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần 404 -->
    <div class="container">
        <div class="img-404">
            <img src="public/images/logo/404.png" alt="Not Found">
        </div>
        <span class="title-404 text-center">
            <h1>Không tìm thấy trang</h1>
            <p>Xin lỗi, chúng tôi không tìm thấy trang này</p>
        </span>
        <div class="text-center p-b15">
        <button class="btn btn-default">
            <a href=<?php echo "/" . $path_project . "/" ?>>
                Quay lại trang chủ
            </a>
        </button>
        </div>
    </div>
    <!-- Kết thúc nội dung phần 404 -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>