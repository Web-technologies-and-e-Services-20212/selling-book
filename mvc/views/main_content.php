<?php
require_once ROOT . DS . 'config' . DS . 'category_config.php';
global $path_project;
// Định nghĩa số sản phẩm cố định
$numBook = 10;
$currentCategory = CATEGORY_NEW_BOOKS; 
$newBookList = $bookStore->getAll(CATEGORY_NEW_BOOKS['id'], 1, 12);
$topBookList = $bookStore->getAll(CATEGORY_TOP_BOOKS['id'], 1, 12);
$hotBookList = $bookStore->getAll(CATEGORY_HOT_DEALS['id'], 1, 12);
// 
// foreach ($newBooks as $key => $book) {
//     print_r("Book ID :" . $book->getBookId() . "<br>");
//     print_r("Book Author :" . $book->getAuthor()  . "<br>");
//     print_r("Book Available :" . $book->getAvailable() . "<br>");
//     print_r("Book getPublisher :" . $book->getPublisher() . "<br>");
//     print_r("Book getSize :" . $book->getSize() . "<br>");
//     print_r("Book getContent :" . $book->getContent() . "<br>");
//     print_r("Book getImage :" . "<br>");
//     print_r($book->getImage());
//     print_r("<br>");
//     print_r("Book getDiscount :" . $book->getDiscount() . "<br>");
//     print_r("Book getUsername :" . $book->getUsername() . "<br>");
//     print_r("Book getTitle :" . $book->getTitle() . "<br>");
//     print_r("Book getSoldNumber :" . $book->getSoldNumber() . "<br>");
//     print_r("Book getCreateAt :" . $book->getCreateAt() . "<br>");
//     print_r("Book getPrice :" . $book->getPrice(). "<br>");
//     echo "-----------" . "<br>";
// }

if (!function_exists('currency_format')) {
    function currency_format($number, $suffix = 'đ')
    {
        if (!empty($number)) {
            return number_format($number, 0, ' ', ',') . "{$suffix}";
        }
    }
}

