<?php
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/d433183ff3.js" crossorigin="anonymous"></script>
        <link rel="shortcut icon" href="public/images/logo/logo_icon.png" type="image/x-icon">
        <link rel="stylesheet" href="public/css/style.css" type="text/css">
        <title>IPM | Tất cả sản phẩm</title>
    </head>
    <body>
        <!-- Nội dung phần Header -->
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
        <!-- Kết thúc nội dung phần Header -->

        <!-- Nội dung phần Danh sách sản phẩm -->
        <div class="w100p list-products borderblack">
            <div class="container borderblack">
                <div class="list-products-wrapper flex borderblack">
                    <div class="categories borderblack">
                        <div class="category-title">Danh mục</div>
                        <ul class="category-list">
                            <li>Trinh Thám - Kinh dị</li>
                            <li>Văn học hiện đại</li>
                            <li>Văn học kinh điển</li>
                            <li>Fantasy</li>
                            <li>Light Novel</li>
                            <li>Boys Love</li>
                            <li>Manga - Comic</li>
                            <li>Sách thiếu nhi</li>
                        </ul>
                    </div>
                    <div class="list-pro">

                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc nội dung phần Danh sách sản phẩm -->

        <!-- Nội dung phần Footer --> 
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    </body>
</html>

        

    