<?php
require_once ROOT . DS . "services" . DS . "BookServices.php";
require_once ROOT . DS . 'services' . DS . 'EvaluateServices.php';
require_once ROOT . DS . 'services' . DS . 'GuestServices.php';
require_once ROOT . DS . "library" . DS . "format.php";

$bookStore = new BookServices();
$evaluateServices = new EvaluateServices();
$guestServices = new GuestServices();
$book = $bookStore->getById($productId);
$bookId = $book->getBookId();
$bookTitle = $book->getTitle();
$bookDiscount = $book->getDiscount();
$bookImage = $book->getImage()[1];
$bookPrice = $book->getPrice();
$bookAvailable = $book->getAvailable();
$bookAuthor = $book->getAuthor();
$bookSize = $book->getSize();
$bookPublisher = $book->getPublisher();
$bookPublishYear = $book->getPublishYear();
$bookType = $book->getType();
$bookContent = $book->getContent();
$bookCategory = $book->getCategory();
$bookSameAuthor = $bookStore->getBookByAuthor($bookAuthor);
$bookRelated = $bookStore->getBookByCategory($bookId);
$listComment = $evaluateServices->getAll($bookId);

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
    <link rel="stylesheet" href="/selling-book/public/css/layout/product.css" type="text/css">
    <script src="https://cdn.tiny.cloud/1/9038dr0d32vvyxk56tg57fbo4w5hgp16g574iyezusedlm3f/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
      tinymce.init({
        selector: '#mytextarea'
      });
    </script>
    <title>IPM | <?php echo $bookTitle; ?> </title>

