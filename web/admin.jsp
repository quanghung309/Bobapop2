<%-- 
    Document   : product
    Created on : Mar 5, 2024, 12:18:06 AM
    Author     : haqua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/554d86bd57.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="./Style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="./CSS/categorycss.css"/>
    </head>
    <body>
        <div class="header">
            <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/banner-trong.jpg" alt="">
            <div class="header-bar">
                <div class="logo">
                    <a href="/Account/home"><img src="https://store.bobapop.com.vn/common/images/logo-green.png" alt=""></a>
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
                <div class="search" style="gap:10px;">
                    <form action="search" method="post">
                        <div class="navbar-search">
                            <input name="txt" type="text" placeholder="Search..." aria-label="Search">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                    <a style="color: black" href=${empty sessionScope.account.full_name ? '/Account/loginsignup' : '#'}>${empty sessionScope.account.full_name ? "Đăng Nhập" : sessionScope.account.full_name }</a>
                    <a style="color: black" href=${empty sessionScope.account.full_name ? '' : '/Account/logout'}>${empty sessionScope.account.full_name ? " " : "Thoát" }</a>
                    <!--<i class="fa fa-shopping-bag fa-2x"></i>-->
                </div>
            </div>
        </div>
        <div class="new-collections">
            <h1>Products</h1>
            <div class="collections">
                <c:if test="${currentPage == 1}">
                    <div class="load-more-button">
                        <a href="addproduct">
                            <button onclick="loadMoreProducts()">
                                <i class="fa-solid fa-plus"></i>
                            </button>
                        </a>
                    </div>
                </c:if>
                <c:forEach items="${listP}" var="p">
                    <div class="item">
                        <a href="editproduct?product_id=${p.product_id}"><img src="${p.product_picture}" alt=""></a>
                        <p>${p.product_name}</p>
                        <span>${p.price} VND 
                        </span>
                       
                        <form action="deleteProduct" method="post">
                            <a href="#" onclick="doDelete('${p.product_id}')" class="icon-trash">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </form>
                       
                    </div>  
                </c:forEach>
            </div>
        </div>
        <c:if test="${numOfPages > 1}">
            <div class="pagination">
                <c:set var="url" value="${pageContext.request.contextPath}/admin"/>
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="${url}?page=1">First</a>
                        <a href="${url}?page=${currentPage - 1}">Previous</a>
                    </c:when>
                    <c:otherwise>
                        <span>First</span>
                        <span>Previous</span>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="1" end="${numOfPages}" var="i">
                    <c:choose>
                        <c:when test="${currentPage == i}">
                            <span class="current">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${url}?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${currentPage < numOfPages}">
                        <a href="${url}?page=${currentPage + 1}">Next</a>
                        <a href="${url}?page=${numOfPages}">Last</a>
                    </c:when>
                    <c:otherwise>
                        <span>Next</span>
                        <span>Last</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
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
        <script type="text/javascript">
            function doDelete(product_id){
                if(confirm("Are you want to delete category with id="+product_id)){
                    window.location="deleteproduct?product_id="+product_id
                }
            }
        </script>
    </body>
</html>