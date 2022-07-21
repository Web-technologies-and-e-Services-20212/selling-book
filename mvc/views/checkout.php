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
$currentUser = $guestService->get($_SESSION['username']);
$currentUserName = $currentUser->getName();
$currentUserAddress = $currentUser->getAddress();
$currentUserPhone = $currentUser->getPhoneNumber();
$listCartProducts = $guestService->getListCartBooks($_SESSION['username']);
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
    <link rel="stylesheet" href="/selling-book/public/css/layout/cart.css" type="text/css">
    <title>IPM | Thanh toán đơn hàng</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần About -->
    <div id="cart" class="w100">
        <div class="container">
            <span class="cart-title">
                <h1>Giỏ hàng</h1>
            </span>

            <div class="customer-info flex">
                <div class="grid-r5m2 p-lr15">
                    <h2><?php echo $currentUserName ?></h2>
                    <p><?php echo $currentUser->getUsername(); ?></p>
                    <p></p>
                    <div class="address">
                        <p><?php if (!empty($currentUserAddress)) {
                                echo $currentUserAddress;
                            } else echo "Bạn chưa cập nhật địa chỉ";
                            ?></p>
                        <p></p>
                        <p>VietNam</p>
                        <p></p>
                        <p><?php if (!empty($currentUserPhone)) {
                                echo $currentUserPhone;
                            } else echo "Bạn chưa cập nhật số điện thoại";
                            ?></p>
                        <p></p>
                    </div>
                </div>

                <div class="grid-r5m3 p-lr15">
                    <h2>Phương thức vận chuyển</h2>
                    <p></p>
                    <p>Giao tận nơi</p>
                    <h2>Phương thức thanh toán</h2>
                    <p></p>
                    <p>Thanh toán khi nhận hàng (COD)</p>
                    <p></p>
                    <p>Phí vận chuyển toàn quốc: 30,000đ</p>
                    <p></p>


                </div>


            </div>

            <div class="cart-content">
                <div class="table-responsive" style="display:block;overflow:auto;max-height:400px;">
                    <table>
                        <thead>
                            <tr>
                                <th class="image p-b20">&nbsp;</th>
                                <th class="item p-b20">Tên sản phẩm</th>
                                <th class="qty text-center p-b20">Số lượng</th>
                                <th class="price text-right p-b20">Giá tiền</th>
                                <th class="">&nbsp;</th>
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
                                $bookDiscount = $book->getDiscount();
                                $bookOldPrice = $book->getPrice();
                                $bookPrice = $bookOldPrice - $bookOldPrice * $bookDiscount / 100;
                                $totalPrice += $bookPrice * $quantity;

                            ?>
                                <tr>
                                    <td class="image text-center">
                                        <div class="product-image">
                                            <img src="<?php echo $bookImage; ?>" alt="<?php echo $bookTitle; ?>">
                                        </div>
                                    </td>
                                    <td class="item text-left"><a href="#">
                                            <strong title="<?php echo $bookTitle; ?>"><?php echo $bookTitle; ?></strong>
                                        </a></td>
                                    <td class="qty text-center">
                                        <input type="number" readonly size="4" min="1" id="update-quatity" value=<?php echo $quantity; ?> class="input-quantity">
                                    </td>
                                    <td class="price text-right"><?php echo currency_format($bookPrice); ?></td>
                                <td>&nbsp;</td>

                                </tr>
                            <?php } ?>

                            <tr class="summary">
                                <td class="image">&nbsp;</td>
                                <td class="item">&nbsp;</td>
                                <td class="sum">
                                    <b>Phí vận chuyển:</b>
                                </td>
                                <td class="price text-right"><b>30,000đ</b></td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr class="summary">
                                <td class="image">&nbsp;</td>
                                <td class="item">&nbsp;</td>
                                <td class="sum">
                                    <b>Tổng cộng:</b>
                                </td>
                                <td class="price text-right"><b><?php echo currency_format($totalPrice + 30000); ?></b></td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
                <div class="w100p flex p-t15 f-space_between p-lr15 m-t30">

                    <div class="p-lr15">
                        <a href="#" class="back" style="display: inline-block">
                            <i class="fa-solid fa-reply"></i>
                            Tiếp tục mua hàng
                        </a>
                    </div>

                    <button class="btn btn-default btn-md" onclick="submitBill()">
                        Hoàn tất đơn hàng
                        <i class="fa-solid fa-chevron-right"></i>
                    </button>

                    

                </div>



                <form action="../selling-book/bill" method="post" style="display:none" id="form-bill">
                    <?php $totalPrice = 0;
                    foreach ($listCartProducts as $key => $cartBook) {

                        $book = $cartBook['book'];
                        $quantity = $cartBook['quantity'];
                        $bookId = $book->getBookId();

                    ?>
                        <input type="number" min="1" name=<?php echo "quantity-product" . $bookId ?> id=<?php echo "quatityId-" . $bookId; ?> value=<?php echo $quantity; ?>>
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