<?php
require_once ROOT . DS . "services" . DS . "BookServices.php";

$listProductStore = new BookServices();
$listAllProducts = $listProductStore->getAll();
if (!function_exists('currency_format')) {
    function currency_format($number, $suffix = 'đ')
    {
        if (!empty($number)) {
            return number_format($number, 0, ',', ',') . "{$suffix}";
        }
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
        <link rel="shortcut icon" href="/selling-book/public/images/logo/logo_icon.png" type="image/x-icon">
        <link rel="stylesheet" href="/selling-book/public/css/style.css" type="text/css">
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
                            <li><span>Trinh Thám - Kinh dị</span></li>
                            <li><span>Văn học hiện đại</span></li>
                            <li><span>Văn học kinh điển</span></li>
                            <li><span>Fantasy</span></li>
                            <li><span>Light Novel</span></li>
                            <li><span>Boys Love</span></li>
                            <li><span>Manga - Comic</span></li>
                            <li><span>Sách thiếu nhi</span></li>
                        </ul>
                    </div>
                    <!-- Kết thúc Nội dung phần Danh mục -->

                    <!-- Nội dung danh sách sản phẩm -->
                    <div class="list-pro grid-r4m3">
                        <div class="w100p flex mt10">
                            <div class="grid-r2 list-pro-title p-lr15 pb-16">
                                <span>Tất cả sản phẩm</span>
                            </div>
                            <div class="grid-r2 list-pro-filtes">

                            </div>
                        </div>

                        <div class="flex w100p p-tb16">
                        <?php foreach ($listAllProducts as $key => $book) { ?>
                            <!-- Product Card Start -->

                            <div class="product-card grid-r4">
                                <div class="product-container">
                                    <div class="product-img relative">
                                        <div class="product-sale absolute">
                                            <span class="sale-icon">-<?php echo $book->getDiscount(); ?>%</span>
                                        </div>
                                        <?php if(true){ ?>
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
                                                                        echo currency_format($book->getPrice()); ?></div>
                                            <div class="price price-old">58,000đ</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product Card End -->

                            <?php } ?>
                        </div>
                        
                        <div class="pagination flex f-space_between f-align_center p-lr16 p-tb16">
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

        

    