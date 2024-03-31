<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="./CSS/addproductcss.css"/>
</head>
<body>
    <div class="header">
        <img src="https://store.bobapop.com.vn/resource/uploads/2016/09/banner-contact.jpg" alt="">
        <div class="header-bar">
            <div class="logo">
                <a href=""><img src="https://store.bobapop.com.vn/common/images/logo.png" alt=""></a>
            </div>
            <ul class="list">
                <li><a href="">NEW PRODUCT</a></li>
                <li><a href="">TEAS</a></li>
                <li><a href="/Account/home">HOME</a></li>
            </ul>
            <div class="search">
                <i style="color: white;" class="fa fa-search"></i>
                 <a style="color: white;" href=${empty sessionScope.account.full_name ? '/Account/login' : '#'}>${empty sessionScope.account.full_name ? "Đăng Nhập" : sessionScope.account.full_name }</a>
                 <a href=${empty sessionScope.account.full_name ? '' : '/Account/logout'}>${empty sessionScope.account.full_name ? " " : "Thoát" }</a>
                <i class="fa fa-shopping-bag fa-2x"></i>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="content-item">
            <div class="form-login">
                <h5>Add Product</h5>
                <form action="addproduct" method="POST"">
                    <!--<input type="hidden" name="action">-->
                    <!--<input type="text" name="product_id" placeholder="Product ID" /> <br />-->
                    <input type="text" name="product_name" placeholder="Product Name" /> <br />
                    <input type="text" name="price" placeholder="Price" /> <br />
                    <select name="category_id" class="select-wrapper">
                        <option value="">Chọn loại trà sữa</option>
                        <option value="C1">Trà Sủi Bọt</option>
                        <option value="C2">Trà Con Gái</option>
                        <option value="C3">Trà Sữa</option>
                        <option value="C4">Trà Tươi</option>
                        <option value="C5">Trà Đặc Biệt</option>
                        <option value="C6">Kem Tuyết</option>
                    </select>
                    <div class="button-img">
                        <input type="text" id="productImage" name="product_picture"  placeholder="Post image product here">
                    </div>
                    <div class="button-container">
                        <button type="submit">ADD PRODUCT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
    </div>
</body>
</html>