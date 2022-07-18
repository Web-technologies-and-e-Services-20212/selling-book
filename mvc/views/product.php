<?php
require_once ROOT . DS . "services" . DS . "BookServices.php";

$bookStore = new BookServices();
$book = $bookStore->getById($productId);
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
    <title>IPM | <?php echo $book->getTitle() ?> </title>

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
                            <span class="sale-icon">-<?php echo $book->getDiscount(); ?>%</span>
                        </div>
                        <?php if (true) { ?>
                            <div class="sold-out" style="background-color:#eee ;">Hết hàng</div>
                        <?php } ?>
                        <div class="w100p relative">
                            <img src="<?php echo $book->getImage()[1]; ?>" alt="<?php echo $book->getTitle(); ?>">
                        </div>
                    </div>
                </div>

                <div class="grid-r5m3 p-lr15">
                    <div class="s_product-title">
                        <h1><?php echo $book->getTitle(); ?></h1>
                        <span>SKU: 8935250707718</span>
                    </div>

                    <div class="s_product-price">
                        <span><?php
                                echo currency_format($book->getPrice() - $book->getPrice() * $book->getDiscount() / 100); ?></span>
                        <del class="m-l20"><?php echo currency_format($book->getPrice()); ?> </del>
                    </div>

                    <div class="s_product-subtitle m-t10">
                        <div class="box-info flex m-b10">
                            <div class="w50p m-b10 p-r10">
                                <strong>Tác giả</strong>
                                <span><?php echo $book->getAuthor(); ?></span>
                            </div>
                            <div class="w50p m-b10 p-r10">
                                <strong>Nhà xuất bản</strong>
                                <span><?php echo $book->getPublisher(); ?></span>
                            </div>
                            <div class="w50p m-b10 p-r10">
                                <strong>Năm xuất bản</strong>
                                <span><?php echo $book->getPublishYear(); ?></span>
                            </div>

                            <div class="w50p m-b10 p-r10">
                                <strong>Hình thức</strong>
                                <span><?php echo $book->getType(); ?></span>
                            </div>

                            <div class="w50p m-b10 p-r10">
                                <strong>Kích thước</strong>
                                <span><?php echo $book->getSize(); ?></span>
                            </div>
                        </div>

                        <div class="short-desc">
                            <div class="w100p">
                                <strong>Nội dung:</strong>
                                <p><?php echo $book->getContent(); ?>
                                </p>
                                <p></p>

                            </div>
                        </div>


                    </div>

                    <form method="POST" onsubmit="return validCart()">
                        <div class="s_product-action flex f-align_center">
                            <div class="select-quantity">
                                <input type="button" value="-" class="qty-minus">
                                <input type="text" name="product-number" value="1" min="1" id="qty-product" required oninput="this.value=this.value.replace(/[^0-9]/g,'');" class="quantity-selector">
                                <input type="button" value="+" class="qty-plus">
                            </div>

                            <div class="s_product-btn ">
                                <button class="btn product-add <?php if (false) echo "btn-buy-disable" ?>">Thêm vào giỏ</button>
                            </div>


                        </div>


                    </form>
                    <?php
                    if (array_key_exists('product-number', $_POST)) {
                        require_once ROOT . DS . 'services' . DS . 'GuestServices.php';
                        $username = $_SESSION['username'];
                        $quantity = $_POST['product-number'];
                        $guestServices = new GuestServices();
                        $listProducts = $guestServices->getListCartBooks($_SESSION['username']);
                        if (!in_array($book , $listProducts)) {
                            $guestServices->insertBookToCart($username, $book , $quantity);
                        }
                        header("refresh: 0");
                    }
                    ?>
                    <div class="s_product-meta">
                        <p>danh mục :
                            <span class="s_product-category">
                                <?php $arrlength = count($book->getCategory());
                                for ($x = 0; $x < $arrlength; $x++) { ?>
                                    <a href="#"><?php echo $book->getCategory()[$x] ?></a>
                                <?php if ($x != $arrlength - 1) echo ",";
                                } ?>
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

    <!-- JS dùng riêng -->
    <script src="/selling-book/public/javascript/product.js"></script>
    <script>
	var session = "";
	<?php
	if(isset($_SESSION['username'])){
			echo "session = '" . $_SESSION['username'] . "' ;";
	}
	?>
	function validComment(){
			if(session == ""){
					alert("Vui lòng đăng nhập để bình luận!");
					return false;
			}

			let comment = document.getElementById("your_comment").value;

			if(comment == ""){
				alert("Nhập bình luận để tiếp tục!");
				return false;
			}

			return true;
	}

	function validCart(){
			if(session == ""){
					alert("Vui lòng đăng nhập để sử dụng giỏ hàng!")
					return false;
			}

			return true;
	}
	</script>
</body>

</html>