<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="./CSS/productcss.css" />
        <link rel="stylesheet" href="./CSS/ordercss.css" />
        <link rel="stylesheet" href="./CSS/categorycss.css"/>
        
        <script src="https://cdn.tailwindcss.com"></script>
        <script
            src="https://kit.fontawesome.com/554d86bd57.js"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            />

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
                            <c:if test="${not empty sessionScope.account.full_name}">${sessionScope.account.full_name}</c:if>
                            <c:if test="${not empty sessionScope.google.name}">${sessionScope.google.name}</c:if>
                            <a href='/Account/logout'>Thoat</a>
                        </c:otherwise>
                    </c:choose>     
                             
                    <i class="fa fa-shopping-bag fa-2x cart-toggle"></i>
                </div>
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
        <div class="content">
            <div class="p-20 px-[300px]">
                <h2 class="text-xl font-bold">Thông tin đơn hàng</h2>
                <div class="flex justify-center mt-10 p-8 order relative">
                    <form action="orderAgain" method="post" class="flex flex-col">
                        <input
                            id="fullname"
                            name="fullname"
                            type="text"
                            placeholder="Tên khách hàng"
                            value="${empty sessionScope.account.full_name ? "" : sessionScope.account.full_name}"
                            />
                        <input
                            id="phone"
                            name="phone"
                            type="text"
                            placeholder="Số điện thoại"
                            value="${empty sessionScope.account.phone ? "" : sessionScope.account.phone}"
                            />
                        <input
                            id="email"
                            name="email"
                            type="email"
                            placeholder="Email"
                            value="${empty sessionScope.account.email ? "" : sessionScope.account.email}"
                            />
                        <input
                            id="address"
                            name="address"
                            type="text"
                            placeholder="Địa chỉ"
                            value="${empty sessionScope.account.address ? "" : sessionScope.account.address}"
                            />
                        <textarea
                            rows="3"
                            class="notecard text-sm"
                            id="message"
                            name="message"
                            >${message}</textarea>
                        <p>Phương thức thanh toán:</p>
                        <div class="flex justify-between">
                            <div class="flex items-center">
                                <label for="shipping_method1">Ngân hàng</label>
                                <input
                                    type="radio"
                                    name="shipping_method"
                                    id="shipping_method1"
                                    value="banking"
                                    checked
                                    />
                            </div>
                            <div class="flex items-center">
                                <label for="shipping_method2">COD</label>
                                <input
                                    type="radio"
                                    name="shipping_method"
                                    id="shipping_method2"
                                    value="COD"
                                    />
                            </div>
                        </div>
                        <input type="text" name="totalPrice" value="${totalPrice}" class="hidden">
                        <input
                            type="submit"
                            value="Đặt hàng"
                            class="cursor-pointer bg-black text-white"
                            />
                    </form>
                    <div class="order-items ml-8 h-full px-4 max-h-[300px]">
                        <c:forEach items="${requestScope.carts}" var="cs">
                            <div class="order-item flex items-start p-2 mb-2">
                                <div class="order-img mr-2">
                                    <img
                                        src="${cs.productImg}"
                                        alt=""
                                        class="min-w-[80px] h-[80px] object-cover rounded-[5px]"
                                        />
                                </div>
                                <div class="order-info w-[250px] flex flex-col">
                                    <div class="flex items-center flex-1">
                                        <h3 class="text-sm mr-4 flex-1 font-bold">
                                            ${cs.productName}
                                        </h3>
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
                                    <div class="">
                                        <p class="text-xs text-red-400">
                                            ${cs.price} VND
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach> 

                    </div>
                    <div class="flex w-[350px] absolute right-20 bottom-10 ">
                        <h2 class="font-bold flex-1">Tổng tiền :</h2>
                        <p class="text-red-400">${totalPrice} VND</p>
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