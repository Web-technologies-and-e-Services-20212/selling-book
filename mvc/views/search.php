<?php
require_once ROOT . DS . "services" . DS . "BookServices.php";
require_once ROOT . DS . 'config' . DS . 'category_config.php';
require_once ROOT . DS . 'library' . DS . 'format.php';


$pageSize = 12;
$searchText = $_POST['search'];
$request = parse_url($_SERVER['REQUEST_URI']);
if (isset($request['query'])) {
    parse_str($request['query'], $results);
    $currentPage = $results['page'];
} else {
    $currentPage = 1;
}
$service = new BookServices();
$searchResult = $service->search($currentPage, $pageSize , $searchText);
$searchTotalRecord = $service->getTotalRecordSearch($searchText);
$totalPage = ceil($searchTotalRecord / $pageSize);




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
    <link rel="stylesheet" href="/selling-book/public/css/layout/list_products.css" type="text/css">
    <title>IPM | Tất cả sản phẩm</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Danh sách sản phẩm -->
    <div class="w100p list-products">
        <div class="container">
            <div class="list-products-wrapper flex">
                <!-- Nội dung phần Danh mục -->
                <div class="categories grid-r4 p-lr15">
                    <div class="category-title">Danh mục</div>
                    <ul class="category-list">
                    <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_DETECTIVE['route'] ?>>Trinh Thám , Kinh dị</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_MODERN_LITERARURE['route'] ?>>Văn học hiện đại</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_CLASSIC_LITERATURE['route'] ?>>Văn học kinh điển</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_FANTASY['route'] ?>>Fantasy</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_LIGHT_NOVEL['route'] ?>>Light Novel</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_BOY_LOVE['route'] ?>>Boys Love</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_BOXSET['route'] ?>>Boxset</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_MANGA_COMIC['route'] ?>>Manga - Comic</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_LEARNING_BOOK['route'] ?>>Sách học ngữ</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_CHILD_BOOK['route'] ?>>Sách thiếu nhi</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_ACCESSORIES['route'] ?>>Phụ kiện</a></li>
                    </ul>
                </div>
                <!-- Kết thúc Nội dung phần Danh mục -->

                <!-- Nội dung danh sách sản phẩm -->
                <div class="list-pro grid-r4m3">
                    <div class="w100p flex mt10">
                        <div class="grid-r2 list-pro-title p-lr15 pb-16">
                            <span>
                                Kết quả tìm kiếm <?php echo $searchText; ?>
                            </span>
                        </div>
                        <div class="grid-r2 list-pro-filtes">

                        </div>
                    </div>

                    <div class="flex w100p p-tb16">
                        <?php foreach ($searchResult as $key => $book) { ?>
                            <!-- Product Card Start -->

                            <div class="product-card grid-r4">
                                <div class="product-container">
                                    <div class="product-img relative">
                                        <div class="product-sale absolute">
                                            <span class="sale-icon">-<?php echo $book->getDiscount(); ?>%</span>
                                        </div>
                                        <?php if (true) { ?>
                                            <div class="sold-out">Hết hàng</div>
                                        <?php } ?>
                                        <div class="img relative">
                                            <a href=<?php echo "/" . $path_project . "/product" . "/" . $book->getBookId(); ?> title="<?php echo $book->getTitle(); ?>">
                                                <img src="<?php echo $book->getImage()[0]; ?>" alt="<?php echo $book->getTitle(); ?>">
                                            </a>
                                        </div>
                                    </div>

                                    <div class="product-detail">
                                        <h3 class="product-name">
                                            <a href=<?php echo "/" . $path_project . "/product" . "/" . $book->getBookId(); ?> title="<?php echo $book->getTitle(); ?>"><?php echo $book->getTitle(); ?></a>
                                        </h3>
                                        <div class="product-prices">
                                            <div class="price price-new"><?php
                                                                            echo currency_format($book->getPrice() - $book->getPrice() * $book->getDiscount() / 100); ?></div>
                                            <div class="price price-old">
                                                <?php echo currency_format($book->getPrice()); ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product Card End -->

                        <?php } ?>
                    </div>

                    <div class="pagination flex f-space_between f-align_center p-lr16 p-tb16">
                        <div class="prev-page p-lr10" style="visibility: 
                        <?php if ($currentPage == 1) echo "hidden";
                        else echo "visible" ?>;">
                            <span>
                                <i class="fa-solid fa-chevron-left"></i>
                            </span>
                            <a href=<?php echo "/" . $path_project . "/search" . "?page=" . ($currentPage - 1); ?>>Trang trước</a>
                        </div>
                        <div class="number-pages">
                            <div class="flex">
                                <ul>
                                    <?php if ($currentPage > 1) { ?>
                                        <li>
                                            <a href=<?php echo "/" . $path_project . "/search" . "/" ?>>
                                                1
                                            </a>
                                        </li>
                                    <?php } ?>

                                    <?php if ($currentPage > 3) { ?>
                                        <li><span>...</span></li>
                                    <?php } ?>

                                    <?php if ($currentPage > 2) { ?>
                                        <li>
                                            <a href=<?php echo "/" . $path_project . "/search" . "?page=" . ($currentPage - 1); ?>>
                                                <?php echo $currentPage - 1; ?>
                                            </a>
                                        </li>
                                    <?php } ?>

                                    <li class="active">
                                        <a href=<?php echo "/" . $path_project . "/search" . "?page=" . ($currentPage); ?>>
                                            <?php echo $currentPage; ?>
                                        </a>
                                    </li>
                                    <?php if ($currentPage < $totalPage) { ?>
                                        <li>
                                            <a href=<?php echo "/" . $path_project . "/search" . "?page=" . ($currentPage + 1); ?>>
                                                <?php echo $currentPage + 1; ?>
                                            </a>
                                        </li>
                                    <?php } ?>

                                    <?php if ($currentPage + 3 <= $totalPage) { ?>
                                        <li><span>...</span></li>
                                    <?php } ?>


                                    <?php if ($currentPage + 1 < $totalPage) { ?>
                                        <li>
                                            <a href=<?php echo "/" . $path_project . "/search" ."?page=" . ($totalPage); ?>>
                                                <?php echo $totalPage; ?>
                                            </a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                        <div class="next-page p-lr10" style="visibility: 
                        <?php if ($currentPage == $totalPage) echo "hidden";
                        else echo "visible" ?>;">
                            <a href=<?php echo "/" . $path_project . "/search" . "/" .  "?page=" . ($currentPage + 1); ?>>Trang sau</a>
                            <span><i class="fa-solid fa-chevron-right"></i></span>
                        </div>
                    </div>

                </div>
                <!-- Kết thúc danh sách sản phẩm -->

            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Danh sách sản phẩm -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>