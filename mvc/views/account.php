<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";

ob_start();
session_start();
if (!isset($_SESSION['username']) || $_SESSION['username'] == '') {
    header("Location: /login");
} else {
    if (!isset($currentUser)) {
        $guestService = new GuestServices();
        $currentUser = $guestService->get($_SESSION['username']);
        $currentUserName = $currentUser->getName();
        $currentUserAddress = $currentUser->getAddress();
        $currentUserPhone = $currentUser->getPhoneNumber();
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
    <link rel="shortcut icon" href="public/images/logo/logo_icon.png" type="image/x-icon">
    <link rel="stylesheet" href="public/css/style.css" type="text/css">
    <title>IPM | Tài khoản của bạn</title>
</head>

<body>
    <!-- Nội dung phần Header -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
    <!-- Kết thúc nội dung phần Header -->

    <!-- Nội dung phần Account -->
    <div class="w100p" id="account">
        <div class="container">
            <span class="w100p account-title">
                <h1>Tài khoản của bạn
                    <a href=<?php echo "/" . $path_project . "/library/refresh_session.php" ?> class="log-out">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Thoát
                    </a>
                </h1>
            </span>

            <div class="customer-info flex">
                <div class="grid-r5m2">
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

                <div class="grid-r5m3 p-t10">
                    <div class="update-address m-b10">
                        <button class="btn btn-default btn-primary" onclick="toggleForm('update-address')">Cập nhật địa chỉ</button>
                        <form action="" id="update-address" method="POST" style="display: none">
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required name="name" type="text" size="60" value="<?php echo $currentUserName; ?>" placeholder="Tên" class="p-b15 textbox form-control">
                            </div>

                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-location-dot"></i>
                                </span>
                                <input required name="address" type="text" value="<?php echo $currentUserAddress; ?>" size="60" placeholder="Địa chỉ" class="p-b15 textbox form-control">
                            </div>

                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-phone"></i>
                                </span>
                                <input required name="phone" type="tel" size="60" value="<?php echo $currentUserPhone ;?>" placeholder="Số điện thoại" class="p-b15 textbox form-control">
                            </div>

                            <div id="form-action">
                                <input type="submit" style="width: 20%" value="Cập nhật" class="btn w100p m-t20 btn-default">
                            </div>
                        </form>
                    </div>

                    <div class="update-password m-b10">
                        <button class="btn btn-default btn-primary" onclick="toggleForm('update-password')">Đổi mật khẩu</button>
                        <form action="" method="POST" id="update-password" style="display: none">
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required name="name" type="password" size="60" placeholder="Mật khẩu cũ" class="p-b15 textbox form-control">
                            </div>
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required name="name" type="text" size="60" placeholder="Mật khẩu mới" class="p-b15 textbox form-control">
                            </div>
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required name="name" type="text" size="60" placeholder="Xác nhận mật khẩu mới" class="p-b15 textbox form-control">
                            </div>

                            <div id="form-action">
                                <input type="submit" style="width: 20%" value="Thay đổi" class="btn w100p m-t20 btn-default">
                            </div>
                        </form>
                    </div>
                </div>

            </div>

            <div class="customer-order">
                <span>
                    <h1>Đơn hàng của bạn</h1>
                </span>
                <table>
                    <thead>
                        <tr>
                            <th class="order-number">Mã đơn hàng</th>
                            <th class="date-order">Ngày đặt</th>
                            <th class="payment-status">Trạng thái thanh toán</th>
                            <th class="fulfill-status">Vận chuyển</th>
                            <th class="total">Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="order-number">
                                <a href="#">#IPM133456</a>
                            </td>
                            <td class="date-order">01/07/2022</td>
                            <td class="payment-status">Đã hoàn tất</td>
                            <td class="fulfill-status">Đã vận chuyển</td>
                            <td class="total">390,000đ</td>
                        </tr>

                        <tr>
                            <td class="order-number">
                                <a href="#">#IPM133456</a>
                            </td>
                            <td class="date-order">01/07/2022</td>
                            <td class="payment-status">Đã hoàn tất</td>
                            <td class="fulfill-status">Đã vận chuyển</td>
                            <td class="total">390,000đ</td>
                        </tr>

                        <tr>
                            <td class="order-number">
                                <a href="#">#IPM133456</a>
                            </td>
                            <td class="date-order">01/07/2022</td>
                            <td class="payment-status">Đã hoàn tất</td>
                            <td class="fulfill-status">Đã vận chuyển</td>
                            <td class="total">390,000đ</td>
                        </tr>

                        <tr>
                            <td class="order-number">
                                <a href="#">#IPM133456</a>
                            </td>
                            <td class="date-order">01/07/2022</td>
                            <td class="payment-status">Đã hoàn tất</td>
                            <td class="fulfill-status">Đã vận chuyển</td>
                            <td class="total">390,000đ</td>
                        </tr>

                        <tr>
                            <td class="order-number">
                                <a href="#">#IPM133456</a>
                            </td>
                            <td class="date-order">01/07/2022</td>
                            <td class="payment-status">Đã hoàn tất</td>
                            <td class="fulfill-status">Đã vận chuyển</td>
                            <td class="total">390,000đ</td>
                        </tr>

                        <tr>
                            <td class="order-number">
                                <a href="#">#IPM133456</a>
                            </td>
                            <td class="date-order">01/07/2022</td>
                            <td class="payment-status">Đã hoàn tất</td>
                            <td class="fulfill-status">Đã vận chuyển</td>
                            <td class="total">390,000đ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Account -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    <script src="public/javascript/base.js"></script>

</body>

</html>