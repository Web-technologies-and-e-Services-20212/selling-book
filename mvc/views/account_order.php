<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";
include_once ROOT . DS . 'services' . DS . "BookServices.php";
require_once ROOT . DS . 'library' . DS . 'format.php';

if (!isset($_SESSION)) {
    ob_start();
    session_start();
}
if (!isset($_SESSION['username']) || $_SESSION['username'] == '') {
    header("Location: login");
}
$guestService = new GuestServices();
$bookStore = new BookServices();
$currentUser = $guestService->get($_SESSION['username']);
$listBill = $guestService->getListBill($_SESSION['username']);

foreach ($listBill as $bill) {
    if (sha1($bill->getBillID()) == $orderId) {
        $currentBill = $bill;
        break;
    }
}
if (!isset($currentBill)) {
    header("Location: /404");
}

$billId = $currentBill->getBillID();
$listBookBill = $guestService->getListBillBooks($billId);
$billDate = $currentBill->getDateBill();
$billStatus = $currentBill->getStatus();
$billPrice = $currentBill->getTotalPrice();
$currentUserName = $currentUser->getName();
$currentUserAddress = $currentUser->getAddress();
$currentUserPhone = $currentUser->getPhoneNumber();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d433183ff3.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="../../public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="../../public/css/base.css" type="text/css">
    <link rel="stylesheet" href="../../public/css/layout/account.css" type="text/css">
    <link rel="stylesheet" href="../../public/css/layout/cart.css" type="text/css">
    <title>IPM | Đơn hàng <?php echo $billId; ?></title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần About -->
    <div id="cart" class="w100">
        <div class="container">
            <span class="cart-title">
                <h1>Đơn hàng: #<?php echo $billId . ", ĐẶT LÚC - " . $billDate;  ?></h1>
            </span>

            <div class="customer-info flex">
                <div class="grid-r5m2">
                    <h2>Địa chỉ nhận hàng</h2>
                    <p>Tình trạng thanh toán: <?php echo $billStatus; ?></p>
                    <p></p>
                    <p><?php echo $currentUserName; ?></p>
                    <p></p>
                    <div class="address">
                        <p><?php echo $currentUserAddress; ?></p>
                        <p></p>
                        <p>VietNam</p>
                        <p></p>
                        <p><?php echo $currentUserPhone; ?></p>
                        <p></p>
                    </div>
                </div>

                <div class="grid-r5m3">
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
                                <th class="item text-left p-b20">Sản phẩm</th>
                                <th class="item text-center p-b20">Mã sản phẩm</th>
                                <th class="price text-center p-b20">Giá</th>
                                <th class="qty text-center p-b20">Số lượng</th>
                                <th class="price text-right p-b20">Tổng cộng</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php $totalPrice = 0;
                            foreach ($listBookBill as $key => $billBook) {

                                $bookId = $billBook['bookId'];
                                $quantity = $billBook['quantity'];
                                $book = $bookStore->getById($bookId);
                                $bookName = $book->getTitle();
                                $bookDiscount = $book->getDiscount();
                                $bookPrice = $book->getPrice() - $book->getPrice() * $bookDiscount / 100;
                                $totalPrice += $quantity  *  $bookPrice ;


                            ?>
                                <tr>
                                    <td class="item text-left"><a href=<?php echo ROOT . DS . "product" . DS . $bookId; ?>>
                                            <strong title="<?php echo $bookName; ?>"><?php echo $bookName; ?></strong>
                                        </a></td>
                                    <td class="item text-center">
                                        <?php echo $bookId; ?>
                                    </td>

                                    <td class="price text-center"><?php echo currency_format($bookPrice); ?></td>

                                    <td class="qty text-center">
                                        <input type="text" readonly size="4" id="update-quatity" value=<?php echo $quantity; ?> class="input-quantity">
                                    </td>
                                    <td class="price text-right"><?php echo currency_format($bookPrice * $quantity); ?></td>

                                </tr>
                            <?php } ?>

                            <tr class="summary">
                                <td class="item">&nbsp;</td>
                                <td class="item">&nbsp;</td>
                                <td class="price">&nbsp;</td>
                                <td class="sum text-right">
                                    <b>Phí vận chuyển:</b>
                                </td>
                                <td class="price text-right"><b>30,000đ</b></td>
                                <td>&nbsp;</td>
                            </tr>

                            <tr class="summary">
                                <td class="item">&nbsp;</td>
                                <td class="item">&nbsp;</td>
                                <td class="price">&nbsp;</td>
                                <td class="sum text-right">
                                    <b>Tổng cộng:</b>
                                </td>
                                <td class="price text-right"><b><?php echo currency_format($billPrice); ?></b></td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần About -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>

    <script src="public/javascript/cart.js"></script>
</body>

</html>