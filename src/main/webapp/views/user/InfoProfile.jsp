<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile | ${sessionScope.LOGIN_USER.userName}</title>
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONTAWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- Box Icons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/InfoProfile.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <div class="container">
            <div class="main-body">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <c:if test="${sessionScope.LOGIN_USER.imageAvatar != null}">
                                        <img src="data:image/png;base64,${sessionScope.LOGIN_USER.imageAvatar}" alt="${sessionScope.LOGIN_USER.userName}" class="rounded-circle p-1 bg-primary" width="110">
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER.imageAvatar == null}">
                                        <div class="avatar-photo" style="background: ${sessionScope.LOGIN_USER.colorAvatar}">
                                            <p>${sessionScope.LOGIN_USER.defaultAvatar.toUpperCase()}</p>
                                        </div>
                                    </c:if>
                                    <div class="mt-3">
                                        <h4>${sessionScope.LOGIN_USER.userName}</h4>
                                        <p class="text-muted font-size-sm">${sessionScope.LOGIN_USER.userAddress}</p>
                                        <button onclick="confirmDeleteAccount('${pageContext.request.contextPath}/info-profile', '${sessionScope.LOGIN_USER.email}')" class="btn btn-danger">Delete Account</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">User Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="${sessionScope.LOGIN_USER.userName}" disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="${sessionScope.LOGIN_USER.email}" disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Sex</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <c:choose>
                                            <c:when test = "${sessionScope.LOGIN_USER.sex.equals('M')}">
                                               <input type="text" class="form-control" value="Male" disabled>
                                            </c:when>
                                               
                                            <c:when test = "${sessionScope.LOGIN_USER.sex.equals('F')}">
                                                <input type="text" class="form-control" value="Female" disabled>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" value="" disabled>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Date Of Birth</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="<fmt:formatDate value="${sessionScope.LOGIN_USER.dateOfBirth}" pattern="dd-MM-yyyy"/>" disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Phone Number</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="${sessionScope.LOGIN_USER.phoneNumber}" disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="${sessionScope.LOGIN_USER.userAddress}" disabled>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Date Created</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="<fmt:formatDate value="${sessionScope.LOGIN_USER.accountCreated}" pattern="dd-MM-yyyy"/>" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>
        <!-- BOOTSTRAP 5 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
        <!-- JQUERY -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Sweet Alert -->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Info Profile -->
        <script src="./js/user/InfoProfile.js"></script>
    </body>
</html>
