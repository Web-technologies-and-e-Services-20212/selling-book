<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";
require_once ROOT . DS . 'library' . DS . 'format.php';

if (!isset($_SESSION)) {
    ob_start();
    session_start();
}
if (!isset($_SESSION['username']) || $_SESSION['username'] == '') {
    header("Location: login");
}
$guestService = new GuestServices();
$listCartProducts = $guestService->getListCartBooks($_SESSION['username']);
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
    <title>IPM | Giỏ hàng</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần About -->
    <div id="cart" class="w100">
        <div class="container">
            <span class="cart-title">
                <h1>giỏ hàng</h1>
            </span>

            <div class="cart-content">
                <div class="table-responsive" style="display:block;overflow:auto;max-height:400px;">
                    <table>
                        <thead>
                            <tr>
                                <th class="image p-b20">&nbsp;</th>
                                <th class="item p-b20">Tên sản phẩm</th>
                                <th class="qty p-b20">Số lượng</th>
                                <th class="price p-b20">Giá tiền</th>
                                <th class="delete p-b20">&nbsp;</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php $totalPrice = 0;
                            foreach ($listCartProducts as $key => $cartBook) {

                                $book = $cartBook['book'];
                                $quantity = $cartBook['quantity'];
                                $bookId = $book->getBookId();
                                $bookImage = $book->getImage()[0];
                                $bookTitle = $book->getTitle();
                                $bookPrice = $book->getPrice();
                                $totalPrice += $bookPrice * $quantity;

                            ?>
                                <tr>
                                    <td class="image">
                                        <div class="product-image">
                                            <img src="<?php echo $bookImage; ?>" alt="<?php echo $bookTitle; ?>">
                                        </div>
                                    </td>
                                    <td class="item"><a href="#">
                                            <strong title="<?php echo $bookTitle; ?>"><?php echo $bookTitle; ?></strong>
                                        </a></td>
                                    <td class="qty">
                                        <input type="number" size="4" min="1" id="update-quatity" value=<?php echo $quantity; ?> class="input-quantity">
                                    </td>
                                    <td class="price"><?php echo currency_format($bookPrice); ?></td>
                                    <td class="delete">
                                        <form action="library/guest/delete_product.php" method="post" id=<?php echo "form-delete" . $bookId; ?>>
                                            <input type="text" name="product_id" value="<?php echo $bookId; ?>" style="display: none">
                                            <a href="javascript:void(0);" onclick=<?php echo "remove_form(" . $bookId  . ")"; ?> class="click-delete">Xóa</a>
                                        </form>
                                    </td>
                                </tr>
                            <?php } ?>

                            <tr class="summary">
                                <td class="image">&nbsp;</td>
                                <td class="item">&nbsp;</td>
                                <td class="sum">
                                    <b>Tổng cộng:</b>
                                </td>
                                <td class="price"><b><?php echo currency_format($totalPrice); ?></b></td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="flex w100p">
                    <div class="grid-r2 p-lr15">
                        <div class="form-group p-b15">
                            <label for="noteCartMessage">Ghi chú</label>
                            <textarea rows="4" type="text" id="noteCartMessage" class="form-control m-t10"></textarea>
                        </div>
                    </div>
                    <div class="grid-r2">
                        <div class="m-t30">
                            <div class="flex p-t30 f-end p-lr15">
                                <button class="btn btn-default btn-md">Cập nhật
                                    <i class="fa-solid fa-chevron-right"></i>
                                </button>
                                <button class="btn btn-default btn-md" onclick="checkout()" >Thanh toán
                                    <i class="fa-solid fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="w100p p-lr15">
                    <a href="#" class="back">
                        <i class="fa-solid fa-reply"></i>
                        Tiếp tục mua hàng
                    </a>
                </div>

                <form action="library/guest/insert_product.php" method="post" style="display:none" id="form-checkout">
                <?php $totalPrice = 0;
                foreach ($listCartProducts as $key => $cartBook) {

                    $book = $cartBook['book'];
                    $quantity = $cartBook['quantity'];
                    $bookId = $book->getBookId();

                ?>
                    <input type="number" min="1" name=<?php echo "quantity-product" . $bookId ?> id=<?php echo "quatityId-" . $bookId ;?> value=<?php echo $quantity; ?>>
                <?php } ?>
                </form>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần About -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>

    <script src="public/javascript/cart.js"></script>
</body>

</html>