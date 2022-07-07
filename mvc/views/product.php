<?php

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
    <title>IPM | Sách <?php echo $productId ?> </title>

</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Product -->
    <div class="w100p">
        <div class="container">
            <div class="s_product-content flex p-b20">
                <div class="grid-r5m2 p-lr15">
                    <div class="s_product-img relative">
                        <div class="product-sale absolute">
                            <span class="sale-icon">- 15%</span>
                        </div>
                        <div class="w100p relative">
                            <img src="/selling-book/public/images/products/p1.png" alt="Sp1">
                        </div>
                    </div>
                </div>

                <div class="grid-r5m3 p-lr15">
                    <div class="s_product-title">
                        <h1>Monster #8</h1>
                        <span>SKU: 8935250707718</span>
                    </div>

                    <div class="s_product-price">
                        <span>49,300d</span>
                        <del class="m-l20">58,000d</del>
                    </div>

                    <div class="s_product-subtitle m-t10">
                        <div class="box-info flex m-b10">
                            <div class="w50p m-b10 p-r10">
                                <strong>Tác giả</strong>
                                <span>Naoya Matsumoto</span>
                            </div>
                            <div class="w50p m-b10 p-r10">
                                <strong>Nhà xuất bản</strong>
                                <span>Hồng Đức</span>
                            </div>
                            <div class="w50p m-b10 p-r10">
                                <strong>Năm xuất bản</strong>
                                <span>2022</span>
                            </div>

                            <div class="w50p m-b10 p-r10">
                                <strong>Hình thức</strong>
                                <span>Bìa mềm</span>
                            </div>

                            <div class="w50p m-b10 p-r10">
                                <strong>Kích thước</strong>
                                <span>12 x 18 cm</span>
                            </div>
                        </div>

                        <div class="short-desc">
                            <div class="w100p">
                                <strong>Nội dung:</strong>
                                <p>Phần thi cuối cùng của kì thi tuyển Lực lượng Phòng vệ đã kết thúc. Song, quái chính
                                    (rõ ràng đã bị tiêu diệt) lại được một quái vật bí ẩn dạng người giúp hồi sinh, từ
                                    đó tấn công Shinomiya Kikoru và các thí sinh khác. Ngay lúc Kikoru rơi vào đường
                                    cùng, Hibino Kafka đột nhiên xuất hiện trong hình dạng quái vật…! Rốt cuộc con quái
                                    vật dạng người kia là ai? Mục đích của nó là gì?
                                    <br>
                                    Mời các bạn thưởng thức tập 2 ngập tràn bí ẩn!
                                </p>
                                <p></p>

                            </div>
                        </div>


                    </div>

                    <form action="#">
                        <div class="s_product-action flex f-align_center">
                            <div class="select-quantity">
                                <input type="button" value="-" class="qty-minus">
                                <input type="text" value="1" min="1" class="quantity-selector">
                                <input type="button" value="+" class="qty-plus">
                            </div>

                            <div class="s_product-btn">
                                <button class="btn product-add">Thêm vào giỏ</button>
                            </div>


                        </div>


                    </form>

                    <div class="s_product-meta">
                        <p>danh mục :
                            <span class="s_product-category">
                                <a href="#">sách mới</a>
                                ,
                                <a href="#">Manga - comic</a>
                            </span>
                        </p>
                    </div>
                </div>
            </div>

            <div class="s_product-reference p-t30">
                <div class="list-author">
                    <div class="title-reference">
                        <span>Sách cùng tác giả</span>
                    </div>

                    <div class="flex w100p p-tb16">
                        <div class="product-card grid-r5">
                            <div class="product-container">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- 15%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="/selling-book/public/images/products/p1.png" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#">Chào mừng đến với học thực lực</a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">49,300đ</div>
                                        <div class="price price-old">58,000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-card grid-r5">
                            <div class="product-container">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- 15%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="/selling-book/public/images/products/p1.png" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#">Chào mừng đến với học thực lực</a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">49,300đ</div>
                                        <div class="price price-old">58,000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-card grid-r5">
                            <div class="product-container">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- 15%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="/selling-book/public/images/products/p1.png" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#">Chào mừng đến với học thực lực</a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">49,300đ</div>
                                        <div class="price price-old">58,000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-like">
                    <div class="title-reference">
                        <span>Sản phẩm liên quan</span>
                    </div>

                    <div class="flex w100p p-tb16">
                        <div class="product-card grid-r5">
                            <div class="product-container">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- 15%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="/selling-book/public/images/products/p1.png" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#">Chào mừng đến với học thực lực</a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">49,300đ</div>
                                        <div class="price price-old">58,000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-card grid-r5">
                            <div class="product-container">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- 15%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="/selling-book/public/images/products/p1.png" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#">Chào mừng đến với học thực lực</a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">49,300đ</div>
                                        <div class="price price-old">58,000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-card grid-r5">
                            <div class="product-container">
                                <div class="product-img relative">
                                    <div class="product-sale absolute">
                                        <span class="sale-icon">- 15%</span>
                                    </div>
                                    <div class="img relative">
                                        <a href="#">
                                            <img src="/selling-book/public/images/products/p1.png" alt="">
                                        </a>
                                    </div>
                                </div>

                                <div class="product-detail">
                                    <h3 class="product-name">
                                        <a href="#">Chào mừng đến với học thực lực</a>
                                    </h3>
                                    <div class="product-prices">
                                        <div class="price price-new">49,300đ</div>
                                        <div class="price price-old">58,000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="s_product-comment">
                <div class="title-reference">
                    <span>Bình luận</span>

                </div>
                <div class="comment-list">
                    <span><strong>3 bình luận</strong></span>
                </div>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Product -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
</body>

</html>