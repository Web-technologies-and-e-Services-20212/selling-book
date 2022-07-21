<?php
require_once ROOT . DS . "services" . DS . "NewsServices.php";
$services = new NewsServices();
$listBlogs = $services->getAll();
$x = 10;

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
    <link rel="stylesheet" href="/selling-book/public/css/layout/blogs.css" type="text/css">
    <title>IPM | Tin tức</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Blogs -->
    <div class="w100p" id="blogs">
        <div class="container">
            <div class="grid-r4m3 w100p-md">
                <!-- Nội dung danh sách Blogs -->
                <div class="list-blogs flex">
                    <?php foreach ($listBlogs as $key => $blog) { ?>
                    <div class="blog-card p-tb15 w100p flex">
                        <div class="blog-img p-lr15 grid-r5m2 w100p-md">
                            <img src=<?php echo $blog->getImage(); ?> alt=<?php echo $blog->getTitle(); ?>>
                        </div>

                        <div class="blog-detail p-lr15 grid-r5m3 w100p-md">
                            <h2 class="m-b14"><a href=<?php echo "/" . $path_project . "/blog" . "/" . $blog->getNewsId(); ?>><?php echo $blog->getTitle(); ?></a></h2>
                            <span><?php echo $blog->getCreatedAt(); ?></span>
                            <span>TIN TỨC</span>
                            <span><i>0 Bình luận</i></span>
                            <p class="m-t14 m-b20"><?php echo $blog->getDescription(); ?>
                                <a href=<?php echo "/" . $path_project . "/blog" . "/" . $blog->getNewsId(); ?>>Xem thêm
                                <i class="fa-solid fa-arrow-right"></i>
                                </a>
                            </p>
                        </div>
                    </div>
                    <?php } ?>

                </div>
                <!-- Kết thúc nội dung danh sách Blogs -->
                <!-- Nội dung phần Pagination -->
                <!-- <div class="pagination flex f-space_between f-align_center p-lr16 p-tb16">
                    <div class="prev-page p-lr10">
                        <span><i class="fa-solid fa-chevron-left"></i></span>
                        <span>Trang trước</span>
                    </div>
                    <div class="number-pages">
                        <div class="flex">
                            <ul>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">...</a></li>
                                <li><a href="#">10</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="next-page p-lr10">
                        <span>Trang sau</span>
                        <span><i class="fa-solid fa-chevron-right"></i></span>
                    </div>
                </div> -->
                <!-- Nội dung phần Pagination -->
            </div>
            
            
        </div>
    </div>
    <!-- Kết thúc nội dung phần Blogs -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>