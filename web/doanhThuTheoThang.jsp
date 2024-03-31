<%-- 
    Document   : doanhThuTheoThang
    Created on : Mar 11, 2024, 12:43:16 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha384-yBmXoFPVbdPqEU3c/i7yzp5Fv3cX4IPz5zI5gxe2OKCI1V5km2IbYL+ISg5IF5PF" crossorigin="anonymous">
        <link rel="stylesheet" href="./Style.css">
        <style>
            /* Add your custom styles here */
        </style>
    </head>

    <body>
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
                        <a href="hoaDon" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-file-invoice-dollar fa-fw me-3"></i><span>Hóa Đơn</span>
                        </a>
                        <a href="/Account/admin" class="list-group-item list-group-item-action py-2 ripple">
                            <i class="fas fa-shoe-prints fa-fw me-3"></i><span>Quản lý sản phẩm</span>
                        </a>
                    </div>
                </div>
            </nav>
        </header>
        <main>
            <div class="container pt-4">
                <!-- Section: Main chart 2 -->
                <section class="mb-4" id="doanhThuThang">
                    <div class="card">
                        <div class="card-header py-3">
                            <h5 class="mb-0 text-center"><strong>Doanh thu theo tháng</strong></h5>
                        </div>
                        <div class="card-body">
                            <canvas id="verticalBar"></canvas>
                        </div>
                    </div>
                </section>
                <!-- Section: Main chart 2 -->
            </div>
        </main>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--Main layout-->
        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <!-- MDB Ecommerce JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
        <script src="https://mdbootstrap.com/api/snippets/static/download/MDB5-Free_3.8.1/js/mdb.min.js"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>

        <script>// Graph
            //Vertical Bar Chart
            new Chart(document.getElementById("verticalBar"), {
                "type": "bar",
                "data": {
                    "labels": ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                    "datasets": [{
                            "label": "Doanh thu $",
                            "data": [${totalMoneyMonth1}, ${totalMoneyMonth2}, ${totalMoneyMonth3}, ${totalMoneyMonth4}, ${totalMoneyMonth5}, ${totalMoneyMonth6}, ${totalMoneyMonth7}, ${totalMoneyMonth8}, ${totalMoneyMonth9}, ${totalMoneyMonth10}, ${totalMoneyMonth11}, ${totalMoneyMonth12}],
                            "fill": false,
                            "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
                                "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "#99FF99", "#FFFF99", "#FFC1C1", "#FFB5C5", "#DDC488"
                            ],
                            "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                                "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)", "	#66FF99", "#FFFF66", "#EEB4B4", "#EEA9B8", "#ECAB53"
                            ],
                            "borderWidth": 1
                        }]
                },
                "options": {
                    "scales": {
                        "yAxes": [{
                                "ticks": {
                                    "beginAtZero": true
                                }
                            }]
                    }
                }
            });
        </script>
        <script type="text/javascript" src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>