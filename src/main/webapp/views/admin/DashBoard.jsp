<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="icon" type="image/png" sizes="200x138" href=".././images/iconHorizon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href=".././css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/NavBarAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/ProfileAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/Dashboard.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section>
            <jsp:include page="../../layouts/admin/NavBarAdmin.jsp"></jsp:include>
            <div class="w3-main" style="margin-left:230px">
                <div>
                    <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</button>
                    <jsp:include page="../../layouts/admin/ProfileAdmin.jsp"></jsp:include>
                </div>
                
                <div class="w3-container">
                    <main class="management-layout">
                        <div class="management-top">
                            <h1 class="dashboard-title">Dashboard</h1>
                        </div>
                    </main>

                    <div class="dash-containI">
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="insights">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="insights-box sales">
                                                <div class="box-title">
                                                    <div class="icon">
                                                        <i class="uil uil-analytics"></i>
                                                    </div>
                                                    <h3>Total Account</h3>
                                                </div>

                                                <div class="middle">
                                                    <div class="left">
                                                        <h1 class="counter">1</h1>
                                                    </div>
                                                </div>
                                                <small>Last 24 Hours</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4">
                                            <div class="insights-box expenses">
                                                <div class="box-title">
                                                    <div class="icon">
                                                        <i class="uil uil-chart-bar"></i>
                                                    </div>
                                                    <h3>Total Course</h3>
                                                </div>

                                                <div class="middle">
                                                    <div class="left">
                                                        <h1 class="counter">2</h1>
                                                    </div>
                                                </div>
                                                <small>Last 14 Hours</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-4">
                                            <div class="insights-box income">
                                                <div class="box-title">
                                                    <div class="icon">
                                                        <i class="uil uil-chart-line"></i>
                                                    </div>
                                                    <h3>Total Views</h3>
                                                </div>

                                                <div class="middle">
                                                    <div class="left d-flex">
                                                        <h1>$</h1>
                                                        <h1 class="counter">35,044</h1>
                                                    </div>
                                                </div>
                                                <small>Last 24 Hours</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="dash-containII">
                                    <div class="containII-title">
                                        <h2>Recent Updates</h2>
                                    </div>

                                    <div class="table-users">
                                        <table cellspacing="0">
                                            <tr>
                                                <th>Image</th>
                                                <th>Product Name</th>
                                                <th>Product Number</th>
                                                <th>Payment</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>

                                            <tr>
                                                <td><img src="https://i.picsum.photos/id/1005/100/100.jpg" alt="" /></td>
                                                <td>C Program</td>
                                                <td>1000</td>
                                                <td>Due</td>
                                                <td>Pending</td>
                                                <td class="detail"><a href="#!">Detail</a></td>
                                            </tr>

                                            <tr>
                                                <td><img src="https://i.picsum.photos/id/1005/100/100.jpg" alt="" /></td>
                                                <td>C Program</td>
                                                <td>1000</td>
                                                <td>Due</td>
                                                <td>Pending</td>
                                                <td class="detail"><a href="#!">Detail</a></td>
                                            </tr>

                                            <tr>
                                                <td><img src="https://i.picsum.photos/id/1005/100/100.jpg" alt="" /></td>
                                                <td>C Program</td>
                                                <td>1000</td>
                                                <td>Due</td>
                                                <td>Pending</td>
                                                <td class="detail"><a href="#!">Detail</a></td>
                                            </tr>

                                            <tr>
                                                <td><img src="https://i.picsum.photos/id/1005/100/100.jpg" alt="" /></td>
                                                <td>C Program</td>
                                                <td>1000</td>
                                                <td>Due</td>
                                                <td>Pending</td>
                                                <td class="detail"><a href="#!">Detail</a></td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="show-all">
                                        <button class="btn">Show All</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 dashboard-right">
                                <div class="recent-updates">
                                    <h2>Recent Orders</h2>
                                    <div class="updates">
                                        <div class="update">
                                            <div class="profile-photo">
                                                <img src="./images/user.jpg" alt="">
                                            </div>
                                            <div class="message">
                                                <p><b>Khoa Ho</b> received his order of C Program.</p>
                                                <small>2 Minutes Ago</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="sales-analytics">
                                    <h2>Course Analytics</h2>
                                    <div class="item online">
                                        <div class="icon">
                                            <i class="uil uil-shopping-cart"></i>
                                        </div>
                                        <div class="right">
                                            <div class="info">
                                                <h3>ONLINE ORDERS</h3>
                                                <small class="text-muted">Last 24 Hours</small>
                                            </div>
                                            <h5 class="success">+39%</h5>
                                            <h3 class="view">3849</h3>
                                        </div>
                                    </div>
                                    <div class="item customers">
                                        <div class="icon">
                                            <i class="uil uil-user"></i>
                                        </div>
                                        <div class="right">
                                            <div class="info">
                                                <h3>NEW CUSTOMERS</h3>
                                                <small class="text-muted">Last 24 Hours</small>
                                            </div>
                                            <h5 class="success">+25%</h5>
                                            <h3 class="view">849</h3>
                                        </div>
                                    </div>
                                    <div class="item add-product" onclick="window.location.href='${pageContext.request.contextPath}/admin/add-product'">
                                        <div>
                                            <i class="uil uil-plus"></i>
                                            <h3>Add Product</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Counter-Up -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.js"></script>
        <script src=".././js/admin/AdminRoot.js"></script>
        <script src=".././js/admin/DashBoard.js"></script>
    </body>
</html>