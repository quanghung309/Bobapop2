<%-- 
    Document   : home
    Created on : Mar 3, 2024, 9:26:27 PM
    Author     : haqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="./CSS/homecss.css">
        <!--<link rel="stylesheet" href="./CSS/productcss.css" />-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    </head>
    <body>
        <div id="main">
            <div class="topmenu">
                <div class="fill">
                    <div class="top-bar">
                        <div class="logo">
                            <img src="./picture/logo.png" alt="" class="logo-img">
                        </div>
                        <div class="cb-menu">
                            <ul>
                                <li><a href="category?category_id=C7">NEW PRODUCT</a></li>
                                <li><a href="">TEAS</a></li>
                                <li><a href="/Account/home">HOME</a></li>
                            </ul>
                            <div class="Teas-inner">
                                <i class="fa-solid fa-caret-up"></i>
                                <div class="logo-inner">
                                    <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/tea.png">
                                </div>
                                <div class="name-produce-inner">
                                    <ul class="produce-inner">
                                        <c:forEach items="${listC}" var="o">
                                            <li><a href="category?category_id=${o.category_id}">${o.name}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="navbar-nav" style="gap: 10px;">
                            <form action="search" method="post">
                                <div class="navbar-search">
                                    <input name="txt" type="text" placeholder="Search..." aria-label="Search">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                            <div class="navbar-register">
                                <c:choose>
                                    <c:when test="${empty sessionScope.account.full_name && empty sessionScope.google.name}">
                                        <a style="color: white;" href='/Account/loginsignup'>Login</a>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${sessionScope.account.full_name eq 'admin'}">
                                            <a href="/Account/admin">Admin</a>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.account.full_name and sessionScope.account.full_name !='admin'}"><a href="updateaccount?account_id=${sessionScope.account_id}">${sessionScope.account.full_name}</a></c:if>
                                        <c:if test="${not empty sessionScope.google.name}">${sessionScope.google.name}</c:if>
                                        <a href='/Account/logout'>Thoat</a> 
                                    </c:otherwise>
                                </c:choose>     
                              
                            </div>

                            <div class="navbar-shopcart ${not empty sessionScope.account.full_name ? 'authenticated' : ''}">
                                <a href="#" class="menu-icon">
                                    <i class="fa-solid fa-bars"></i>

                                    <ul class="headernavbar-user-menu">
                                        <c:choose>
                                            <c:when test="${sessionScope.account.full_name eq 'admin'}">
                                                <li class="headernavbar-user-item">
                                                    <a href="/Account/statistic">Statistic</a>
                                                </li>
                                                <li class="headernavbar-user-item header__navbar-user-item--separate" style="margin-bottom: 10px;">
                                                    <a href="/Account/logout">Đăng xuất</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="headernavbar-user-item">
                                                    <a href="updateaccount?account_id">Tài khoản của tôi</a>
                                                </li>
                                                <li class="headernavbar-user-item">
                                                    <a href="/Account/vieworder">Đơn mua</a>
                                                </li>
                                                <li class="headernavbar-user-item header__navbar-user-item--separate">
                                                    <a href="/Account/logout">Đăng xuất</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul> 
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="time-info">
                        <div class="time-info-block">
                            <span>ONLINE HOURS SERVICE</span>
                            <br>
                            <span>MON - FRI : 9.30AM- 5.00PM</span>
                            <br>
                            <span">OFF WEEKEND<br></span">
                        </div>
                        <div class="time-info-block">
                            <span>GIỜ HOẠT ĐỘNG ONLINE</span><br>
                            <span>THỨ 2 - 6 : 9.30- 17.00</span><br>
                            <span>KHÔNG HOẠT ĐỘNG CUỐI TUẦN</span>
                        </div>
                    </div>
                </div>
                <figure class="wp-block-image"><a href="#"><img
                            src="http://store.bobapop.com.vn/resource/uploads/2020/12/Newlaunching7.jpg" alt=""
                            class="wp-image-12408"
                            srcset="https://store.bobapop.com.vn/resource/uploads/2020/12/Newlaunching7.jpg 2400w, https://store.bobapop.com.vn/resource/uploads/2020/12/Newlaunching7-300x120.jpg 300w, https://store.bobapop.com.vn/resource/uploads/2020/12/Newlaunching7-800x320.jpg 800w"
                            sizes="(max-width: 2400px) 100vw, 2400px"></a></figure>
            </div>

            <div class="container">
                <div class="best-seller">
                    <h2 class="heading heading-best-seller">Best Seller</h2>
                    <div class="item">
                        <div class="slider">
                            <div class="swiper mySwiper">
                                <!-- Additional required wrapper -->
                                <div class="swiper-wrapper">
                                    <!-- Slides -->
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="./picture/16-Dau-Rung-300x300.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="./picture/15-Vai-300x300.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="./picture/newproduct-1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="./picture/newproduct-1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="./picture/15-Vai-300x300.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="swiper-slide">
                                        <a href="#">
                                            <img src="./picture/15-Vai-300x300.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="slogan">
                    <img src="./picture/Lets-fresn-your-day-01.jpg" alt="">
                    <div class="text">
                        <p>
                            Let's
                            <br>
                            Fresh your day
                        </p>
                    </div>
                    <div class="policy">
                        <div class="policy-delivery">
                            <img src="./picture/ico1.png" alt="">
                            <p>Chính sách giao hàng</p>
                        </div>
                        <div>
                            <span class="separator">|</span>
                        </div>
                        <div class="policy-contact">
                            <img src="./picture/ico2.png" alt="">
                            <p>Liên hệ đặt hàng</p>
                        </div>
                    </div>
                </div>
            </div>              
            <div class="footer">
                <div class="footer_Left">
                    <h2>Customer Service: 028.3834.1690</h2>
                    <hr>
                    <div class="footer_content">
                        <div class="footer_link">
                            <ul>
                                <li>Quick Link</li>
                                <li><a href="#">Bobapop.com.vn</a></li>
                                <li><a href="#">Our Store</a></li>
                                <li><a href="#">Sign up</a></li>
                            </ul>
                        </div>
                        <div class="footer_support">
                            <ul>
                                <li>Support</li>
                                <li><a href="#">Contact us</a></li>
                                <li><a href="#">My account</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="footer_Right">
                    <h2>Join us for special things</h2>
                    <hr>
                    <div class="footer_link_icon">
                        <div>
                            <a href="#" class="logo_footer">
                                <img src="./picture/logo.png" alt="">
                            </a>
                        </div>
                        <div class="link_icon">
                            <a href="#"><i class="fa-brands fa-facebook"></i></a>
                            <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://kit.fontawesome.com/554d86bd57.js" crossorigin="anonymous"></script>
            <script>
                // Lấy phần TEAS và TEAS-inner từ DOM
                const teasMenu = document.querySelector('.cb-menu ul li:nth-child(2) a');
                const teasInner = document.querySelector('.Teas-inner');

                // Thêm sự kiện click vào menu TEAS
                teasMenu.addEventListener('click', function (event) {
                    // Ngăn chặn hành động mặc định của thẻ <a>
                    event.preventDefault();

                    // Kiểm tra xem TEAS-inner đã hiển thị hay chưa
                    const isActive = teasInner.classList.contains('show');

                    // Nếu đã hiển thị, ẩn đi; nếu chưa, hiển thị lên
                    if (isActive) {
                        teasInner.classList.remove('show');
                    } else {
                        teasInner.classList.add('show');
                    }
                });


            </script>
            <script>
                var swiper = new Swiper(".mySwiper", {
                    slidesPerView: 5,
                    loop: true,
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    pagination: {
                        el: ".swiper-pagination",
                        clickable: true,
                    },
                    navigation: {
                        nextEl: ".swiper-button-next",
                        prevEl: ".swiper-button-prev",
                    },
                });
            </script>
            <script>
            document
                    .querySelector(".cart-icon")
                    .addEventListener("click", function (e) {
                        e.preventDefault();
                        document.querySelector(".cart").classList.remove("cart-active");
                        document
                                .querySelector(".content")
                                .classList.remove("filter-blur");
                        document.querySelector(".header").classList.remove("filter-blur");
                    });
            document
                .querySelector(".cart-toggle")
                .addEventListener("click", function (e) {
                    e.preventDefault();
                    document.querySelector(".cart").classList.add("cart-active");
                    document
                            .querySelector(".content")
                            .classList.add("filter-blur");
                    document.querySelector(".header").classList.add("filter-blur");
                });
        </script>
    </body>
</html>
