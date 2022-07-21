<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";
include_once ROOT . DS . 'library' . DS . "format.php";

ob_start();
session_start();
if (!isset($_SESSION['username']) || $_SESSION['username'] == '') {
    header("Location: /login");
} else {
    if (!isset($currentUser)) {
        $guestService = new GuestServices();
        if (isset($_POST['name'])) {
            $guestService->update($_SESSION['username'], $_POST['name'], $_POST['address'], $_POST['phone']);
            header("refresh: 0");
        }
        $currentUser = $guestService->get($_SESSION['username']);
        if (isset($_POST['newPass'])) {
            $oldPass = sha1($_POST['oldPass']);
            $newPassword = sha1($_POST['newPass']);
            if ($currentUser->getPassword() != $oldPass) {
                $errorPasswordMessage = "Mật khẩu cũ nhập không đúng !";
            }else{
                $guestService->updatePassword($_SESSION['username'], $newPassword);
                header("refresh: 0");
            }
            
        }

        $currentUserName = $currentUser->getName();
        $currentUserAddress = $currentUser->getAddress();
        $currentUserPhone = $currentUser->getPhoneNumber();

        $listBill = $guestService->getListBill($_SESSION['username']);
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
    <link rel="stylesheet" href="/selling-book/public/css/base.css" type="text/css">
    <link rel="stylesheet" href="/selling-book/public/css/layout/account.css" type="text/css">
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
                <div class="grid-r2 p-lr15 w100p-sm">
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

                <div class="grid-r2 p-t10 p-lr15 w100p-sm">
                    <div class="update-address m-b10">
                        <button class="btn btn-default btn-primary" onclick="toggleForm('update-address')">Cập nhật địa chỉ</button>
                        <form action="/selling-book/account" id="update-address" method="POST" style="display: none">
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required id="new-name-input" name="name" type="text" size="60" value="<?php echo $currentUserName; ?>" placeholder="Tên" class="p-b15 textbox form-control">
                            </div>

                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-location-dot"></i>
                                </span>
                                <input required id="new-address-input" name="address" type="text" value="<?php echo $currentUserAddress; ?>" size="60" placeholder="Địa chỉ" class="p-b15 textbox form-control">
                            </div>

                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-phone"></i>
                                </span>
                                <input required id="new-phone-input" name="phone" type="tel" size="60" value="<?php echo $currentUserPhone; ?>" placeholder="Số điện thoại" class="p-b15 textbox form-control">
                            </div>

                            <div id="form-action">
                                <input type="submit" style="width: 20%" value="Cập nhật" class="btn w100p m-t20 btn-default">
                            </div>
                        </form>
                    </div>

                    <div class="update-password m-b10">
                        <button class="btn btn-default btn-primary" onclick="toggleForm('update-password')">Đổi mật khẩu</button>
                        <?php if (isset($errorPasswordMessage)) { ?>
                            <div style="color: #dd4b39; font-size: 16px;font-weight: 500;padding: 6px 0;"><?php echo $errorPasswordMessage; ?></div>
                        <?php } ?>
                        <form action="/selling-book/account" method="POST" id="update-password" style="display: none">
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required id="oldPassword" name="oldPass" type="password" size="60" placeholder="Mật khẩu cũ" class="p-b15 textbox form-control">
                            </div>
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required id="newPassword" onchange="validateChangePassword()" name="newPass" type="password" size="60" placeholder="Mật khẩu mới" class="p-b15 textbox form-control">
                            </div>
                            <div class="input-group m-t10 m-b10">
                                <span class="input-group-addon">
                                    <i class="fa-solid fa-user"></i>
                                </span>
                                <input required id="confirmNewPassword" onkeyup="validateChangePassword()" name="confirmPass" type="password" size="60" placeholder="Xác nhận mật khẩu mới" class="p-b15 textbox form-control">
                            </div>

                            <div id="form-action">
                                <input type="submit" style="width: 20%" value="Thay đổi" class="btn w100p m-t20 btn-default">
                            </div>
                        </form>
                    </div>
                </div>

            </div>

            <div class="customer-order m-b20">
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
                        <?php foreach ($listBill as $key => $bill) {
                            $billId = $bill->getBillID();
                            $billDate = $bill->getDateBill();
                            $billStatus = billStatus_format($bill->getStatus());
                            $transportStatus = transportStatus_format($bill->getStatus());
                            $billPrice = currency_format($bill->getTotalPrice());

                        ?>
                            <tr>
                                <td class="order-number">
                                    <a href=<?php echo "/" . $path_project . "/account" . "/orders" . "/" . sha1($billId) ?>>#<?php echo $billId; ?></a>
                                </td>
                                <td class="date-order"><?php echo $billDate; ?></td>
                                <td class="payment-status"><?php echo $billStatus; ?></td>
                                <td class="fulfill-status"><?php echo $transportStatus; ?></td>
                                <td class="total"><?php echo $billPrice; ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Kết thúc nội dung phần Account -->

    <!-- Nội dung phần Footer -->
    <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    <script src="public/javascript/account.js"></script>

</body>

</html>