<%@page import="DAO.OrderDAO"%>
<%@page import="DAO.ProductDAO"%>
<%@page import="Model.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Statistic</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 



        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
        <!-- Material Design Bootstrap Ecommerce -->
        <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
        <!-- Your custom styles (optional) -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <!--<link href="css/style.css" rel="stylesheet" type="text/css"/>--> 
        <style>
            body {
                margin: 0;
                padding: 0;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css"><style>body {
                background-color: #fbfbfb;
            }
            @media (min-width: 991.98px) {
                main {
                    padding-left: 240px;
                }
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }
            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }

            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }</style>
    </head>
    <body>

        <!--Main Navigation-->
        <header>
            <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white" style="padding: 0px">
                <div class="position-sticky">
                    <div class="list-group list-group-flush mx-3 mt-4">
                        <a href="admin" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
                            <i class="fas fa-tachometer-alt fa-fw me-3"></i><span>Main dashboard</span>
                        </a>
                        <a href="/Account/doanhThuTheoNgay" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-pie fa-fw me-3"></i><span>Danh thu thứ</span>
                        </a>
                        <a href="/Account/doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-bar fa-fw me-3"></i><span>Doanh thu tháng</span>
                        </a>
                        <a href="/Account/adminOrder?query=default" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-chart-bar fa-fw me-3"></i><span>Hóa đơn</span>
                        </a>
                        
                        
                        <a href="/Account/admin" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Quản lý sản phẩm</span>
                        </a>     
                    </div>
                </div>
            </nav>


        </header>
        <!--Main Navigation-->

        <!--Main layout-->
        <main>
            <div class="container pt-4">
                <!--Section: Statistics with subtitles-->
                <section>
                    <div class="row" id="total">
                        <div class="col-xl-6 col-md-12 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between p-md-1">
                                        <div class="d-flex flex-row">
                                            <div class="align-self-center">
                                                <i class="fas fa-pencil-alt text-info fa-3x me-4"></i>
                                            </div>
                                            <div>
                                                <h4>Total Products</h4>
                                                <p class="mb-0"></p>
                                            </div>
                                        </div>
                                        <div class="align-self-center">
                                            <%
                                                // Import necessary classes
                                            %><%@ page import="DAO.ProductDAO" %><%
                                                // Create an instance of ProductDAO
                                                ProductDAO productDAO = new ProductDAO();

                                                // Retrieve the count of all products
                                                int totalProducts = productDAO.getNumberOfRecords();
                                            %>
                                            <h2 class="h1 mb-0"><%= totalProducts%></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-12 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between p-md-1">
                                        <div class="d-flex flex-row">
                                            <div class="align-self-center">
                                                <%
                                                    // Import necessary classes
                                                %><%@ page import="DAO.ProductDAO" %><%
                                                        // Create an instance of OrderDAO
                                                        OrderDAO orderDAO = new OrderDAO();

                                                        // Retrieve the total sales (completed orders)
                                                        float totalPrice = orderDAO.calculateTotalPrice();
                                                %>
                                                <h2 class="h1 mb-0 me-4"><%= totalPrice%></h2>
                                            </div>
                                            <div>
                                                <h4>Total Sales</h4>
                                                <p class="mb-0"></p>
                                            </div>
                                        </div>
                                        <div class="align-self-center">
                                            <i class="far fa-heart text-danger fa-3x"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--Section: Statistics with subtitles-->
            </div>
        </main>
    </body>
</html>