<?php

?>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="public/css/style.css" type="text/css">
    <script src="https://kit.fontawesome.com/4326137641.js" crossorigin="anonymous"></script>
    <title>Dashboard</title>

</head>



<body>
    <div class='dashboard'>
        <div class='top-nav-bar'>
            <div class='logo'>
                <img src="public/images/logo/logo_icon.png" />

            </div>
            <div class="search-box">
                <form class="relative w100p">
                    <label htmlFor="search" class="hidden"></label>
                    <input class="search-text" name="search" id="search" type="search" placeholder="Tìm kiếm ..."></input>
                    <button type="submit" class="search-btn absolute">
                        <i class="fa fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <div class='time'> <?php

                                $dt = new DateTime("now", new DateTimeZone('Asia/Ho_Chi_Minh'));

                                echo $dt->format('m/d/Y')
                                ?></div>

            <div class='right-items'>
                <i style='vertical-align: middle; margin-right: 15px' class="fa fa-solid fa-bell fa-2x"></i>
                <i style='vertical-align: middle' class="fa fa-thin fa-user fa-2x"></i>
            </div>
        </div>
        <ul>
            <li><a class="active" href="#home">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#about">About</a></li>
        </ul>

        <div class='content'>
            <div style='margin-top:65px'>
                <h2>Fixed Full-height Side Nav</h2>
                <h3>Try to scroll this area, and see how the sidenav sticks to the page</h3>
                <p>Notice that this div element has a left margin of 25%. This is because the side navigation is set to 25% width. If you remove the margin, the sidenav will overlay/sit on top of this div.</p>
                <p>Also notice that we have set overflow:auto to sidenav. This will add a scrollbar when the sidenav is too long (for example if it has over 50 links inside of it).</p>
                <p>Some text..</p>
                <p>Some text..</p>
                <p>Some text..</p>
                <p>Some text..</p>
                <p>Some text..</p>
                <p>Some text..</p>
                <p>Some text..</p>
            </div>

        </div>
    </div>


</body>

</html>