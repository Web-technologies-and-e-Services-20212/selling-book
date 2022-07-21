<?php
require_once ROOT . DS . "services" . DS . "NewsServices.php";

$blogStore = new NewsServices();
$blog = $blogStore->getById($blogId);
$blogTitle = $blog->getTitle();
$blogContent = $blog->getContent();

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
    <link rel="stylesheet" href="/selling-book/public/css/layout/blog.css" type="text/css">
    <title>IPM | <?php echo $blogContent; ?> </title>

</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Product -->
    <div class="w100p">
        <div class="container">
            <div class="header-page">
                <h1><?php echo $blogTitle; ?></h1>
            </div>
            <div class="line"></div>
            <div class="content-page">
                <?php echo $blogContent; ?>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Product -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>