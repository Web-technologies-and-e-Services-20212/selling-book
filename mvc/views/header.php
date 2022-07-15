<?php
include_once ROOT . DS . 'services' . DS . "GuestServices.php";

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
            <div>CÔNG TY CỔ PHẦN XUẤT BẢN VÀ TRUYỀN THÔNG IPM</div>
            <div class="account">
                <a href=<?php echo "/" . $path_project . "/login" ?>><?php
                                                                        if (isset($_SESSION['username'])) {
                                                                            $guestService = new GuestServices();
                                                                            $currentUser = $guestService->get($_SESSION['username']);
                                                                            echo "Xin chào : " . $currentUser->getName();
                                                                        } else {
                                                                            echo "Đăng nhập";
                                                                        }
                                                                        ?></a>
                <p class="divider">|</p>
                <a href=<?php echo "/" . $path_project . "/library/refresh_session.php" ?>>Đăng xuất</a>
            </div>
        </div>
    </div>
    <!-- Topbar end -->
    <!-- Site Header start -->
    <div class="site-header w100p">
        <div class="container flex f-space_between f-align_center">
            <div class="header-logo">
                <a href=<?php echo "/" . $path_project . "/" ?>>
                    <img src="/selling-book/public/images/logo/logo.webp" alt="logo" />
                </a>
            </div>

            <div class="header-search w50p">
                <form class="relative w100p">
                    <label htmlFor="search" class="hidden"></label>
                    <input class="search-text" name="search" id="search" type="search" placeholder="Tìm kiếm ..."></input>
                    <button type="submit" class="search-btn absolute">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <div class="header-cart">
                <div class="topbar-cart">
                    <div class="shopping-cart">
                        <a class="flex f-space_between f-align_center" href=<?php echo "/" . $path_project . "/cart" ?>>
                            <div class="cart-icon relative">
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="quantity absolute">3</span>
                            </div>

                            <div class="cart-info">
                                <h2>Giỏ hàng</h2>
                                <span>3 sản phẩm</span>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Site Header end -->
    <!-- Navbar start -->
    <div class="site-nav">
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
                        <li><a href=<?php echo "/" . $path_project . DS . "list-products" . DS . "detecvive" ?>>Trinh Thám , Kinh dị</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . "modern-literature" ?>>Văn học hiện đại</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . "classic-literature" ?>>Văn học kinh điển</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . "fantasy" ?>>Fantasy</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . "light-novel" ?>>Light Novel</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . "manga-comic" ?>>Manga - Comic</a></li>
                        <li><a href=<?php echo "/" . $path_project . DS .  "list-products" . DS . "learning-book" ?>>Sách học ngữ</a></li>
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
    <!-- Navbar end -->
</header>