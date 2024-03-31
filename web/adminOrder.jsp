<%-- 
    Document   : newjsp
    Created on : Mar 10, 2024, 3:41:04 AM
    Author     : duong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script

            <script
            src="https://kit.fontawesome.com/554d86bd57.js"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />
        <!--<link rel="stylesheet" href="./Style.css">-->
        <link rel="stylesheet" href="./CSS/viewordercss.css" />
    </head>
    <body>
        <div class="header">
            <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/banner-trong.jpg" alt="">
            <div class="header-bar">
                <div class="logo">
                    <a href=""><img src="https://store.bobapop.com.vn/common/images/logo-green.png" alt=""></a>
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
                    <i style="color: black;" class="fa fa-search"></i>
                    <c:choose>
                        <c:when test="${empty sessionScope.account.full_name && empty sessionScope.google.name}">
                            <a style="color: white;" href='/Account/loginsignup'>Login</a>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty sessionScope.account.full_name}"><a href="updateaccount?account_id=${sessionScope.account_id}">${sessionScope.account.full_name}</a></c:if>
                            <c:if test="${not empty sessionScope.google.name}">${sessionScope.google.name}</c:if>
                                <a href='/Account/logout'>Thoat</a>
                        </c:otherwise>
                    </c:choose>     

                    <i class="fa fa-shopping-bag fa-2x cart-toggle"></i>
                </div>
            </div>
        </div>
        <div class="content">
            <h3>Đơn hàng của bạn</h3>
            <div class="status-btn">
                <a href="adminOrder?query=total" class="${catStatus eq "default" ? "active-total" : "status-btn-a"}">Total</a>
                <a href="adminOrder?query=done" class="${catStatus eq "done" ? "active-done" : "status-btn-a"}">Done</a>
                <a href="adminOrder?query=pending" class="${catStatus eq "pending" ? "active-pending" : "status-btn-a"}">Pending</a>
                <a href="adminOrder?query=cancelled" class="${catStatus eq "cancelled" ? "active-cancel" : "status-btn-a"}">Cancelled</a>
            </div>


            <div class="content-item">
                <c:forEach items="${listO}" var="o">
                    <div class="order-card order-card-${o.orderId}">
                        <div class="order-card-info ">
                            <div class="order-card-header order-card-info-${o.orderId}">
                                <div class="order-card-header-icon icon-${o.orderId}">
                                    <i class="fa-solid fa-angle-right"></i>
                                </div>
                                <h6>Mã đơn hàng : ${o.orderId} - ${o.email}</h6>

                            </div>
                            <div class="order-card-time">
                                <p class="date">${o.date}</p>
                                <p class="time">${o.time}</p>
                            </div>
                            <div class="order-card-price">
                                <div class="totalPrice"><p>${o.totalPrice} VND</p></div>
                                <div class="order-card-status">

                                    <c:if test="${o.status eq 'PENDING'}">
                                        <p class="pending">PENDING</p>
                                    </c:if>
                                    <c:if test="${o.status eq 'CANCELLED'}">
                                        <p class="cancelled">CANCELLED</p>
                                    </c:if>
                                    <c:if test="${o.status eq 'DONE'}">
                                        <p class="done">DONE</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <c:forEach items="${listOdd}" var="od">
                            <c:choose>
                                <c:when test="${o.orderId eq od.orderId}">
                                    <div class="order-card-detail">
                                        <div class="order-detail">
                                            <c:forEach items="${listP}" var="p">
                                                <c:choose>
                                                    <c:when test="${fn:contains(p.product_id, od.orderDetailId)}">
                                                        <a href="product?product_id=${od.productId}">
                                                            <div class="order-detail-item">
                                                                <div class="order-detail-img">
                                                                    <img
                                                                        src="${p.product_picture}"
                                                                        alt=""
                                                                        />
                                                                </div>
                                                                <div class="order-detail-info">
                                                                    <h4>${p.product_name}</h4>
                                                                    <p class="text-12">SIZE : ${od.size}</p>
                                                                    <div class="sugarIce">
                                                                        <p class="text-12">ICE-% : ${od.ice}</p>
                                                                        <p class="text-12">SUGAR-% : ${od.sugar}</p>
                                                                    </div>
                                                                    <p class="text-12">Quantity : x${od.quantity}</p>
                                                                </div>
                                                                <div class="order-detail-price">
                                                                    <p class="totalPrice">${od.price} VND</p>
                                                                </div>
                                                            </div>
                                                        </a> 
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>

                        </c:forEach>
                    </div>
                    <script>
                        function checkOrderTime(orderId, orderTime) {
                            var orderDate = new Date(orderTime);
                            var currentTime = new Date();
                            var timeDifference = currentTime.getTime() - orderDate.getTime();
                            if (timeDifference > 10000) {
                                document.querySelector(".cancelBtn-" + orderId).classList.add("hidden");
                                document.querySelector(".confirmBtn-" + orderId).classList.remove("hidden");
                            }
                        }
                        checkOrderTime("${o.orderId}", "${o.date} ${o.time}");
                    </script>
                    <script>
                        document
                                .querySelector(".order-card-info-${o.orderId}")
                                .addEventListener("click", function () {
                                    document
                                            .querySelector(".order-card-${o.orderId}")
                                            .classList.toggle("order-card-active");

                                    document
                                            .querySelector(".icon-${o.orderId}")
                                            .classList.toggle("rotate-90");
                                });
                    </script>
                </c:forEach>
            </div>
        </div>
        <div class="cart">
            <div class="cart-header">
                <h2 class="text-xl">MY BAG</h2>
                <div class="cart-icon">
                    <i class="fa-solid fa-xmark text-xl"></i>
                </div>
            </div>
            <div class="cart-items flex-1 w-full mt-2">
                <c:forEach items="${carts}" var="cs">
                    <div class="cart-item w-full mt-2 flex items-center relative">
                        <div class="cart-item-img mr-2">
                            <a href="product?product_id=${cs.productId}">
                                <img
                                    src="${cs.productImg}"
                                    alt="product-image"
                                    class="w-[50px] h-[50px] object-cover rounded-[5px]"
                                    /></a>
                        </div>
                        <div class="cart-item-info w-full">
                            <div class="flex items-center">
                                <h3 class="text-sm mr-4 flex-1">
                                    ${cs.productName}
                                </h3>
                                <p class="text-xs">${cs.price} VND</p>
                            </div>
                            <div class="flex">
                                <div class="mr-4">
                                    <p class="text-xs">Size: ${cs.size}</p>
                                    <p class="text-xs">Số lượng: ${cs.quantity}</p>
                                </div>
                                <div>
                                    <p class="text-xs">Ice: ${cs.icePercent}%</p>
                                    <p class="text-xs">Sugar: ${cs.sugarPercent}%</p>
                                </div>
                            </div>
                        </div>
                        <a class="edit-cart-item" href="updateCart?cartId=${cs.cartId}&productId=${product.product_id}">
                            <i class="fas fa-edit"></i>
                        </a>        
                        <a class="remove-cart-item" href="deleteCart?cartId=${cs.cartId}&productId=${product.product_id}">
                            <i class="fa-solid fa-xmark text-lg"></i>
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div class="cart-menu-info">
                <hr class="my-4" />
                <span class="text-xs block mb-2">Ghi chú</span>
                <form
                    action="order"
                    method="get"
                    name="form_message"
                    id="form_message"
                    >
                    <textarea
                        rows="3"
                        class="notecard text-sm"
                        id="message"
                        name="message"
                        ></textarea>
                    <hr class="mt-4" />
                    <div class="total-info flex items-center mt-1">
                        <!--<span>PHÍ SHIP<small>20,000 VND</small></span>-->
                        <p class="text-xs">TỔNG CỘNG</p>
                        <span class="total_price text-xs flex-1 text-end"
                              >${total_price == 0 ? 0 : total_price} VND</span
                        >
                    </div>
                    <input
                        type="submit"
                        class="btn btn-success btn-block mb-4 mt-6 cursor-pointer"
                        value="ĐẶT HÀNG"
                        />
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