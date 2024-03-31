<%-- 
    Document   : Loginsignup
    Created on : Mar 2, 2024, 12:53:49 AM
    Author     : haqua
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/554d86bd57.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="./CSS/Loginsignup.css">
    </head>
    <body>
    <div class="header">
        <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/banner-contact.jpg" alt="">
        <div class="header-bar">
            <div class="logo">
                <a href=""><img src="https://store.bobapop.com.vn/common/images/logo.png" alt=""></a>
            </div>
            <ul class="list">
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
                        <ul class="produce-inner" style="display: flex; gap: 20px;">
                            <c:forEach items="${listC}" var="o">
                            <li><a href="category?category_id=${o.category_id}">${o.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            <div class="search">
                <i style="color: white;" class="fa fa-search"></i>
                <a href="">
                    <li>Đăng nhập</li>
                </a>
                <!--<i style="color: white;" class="fa fa-shopping-bag fa-2x cart-toggle"></i>-->
            </div>
        </div>
    </div>
        <h3 style="color:red; text-align: center; margin-top: 20px;">${requestScope.error}</h3>
    <div class="content">
        <div class="content-item">
            <form class="form-login" action="login" method="post">
                <h5>Login</h5>
                <input type="text" name="email" placeholder="name@email.com" /> <br />
                <input type="password" name="password" placeholder="Password" /> <br />
                <button type="submit">Login</button> <br />
                <button class="google-login-btn" onclick="openLinkInNewTab()
                ">Login With Google <i class="fab fa-google"></i></button>
                <div><a href="/Account/forgotpassword">Forgot password!</a></div>
                <script>
                  let openLinkInNewTab = () => {
                    window.open("https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/Account/LoginGoogleHandler&response_type=code&client_id=617665174193-4jc8fi70qipov2s1rueqbgnughkaft1m.apps.googleusercontent.com&approval_prompt=force", "_blank");
                   };
                </script>
               

            </form>
        </div>
        <div class="line"></div>
        
        
        <div class="content-item">
            <form class="form-register" action="signup" method="post">
                
              
                    <c:if test="${not empty requestScope.errorEmail}">
                        <div style="text-align: center;background-color: red ;margin: 5px 0; padding: 10px">${requestScope.errorEmail}</div>
                    </c:if>
                    <c:if test="${not empty requestScope.success}"> 
                        <div style="background-color: buttonface; text-align: center; margin: 5px 0; padding: 10px 0">${requestScope.success}</div> 
                    </c:if>
             
                <h5>Register</h5>
                <!--<input type="number" name="account_id" placeholder="Id Account"><br />-->
                <input type="text" name="full_name" placeholder="Fullname" /><br />
                <input type="email"name="email" placeholder="name@gmail.com" /><br />
                <input type="password" name="password" placeholder="Password" /><br />
                <input type="text" name="phone" placeholder="Phone"><br />
                <input type="text" name="address" placeholder="Address"><br />
                <button type="submit">Continue</button><br />
            </form>
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
                        <img src="https://store.bobapop.com.vn/common/images/logo.png" alt="">
                    </a>
                </div>
                <div class="link_icon">
                    <a href="#"><img src="https://store.bobapop.com.vn/common/images/fa.png" alt=""></a>
                    <a href="#"><img src="https://store.bobapop.com.vn/common/images/ins.png" alt=""></a>
                </div>
            </div>
        </div>
    </div>
        <script src="https://kit.fontawesome.com/554d86bd57.js" crossorigin="anonymous"></script>
        <script>
            // Lấy phần TEAS và TEAS-inner từ DOM
            const teasMenu = document.querySelector('.list li:nth-child(2) a');
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
</body>
</html>
