<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";
include_once ROOT . DS . 'config' . DS . "category_config.php";

global $path_project;

if (!isset($_SESSION)) {
    ob_start();
    session_start();
}
$url = isset($_GET["url"]) ? $_GET["url"] : "/";

?>
<!-- HTML Here -->
<header id="header">
    <!-- Topbar start -->
    <div class="site-topbar w100p">
        <div class="container flex f-space_between f-align_center h100p">
            <div class="hidden-md">CÔNG TY CỔ PHẦN XUẤT BẢN VÀ TRUYỀN THÔNG IPM</div>
            <div class="account">
                <?php
                if (!isset($_SESSION['username'])) { ?>
                    <a href=<?php echo "/" . $path_project . "/" . "register"; ?>>Đăng ký</a>
                    <p class="divider">|</p>
                    <a href=<?php echo "/" . $path_project . "/login"; ?>>Đăng nhập</a>

                <?php   } ?>
                <?php
                if (isset($_SESSION['username'])) {
                    $guestService = new GuestServices();
                    $currentUser = $guestService->get($_SESSION['username']);
                    $productsNumber = count($guestService->getListCartBooks($_SESSION['username']));
                ?>
                    <a href=<?php echo "/" . $path_project . "/account"; ?>>
                        <?php echo "Xin chào: " . $currentUser->getName(); ?>
                    </a>
                    <p class="divider">|</p>
                    <a href=<?php echo "/" . $path_project . "/library/refresh_session.php"; ?>>Đăng xuất</a>
                <?php   } ?>
            </div>
        </div>
    </div>
    <!-- Topbar end -->
    <!-- Site Header start -->
    <div class="site-header w100p">
        <div class="container flex f-space_between f-align_center">
            <div class="header-mobile-bar w25p-md p-l15 hidden-lg">
                <button>
                    <i class="fa-solid fa-bars"></i>
                </button>
            </div>
            <div class="header-logo w50p-md">
                <h1>
                    <a href=<?php echo "/" . $path_project . "/" ?>>
                        <img src="/selling-book/public/images/logo/logo.webp" alt="logo" />
                    </a>
                </h1>

            </div>

            <div class="header-search w50p w100p-md">
                <form action="/selling-book/search" method="POST" class="relative w100p" id="form-seach">
                    <label htmlFor="search" class="hidden"></label>
                    <input class="search-text" name="search" id="search" type="search" placeholder="Tìm kiếm ..."></input>
                    <button type="submit" class="search-btn absolute">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <div class="header-cart w25p-md">
                <div class="topbar-cart">
                    <div class="shopping-cart">
                        <a class="flex f-space_between f-align_center" href=<?php echo "/" . $path_project . "/cart" ?>>
                            <div class="cart-icon relative">
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="quantity absolute"><?php
                                                                if (!isset($_SESSION['username'])) echo "0";
                                                                else echo $productsNumber; ?></span>
                            </div>

                            <div class="cart-info hidden-md">
                                <h2>Giỏ hàng</h2>
                                <span><?php
                                        if (!isset($_SESSION['username'])) echo "0";
                                        else echo $productsNumber; ?> sản phẩm</span>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Site Header end -->
    <!-- Navbar start -->
    <div class="site-nav hidden-sm">
        <div class="container">
            <nav class="flex f-space_between f-align_center">
                <ul>
                    <li>
                        <a class=<?php echo $url == "/" ? "active" : "non-active" ?> href=<?php echo "/" . $path_project . "/" ?>>Trang chủ</a>
                    </li>
                </ul>

                <ul id="dropdown">
                    <li>
                        <a class=<?php echo $url == "list-products" ? "active" : "non-active" ?> href=<?php echo "/" . $path_project . DS . "list-products" ?>>Sản phẩm</a>

                    </li>
                    <ul class="menu-dropdown">
                        <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_DETECTIVE['route'] ?>>Trinh Thám , Kinh dị</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_MODERN_LITERARURE['route'] ?>>Văn học hiện đại</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_CLASSIC_LITERATURE['route'] ?>>Văn học kinh điển</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_FANTASY['route'] ?>>Fantasy</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_LIGHT_NOVEL['route'] ?>>Light Novel</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_BOY_LOVE['route'] ?>>Boys Love</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_BOXSET['route'] ?>>Boxset</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_MANGA_COMIC['route'] ?>>Manga - Comic</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_LEARNING_BOOK['route'] ?>>Sách học ngữ</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_CHILD_BOOK['route'] ?>>Sách thiếu nhi</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . CATEGORY_ACCESSORIES['route'] ?>>Phụ kiện</a></li>
                    </ul>
                </ul>

                <ul>
                    <li>
                        <a class=<?php echo $url == "blogs" ? "active" : "non-active" ?> href=<?php echo "/" . $path_project . DS . "blogs" ?>>Tin tức</a>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a class=<?php echo $url == "about" ? "active" : "non-active" ?> href=<?php echo "/" . $path_project . "/about" ?>>Về IPM</a>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a class=<?php echo $url == "contact" ? "active" : "non-active" ?> href=<?php echo "/" . $path_project . "/contact" ?>>Liên hệ</a>
                    </li>
                </ul>



            </nav>
        </div>
    </div>
    <nav id="mobile-menu" class="mp-menu mp-cover">
        <div class="mp-level mp-level-open">
            <ul class="lv1">
                <li><a href=<?php echo "/" . $path_project . "/"; ?>>Trang chủ</a></li>
                <li class="has-children icon icon-arrow-left">
                    <a>Sản phẩm 
                        <button style="float: right; background-color: var(--primary-color);"><i 
                        style="font-size: 14px; display:inline-block; color: #fff;background-color: var(--primary-color); " 
                        class="fa-solid fa-chevron-right"></i>
                        </button>
                    </a>

                    <div class="mp-level">
                        <a href=<?php echo "/" . $path_project . "/" . "list-products"; ?>>Sản phẩm</a>
                        <a class="mp-back"  href="#">
                        <button style="background-color: var(--primary-color);"><i 
                        style="font-size: 14px; display:inline-block; color: #fff;background-color: var(--primary-color); " 
                        class="fa-solid fa-chevron-left"></i>
                        </button>
                        Quay lại
                        </a>
                        <ul class="cd-secondary-nav count-nav-11">
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_DETECTIVE['route'] ?>>Trinh Thám - Kinh Dị</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_MODERN_LITERARURE['route'] ?>>Văn Học Hiện Đại</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_CLASSIC_LITERATURE['route'] ?>>Văn Học Kinh Điển</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_FANTASY['route'] ?>>Fantasy</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_LIGHT_NOVEL['route'] ?>>Light Novel</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_BOY_LOVE['route'] ?>>Boys Love</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_BOXSET['route'] ?>>Boxset</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_LEARNING_BOOK['route'] ?>>Sách Học Ngữ</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_LEARNING_BOOK['route'] ?>>Manga - Comic</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_CHILD_BOOK['route'] ?>>Sách Thiếu Nhi</a></li>
                            <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . CATEGORY_ACCESSORIES['route'] ?>>Phụ Kiện</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href=<?php echo "/" . $path_project . "/" . "blogs"; ?>>Tin tức</a></li>
                <li><a href=<?php echo "/" . $path_project . "/" . "about"; ?>>Về IPM</a></li>
                <li><a href=<?php echo "/" . $path_project . "/" . "contact"; ?>>Liên hệ</a></li>
            </ul>
        </div>
    </nav>
    <!-- Navbar end -->
    <script>
        var mobileBar = document.querySelector(".header-mobile-bar button");
        var mobileMenu = document.querySelector("#mobile-menu");

        var categoryMenu = document.querySelector(".has-children .mp-level");
        var categoryBtn = document.querySelector(".has-children a");

        var menuBack = document.querySelector(".mp-back");

        mobileBar.addEventListener('click', function(e) {
            mobileMenu.style.transform = "translate3d(0%, 0, 0)"
        })
        categoryBtn.addEventListener('click', function(e) {
            categoryMenu.style.transform = "translate3d(0%, 0, 0)"
        })
        menuBack.addEventListener('click', function(e) {
            categoryMenu.style.transform = "translate3d(-100%, 0, 0)"
        })
    </script>
</header>