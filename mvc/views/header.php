<?php
global $path_project;
?>
<!-- HTML Here -->
<header class="header">
    <!-- Topbar start -->
    <div class="site-topbar w100p">
        <div class="container flex f-space_between f-align_center h100p">
            <div>CÔNG TY CỔ PHẦN XUẤT BẢN VÀ TRUYỀN THÔNG IPM</div>
            <div class="account">
                <a href="/account" >Xin chào: Trần Lâm</a>
                <p class="divider">|</p>
                <a href="#">Đăng xuất</a> 
            </div>
        </div>
    </div>
    <!-- Topbar end -->
    <!-- Site Header start -->
    <div class="site-header w100p">
        <div class="container flex f-space_between f-align_center">
            <div class="header-logo">
                <a href=<?php echo "/" . $path_project . "/"?>>
                    <img src="public/images/logo/logo.jpg" alt="logo" />
                </a>
            </div>

            <div class="header-search w50p">
                <form class="relative w100p">
                    <label htmlFor="search" class="hidden" ></label>
                    <input class="search-text" name="search" id="search" type="search" placeholder="Tìm kiếm ..." ></input>
                    <button type="submit" class="search-btn absolute">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <div class="header-cart">
                <div class="topbar-cart">
                    <div class="shopping-cart">
                        <a class="flex f-space_between f-align_center" href=<?php echo "/" . $path_project . "/cart"?>>
                            <div class="cart-icon relative">
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="quantity absolute">3</span>
                            </div>

                            <div class="cart-info">
                                <h2>Giỏ hàng</h2>
                                <p>3 sản phẩm</p>
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
                        <a href=<?php echo "/" . $path_project . "/"?>>Trang chủ</a>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a href=<?php echo "/" . $path_project . "/list_products"?>>Sản phẩm</a>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a href=<?php echo "/" . $path_project . "/blogs"?>>Tin tức</a>
                    </li>
                </ul>

                <ul>
                    <li>
                        <a href=<?php echo "/" . $path_project . "/about"?>>Về IPM</a>
                    </li>
                </ul>

                <ul>
                    <li>
                    <a href=<?php echo "/" . $path_project . "/contact"?>>Liên hệ</a>
                    </li>
                </ul>

            
                
            </nav>
        </div>
    </div>
    <!-- Navbar end -->
</header>