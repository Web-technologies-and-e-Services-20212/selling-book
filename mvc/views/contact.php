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
        <link rel="stylesheet" href="/selling-book/public/css/base.css" type="text/css">
        <link rel="stylesheet" href="/selling-book/public/css/layout/contact.css" type="text/css">
        <title>IPM | Liên hệ</title>
    </head>
    <body>
        <!-- Nội dung phần Header -->
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'header.php'; ?>
        <!-- Kết thúc nội dung phần Header -->

        <!-- Nội dung phần About -->
        <div id="contact" class="w100">
            <div class="container">
                <span class="contact-title">
                    <h1>Liên hệ</h1>
                </span>

                <div class="contact-content p-lr15">
                    <div class="address w100p p-tb15">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.816995730747!2d105.84047761476276!3d20.99997168601406!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac71752d8f79%3A0xd2ec575c01017afa!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBLaW5oIFThur8gUXXhu5FjIETDom4!5e0!3m2!1svi!2s!4v1656562741576!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>

                    <div class="flex w100p">
                        <div class="grid-r5m3 p-lr15">
                            <h3>Viết nhận xét</h3>
                            <hr class="line">
                            <p class="p-tb10">Nếu bạn có thắc mắc gì, 
                                có thể gửi yêu cầu cho chúng tôi, và 
                                chúng tôi sẽ liên lạc lại với bạn sớm nhất có thể .
                            </p>
                            <form accept-charset="UTF-8" action="#" class="contact-form" method="POST">
                                <div class="form-group p-b15">
                                    <label for="contactFormName"></label>
                                    <input required type="name" id="contactFormName" placeholder="Tên của bạn" 
                                    class="input-control form-control">
                                </div>

                                <div class="form-group p-b15">
                                    <label for="contactFormEmail"></label>
                                    <input required type="email" id="contactFormEmail" placeholder="Email của bạn"
                                    class="input-control form-control">
                                </div>
                                
                                <div class="form-group p-b15">
                                    <label for="contactFormMessage"></label>
                                    <textarea required type="text" id="contactFormMessage" placeholder="Viết bình luận"
                                    class="form-control" rows="6"></textarea>
                                </div>

                                <input type="submit" value="Gửi liên hệ" class="btn btn-primary btn-lg">
                            </form>
                        </div>
                        
                        <div class="grid-r5m2 p-lr15">
                            <h3>Chúng tôi ở đây</h3>
                            <hr class="line">
                            <h3>Innovative Publishing and Media</h3>
                            <p>Công ty Cổ phần Xuất bản và Truyền thông IPM</p>
                            <div class="info-address">
                                <div class="info-item flex f-align_center p-t10">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>110 Nguyễn Ngọc Nại Hà Nội</span>
                                </div>

                                <div class="info-item flex f-align_center p-t10">
                                    <i class="fa-solid fa-envelope"></i>
                                    <span>online.ipmvn@gmail.com</span>
                                </div>

                                <div class="info-item flex f-align_center p-t10">
                                    <i class="fa-solid fa-phone"></i>
                                    <span>03 3319 3979</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Kết thúc nội dung phần About -->

        <!-- Nội dung phần Footer --> 
        <?php require_once ROOT . DS . 'mvc' . DS . 'views' . DS . 'footer.php'; ?>
    </body>
</html>

        

    