?>
<div class="w100p" id="main-content">
    <!-- Section slide start -->
    <section id="home-hero">
        <div class="main-img relative">
            <img src="public/images/slide/slideshow_1.jpg"></img>
            <span class="next absolute">
                <i class="fa-solid fa-chevron-right"></i>
            </span>
            <span class="prev absolute">
                <i class="fa-solid fa-chevron-left"></i>
            </span>
        </div>

        <div class="main-img relative">
            <img src="public/images/slide/slideshow_2.jpg"></img>
            <span class="next absolute">
                <i class="fa-solid fa-chevron-right"></i>
            </span>
            <span class="prev absolute">
                <i class="fa-solid fa-chevron-left"></i>
            </span>
        </div>

        <div class="main-img relative">
            <img src="public/images/slide/slideshow_3.jpg"></img>
            <span class="next absolute">
                <i class="fa-solid fa-chevron-right"></i>
            </span>
            <span class="prev absolute">
                <i class="fa-solid fa-chevron-left"></i>
            </span>
        </div>

        <div class="main-img relative">
            <img src="public/images/slide/slideshow_4.jpg"></img>
            <span class="next absolute">
                <i class="fa-solid fa-chevron-right"></i>
            </span>
            <span class="prev absolute">
                <i class="fa-solid fa-chevron-left"></i>
            </span>
        </div>

    </section>
    <!-- Section slide end -->

    <!-- Section policy start -->
    <section id="policy">
        <div class="container">
            <div class="flex f-align_center f-space_between">
                <div class="policy-img">
                    <div class="img">
                        <img src="public/images/policy/hpl_icon_1.webp"></img>
                    </div>
                    <div class="info">
                        <p>ưu đãi vận chuyển</p>
                    </div>
                </div>

                <div class="policy-img">
                    <div class="img">
                        <img src="public/images/policy/hpl_icon_2.webp"></img>
                    </div>
                    <div class="info">
                        <p>thể loại sách phong phú</p>
                    </div>
                </div>

                <div class="policy-img">
                    <div class="img">
                        <img src="public/images/policy/hpl_icon_3.webp"></img>
                    </div>
                    <div class="info">
                        <p>khuyến mãi hấp dẫn</p>
                    </div>
                </div>

                <div class="policy-img">
                    <div class="img">
                        <img src="public/images/policy/hpl_icon_4.webp"></img>
                    </div>
                    <div class="info">
                        <p>hotline: 03 2838 3979</p>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- Section policy end -->

    <!-- Section list product start -->
    <section id="products">
        <div class="container">
            <!-- Products nav start -->
            <div class="pro-nav grid-r5m2 margin-auto_h">
                <ul class="flex f-align_center f-space_between">
                    <li class="active" id="new">
                        <a>Sách mới</a>
                    </li>

                    <li id="top">
                        <a>Sách bán chạy</a>
                    </li>

                    <li id="hot">
                        <a>Hot deals</a>
                    </li>
                </ul>
            </div>
            <!-- Products nav end -->

            <!-- List product start -->
            <div class="pro-list">
                <div class="pro-list-new list-content flex w100p active">
                    <?php foreach ($newBookList as $key => $book) { ?>

                        <!-- Card product start -->
                        <div class="product-card grid-r5">
                            <div class="product-container m-b20">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon"> -<?php echo $book->getDiscount(); ?>%</span>
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
                                                                        echo currency_format($book->getPrice()); ?>
                                        </div>
                                        <div class="price price-old">
                                            <?php echo currency_format($book->getPrice() - $book->getPrice() * $book->getDiscount() / 100); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card product end -->
                    <?php } ?>

                </div>

                <div class="pro-list-top list-content flex w100p">
                    <?php foreach ($topBookList as $key => $book) { ?>
                        <!-- Card product start -->
                        <div class="product-card grid-r5">
                            <div class="product-container m-b20">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- <?php echo $book->getDiscount(); ?> %</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="<?php echo $book->getImage()[0]; ?>" alt="<?php echo $book->getTitle(); ?>">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#"><?php echo $book->getTitle(); ?></a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">
                                            <?php echo currency_format($book->getPrice()); ?>
                                        </div>
                                        <div class="price price-old">
                                            <?php echo currency_format($book->getPrice() - $book->getPrice() * $book->getDiscount() / 100); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card product end -->
                    <?php } ?>


                </div>

                <div class="pro-list-hot list-content flex w100p">
                    <?php foreach ($hotBookList as $key => $book) { ?>
                        <!-- Card product start -->
                        <div class="product-card grid-r5">
                            <div class="product-container m-b20">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">-<?php echo $book->getDiscount(); ?>%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="<?php echo $book->getImage()[0]; ?>" alt="<?php echo $book->getTitle(); ?>">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#"><?php echo $book->getTitle(); ?></a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">
                                            <?php echo currency_format($book->getPrice()); ?>
                                        </div>
                                        <div class="price price-old">
                                            <?php echo currency_format($book->getPrice() - $book->getPrice() * $book->getDiscount() / 100); ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Card product end -->
                    <?php } ?>

                </div>

                <div class="see-more w100p flex f-center">
                    <a id="see-more" href=<?php echo "/" . $path_project . "/" ."list-products" . "/" . CATEGORY_NEW_BOOKS['route'] ?> class="btn btn-more">Xem thêm</a>
                </div>
            </div>
            <!-- List product end -->

        </div>
    </section>

    <section id="posts" class="borderblack">
        <div class="container">
            <div class="posts-header">
                <h2>Bài viết mới</h2>
            </div>

            <div class="posts-list relative" style="overflow: scroll">
                <div class="flex" style="width: 4680px; transform: translate3d(0px, 0px, 0px); transition: all 0.25s ease 0s;">
                    <div class="post-container" style="width: 390px;">
                        <h1>1</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>2</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>3</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>3</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>4</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>5</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>6</h1>
                    </div>

                    <div class="post-container " style="width: 390px;">
                        <h1>7</h1>
                    </div>

                    <div class="post-container" style="width: 390px;">
                        <h1>8</h1>
                    </div>

                    <div class="post-container borderblack" style="width: 390px;">
                        <h1>9</h1>
                    </div>

                    <div class="post-container borderblack" style="width: 390px;">
                        <h1>10</h1>
                    </div>

                    <div class="post-container borderblack" style="width: 390px;">
                        <h1>11</h1>
                    </div>

                </div>

                <div class="nav-btns">
                    <div class="nav-btn nav-prev borderblack">Prev</div>
                    <div class="nav-btn nav-next borderblack">Next</div>
                </div>
            </div>
        </div>

    </section>
</div>