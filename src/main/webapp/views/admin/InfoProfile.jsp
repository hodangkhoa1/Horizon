<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile | ${sessionScope.LOGIN_ADMIN.userName}</title>
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href=".././images/iconHorizon.png">
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONTAWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UNICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- Box Icons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- w3schools -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- CSS -->
        <link href=".././css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/NavBarAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/ProfileAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/InfoProfile.css" rel="stylesheet" type="text/css"/>
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
                        <div class="container" style="padding-top: 15px;">
                            <div class="row">
                                <div class="col-sm-12 col-sm-offset-2">
                                    <div class="panel panel-white profile-widget">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="image-container bg2">
                                                    <c:if test="${sessionScope.LOGIN_ADMIN.imageAvatar != null}">
                                                        <img src="data:image/png;base64,${sessionScope.LOGIN_ADMIN.imageAvatar}" class="avatar" alt="${sessionScope.LOGIN_ADMIN.userName}">
                                                    </c:if>
                                                    <c:if test="${sessionScope.LOGIN_ADMIN.imageAvatar == null}">
                                                        <div class="avatar-photo" style="background: ${sessionScope.LOGIN_ADMIN.colorAvatar}">
                                                            <p>${sessionScope.LOGIN_ADMIN.defaultAvatar.toUpperCase()}</p>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="details">
                                                    <h4>${sessionScope.LOGIN_ADMIN.userName}</h4>
                                                    <div>${sessionScope.LOGIN_ADMIN.email}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-5">
                                            <div class="panel panel-white border-top-light-blue ps-4">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">My Plan</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="body-section">
                                                        <h5 class="section-heading">Current Plan: Basic Plan</h5>
                                                        <p>Your next charge is $100 due May 12, 2014</p>
                                                        <ul>
                                                            <li>400 Orders/Month</li>
                                                            <li>10 GB storage</li>
                                                            <li>5 Users</li>
                                                            <li>Mobile App Access</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="panel panel-white border-top-green ps-4">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">User Info</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="body-section">
                                                        <div class="row me-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">User Name</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <input type="text" class="form-control" value="${sessionScope.LOGIN_ADMIN.userName}" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="body-section">
                                                        <div class="row me-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">Email</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <input type="text" class="form-control" value="${sessionScope.LOGIN_ADMIN.email}" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="body-section">
                                                        <div class="row me-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">Sex</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <c:choose>
                                                                    <c:when test = "${sessionScope.LOGIN_ADMIN.sex.equals('M')}">
                                                                       <input type="text" class="form-control" value="Male" disabled>
                                                                    </c:when>

                                                                    <c:when test = "${sessionScope.LOGIN_ADMIN.sex.equals('F')}">
                                                                        <input type="text" class="form-control" value="Female" disabled>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" class="form-control" value="" disabled>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="body-section">
                                                        <div class="row me-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">Date Of Birth</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <input type="text" class="form-control" value="<fmt:formatDate value="${sessionScope.LOGIN_ADMIN.dateOfBirth}" pattern="yyyy-MM-dd"/>" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="body-section">
                                                        <div class="row me-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">Phone Number</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <input type="text" class="form-control" value="${sessionScope.LOGIN_ADMIN.phoneNumber}" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="body-section">
                                                        <div class="row me-3">
                                                            <div class="col-sm-3">
                                                                <h6 class="mb-0">Address</h6>
                                                            </div>
                                                            <div class="col-sm-9 text-secondary">
                                                                <input type="text" class="form-control" value="${sessionScope.LOGIN_ADMIN.userAddress}" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="body-section body-button">
                                                        <a href="${pageContext.request.contextPath}/admin/edit-profile" class="btn btn-green edit-button">Edit</a>
                                                    </div>
                                                </div>
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
        <script src=".././js/admin/AdminRoot.js"></script>
        <script>
            activeSidebarLink();
        </script>
    </body>
</html>