</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Product -->
    <div class="w100p">
        <div class="container">
            <div class="s_product-content flex p-b20 p-t30">
                <div class="grid-r5m2 w100p-md p-lr15">
                    <div class="s_product-img relative">
                        <div class="product-sale absolute">
                            <span class="sale-icon">-<?php echo $bookDiscount; ?>%</span>
                        </div>
                        <?php if ($bookAvailable == 0) { ?>
                            <div class="sold-out" style="background-color:#eee ;">Hết hàng</div>
                        <?php } ?>
                        <div class="w100p relative">
                            <img src="<?php echo $bookImage  ?>" alt="<?php echo $bookTitle; ?>">
                        </div>
                    </div>
                </div>

                <div class="grid-r5m3 w100p-md p-lr15">
                    <div class="s_product-title">
                        <h1><?php echo $bookTitle; ?></h1>
                        <span>SKU: <?php echo $bookId; ?></span>
                    </div>

                    <div class="s_product-price">
                        <span><?php
                                echo currency_format($bookPrice - $bookPrice * $bookDiscount / 100); ?></span>
                        <del class="m-l20"><?php echo currency_format($bookPrice); ?> </del>
                    </div>

                    <div class="s_product-subtitle m-t10">
                        <div class="box-info flex m-b10">
                            <div class="w50p m-b10 p-r10">
                                <strong>Tác giả</strong>
                                <span><?php echo $bookAuthor; ?></span>
                            </div>
                            <div class="w50p m-b10 p-r10">
                                <strong>Nhà xuất bản</strong>
                                <span><?php echo $bookPublisher; ?></span>
                            </div>
                            <div class="w50p m-b10 p-r10">
                                <strong>Năm xuất bản</strong>
                                <span><?php echo $bookPublishYear; ?></span>
                            </div>

                            <div class="w50p m-b10 p-r10">
                                <strong>Hình thức</strong>
                                <span><?php echo $bookType; ?></span>
                            </div>

                            <div class="w50p m-b10 p-r10">
                                <strong>Kích thước</strong>
                                <span><?php echo $bookSize; ?></span>
                            </div>
                        </div>

                        <div class="short-desc">
                            <div class="w100p">
                                <strong>Nội dung:</strong>
                                <p><?php echo $bookContent; ?>
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
                                <button class="btn product-add <?php if ($bookAvailable == 0) echo "btn-buy-disable" ?>">Thêm vào giỏ</button>
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
                        if (!in_array($book, $listProducts)) {
                            $guestServices->insertBookToCart($username, $book, $quantity);
                        }
                        header("refresh: 0");
                    }
                    ?>
                    <div class="s_product-meta">
                        <p>danh mục :
                            <span class="s_product-category">
                                <?php $arrlength = count($bookCategory);
                                for ($x = 0; $x < $arrlength; $x++) { ?>
                                    <a href="#"><?php echo $bookCategory[$x] ?></a>
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
                        <?php foreach ($bookSameAuthor as $key => $book) { ?>
                            <div class="product-card grid-r5 grid-r3-md">
                                <div class="product-container">
                                    <div class="product-img relative">
                                        <div class="product-sale absolute">
                                            <span class="sale-icon">-<?php echo $book->getDiscount(); ?>%</span>
                                        </div>
                                        <?php if ($book->getAvailable() == 0) { ?>
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
                        <?php } ?>

                    </div>
                </div>

                <div class="list-like">
                    <div class="title-reference">
                        <span>Sản phẩm liên quan</span>
                    </div>

                    <div class="flex w100p p-tb16">
                        <?php foreach ($bookRelated as $key => $book) { ?>
                            <div class="product-card grid-r5 grid-r3-md">
                                <div class="product-container">
                                    <div class="product-img relative">
                                        <div class="product-sale absolute">
                                            <span class="sale-icon">-<?php echo $book->getDiscount(); ?>%</span>
                                        </div>
                                        <?php if ($book->getAvailable() == 0) { ?>
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
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div class="s_product-comment">
                <div class="title-reference">
                    <span>Bình luận</span>

                </div>
                <div class="comment-list">
                    <span><strong style="color:#000 ;"><?php echo count($listComment); ?> bình luận</strong></span>
                    <div class="line"></div>
                    <div class="comment-box w100p m-b10">
                        <div class="m-b10">
                            <strong class="primary">
                                <?php 
                                if(isset($_SESSION['username'])){
                                    $user = $guestServices->get($_SESSION['username']);
                                    echo $user->getName();

                                }else {
                                    echo "Bạn cần đăng nhập để bình luận!";
                                } ?>
                            </strong>
                        </div>
                        <?php if(isset($user)) { ?>
                        <form onsubmit="validComment()" method="POST" id="form-comment">
                            <div class="w100p">
                                <div class="form-group m-b10">
                                    <textarea id="mytextarea" name="comment" type="text" id="commentFormMessage" placeholder="Viết bình luận" class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="w100p" style="height:34px;">
                                <button type="submit" class="btn btn-primary btn-default" style="float: right">Đăng</button>
                            </div>
                        </form>
                        <?php } ?>
                    </div>

                    <?php
                    if (array_key_exists('comment', $_POST)) {
                        $username = $_SESSION['username'];
                        $comment = $_POST['comment'];
                        $newComment = new Evaluate($username, $bookId,$comment, date("d/m/Y") );
                        $evaluateServices->insert($newComment);
                        header("refresh: 0");
                    }
                    ?>

                    <?php 
                    foreach ($listComment as $key => $comment) { ?>
                       
                    <div class="w100p">
                        <div class="m-b10">
                            <strong style="color:#000 ;"><?php 
                            $userNameComment = $comment->getUsername();
                            $user = $guestServices->get($userNameComment);
                            echo $user->getName(); ?></strong>
                            <small style="padding-left: 10px; font-weight: 500;" class="primary">
                            - <?php echo $comment->getCreateAt() ?></small>
                        </div>


                        <div class="w100p p-b10">
                            <p style="font-weight: 400; padding-left: 16px">
                            <?php echo $comment->getComment() ?>
                        </p>
                        </div>
                    </div>

                    <?php } ?>
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
        if (isset($_SESSION['username'])) {
            echo "session = '" . $_SESSION['username'] . "' ;";
        }
        ?>

        function validComment() {
            if (session == "") {
                alert("Vui lòng đăng nhập để bình luận!");
                return false;
            }

            let comment = document.getElementById("commentFormMessage").value;

            if (comment == "") {
                alert("Nhập bình luận để tiếp tục!");
                return false;
            }

            return true;
        }

        function validCart() {
            if (session == "") {
                alert("Vui lòng đăng nhập để sử dụng giỏ hàng!")
                return false;
            }

            return true;
        }
    </script>
</body>

</html>