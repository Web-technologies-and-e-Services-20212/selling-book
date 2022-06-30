<?php
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
                    <form action="#" method="POST" id="cartForm">
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
                                <tr>
                                    <td class="image">
                                        <div class="product-image">
                                            <img src="public/images/products/p10.png" alt="1">
                                        </div>
                                    </td>
                                    <td class="item"><a href="#">
                                        <strong>Vẽ vời vẩn vơ - 1</strong>
                                    </a></td>
                                    <td class="qty">
                                        <input type="number" size="4" min="1" id="update-quatity"
                                        value="1" class="input-quantity">
                                    </td>
                                    <td class="price">49,300đ</td>
                                    <td class="delete"><a href="#" class="click-delete">Xóa</a></td>
                                </tr>

                                <tr>
                                    <td class="image">
                                        <div class="product-image">
                                            <img src="public/images/products/p6.png" alt="1">
                                        </div>
                                    </td>
                                    <td class="item"><a href="#">
                                        <strong>Vẽ vời vẩn vơ - 1</strong>
                                    </a></td>
                                    <td class="qty">
                                        <input type="number" size="4" min="1" id="update-quatity"
                                        value="1" class="input-quantity">
                                    </td>
                                    <td class="price">49,300đ</td>
                                    <td class="delete"><a href="#" class="click-delete">Xóa</a></td>
                                </tr>

                                <tr>
                                    <td class="image">
                                        <div class="product-image">
                                            <img src="public/images/products/p9.png" alt="1">
                                        </div>
                                    </td>
                                    <td class="item"><a href="#">
                                        <strong>Vẽ vời vẩn vơ - 1</strong>
                                    </a></td>
                                    <td class="qty">
                                        <input type="number" size="4" min="1" id="update-quatity"
                                        value="1" class="input-quantity">
                                    </td>
                                    <td class="price">49,300đ</td>
                                    <td class="delete"><a href="#" class="click-delete">Xóa</a></td>
                                </tr>

                                <tr class="summary">
                                    <td class="image">&nbsp;</td>
                                    <td class="item">&nbsp;</td>
                                    <td class="sum">
                                        <b>Tổng cộng:</b>
                                    </td>
                                    <td class="price"><b>200,000đ</b></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="flex w100p">
                            <div class="grid-r2 p-lr15">
                                <div class="form-group p-b15">
                                    <label for="noteCartMessage">Ghi chú</label>
                                    <textarea required rows="4" type="text" id="noteCartMessage"
                                    class="form-control m-t10"></textarea>
                                </div>
                            </div>
                            <div class="grid-r2">
                                <div class="m-t30">
                                    <div class="flex p-t30 f-end p-lr15">
                                        <button class="btn btn-default btn-md">Cập nhật
                                            <i class="fa-solid fa-chevron-right"></i>
                                        </button>
                                        <button class="btn btn-default btn-md">Thanh toán
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
                    </form>
                </div>
            </div>
        </div>
        <!-- Kết thúc nội dung phần About -->

        <!-- Nội dung phần Footer --> 
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    </body>
</html>