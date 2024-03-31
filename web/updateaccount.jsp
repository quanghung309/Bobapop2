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
                <li><a href="">CONTACT</a></li>
            </ul>
            <div class="search">
                <i style="color: white;" class="fa fa-search"></i>
                 <a style="color: white;" href=${empty sessionScope.account.full_name ? '/Account/loginsignup' : '#'}>${empty sessionScope.account.full_name ? "Đăng Nhập" : sessionScope.account.full_name }</a>
                 <a href=${empty sessionScope.account.full_name ? '' : '/Account/logout'}>${empty sessionScope.account.full_name ? " " : "Thoát" }</a>
                <i class="fa fa-shopping-bag fa-2x"></i>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="content-item">
            <div class="form-login">
                <h5>Update Account</h5>
                <form action="updateaccount" method="post">
                    <input type="hidden" name="account_id" value="${account.account_id}" />
                    <input type="text" name="full_name" placeholder="Update Name" value="${account.full_name}" /> <br />
                    <input type="text" name="email" placeholder="Update Email" value="${account.email}" disabled /> <br />
                    <input type="password" name="password" placeholder="Update Password" value="${account.password}" /> <br />
                    <input type="text" name="phone" placeholder="Update Phone" value="${account.phone}" /> <br />
                    <input type="text" name="address" placeholder="Update Address" value="${account.address}"  /> <br />
                    <input type="hidden" name="address" placeholder="Update Address" value="${account.role}"  /> <br />
                    <div class="button-container">
                        <button type="submit">UPDATE ACCOUNT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
    </div>
</body>
</html>