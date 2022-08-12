<%-- 
    Document   : EditProfile
    Created on : Mar 20, 2022, 4:04:06 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Profile ${sessionScope.LOGIN_ADMIN != null ? "| ".concat(sessionScope.LOGIN_ADMIN.userName) : ""}</title>
        <link rel="icon" type="image/png" sizes="200x138" href=".././images/iconHorizon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&family=Raleway:wght@100;200&display=swap" rel="stylesheet">
        <link href=".././css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/UploadImagePopup.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/NavBarAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/ProfileAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/EditProfile.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/UploadImagePopup.html"></jsp:include>
        <section>
            <jsp:include page="../../layouts/admin/NavBarAdmin.jsp"></jsp:include>
            <div class="w3-main" style="margin-left:230px">
                <div>
                    <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</button>
                    <jsp:include page="../../layouts/admin/ProfileAdmin.jsp"></jsp:include>
                </div>
                
                <div class="w3-container">
                    <div class="container rounded bg-white mb-5">
                        <div class="row">
                            <form action="${pageContext.request.contextPath}/admin/edit-profile" method="post" id="formProfile">
                                <div class="col-md-12 border-right mt-5">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <div class="navbar-brand avatar-size">
                                            <div class="profile">
                                                <c:if test="${sessionScope.LOGIN_ADMIN.imageAvatar != null}">
                                                    <img class="rounded-pill" src="data:image/png;base64,${sessionScope.LOGIN_ADMIN.imageAvatar}">
                                                </c:if>
                                                <c:if test="${sessionScope.LOGIN_ADMIN.imageAvatar == null}">
                                                    <div class="profile-circle" style="background: ${sessionScope.LOGIN_ADMIN.colorAvatar};">
                                                        <p>${sessionScope.LOGIN_ADMIN.defaultAvatar.toUpperCase()}</p>
                                                    </div>
                                                </c:if>
                                                <div class="overlay">
                                                    <i class="fas fa-camera"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <span class="font-weight-bold font-size">${sessionScope.LOGIN_ADMIN.userName}</span>
                                        <span class="text-black-50 font-size">${sessionScope.LOGIN_ADMIN.email}</span>
                                    </div>
                                </div>
                                <div class="col-md-12 border-right mt-5">
                                    <div class="padding">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Profile Settings</h4>
                                        </div>
                                        <div class="row mt-2 pb-5">
                                            <div class="mb-3">
                                                <label for="username">Username</label>
                                                <input type="text" name="username" class="form-control" id="username" placeholder="Username" value="${USERNAME != null ? USERNAME : sessionScope.LOGIN_ADMIN.userName}" required="">
                                                <div class="invalid-feedback username d-none">Please enter your username!</div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email">Email</label>
                                                <input type="email" name="email" class="form-control" id="email" value="${sessionScope.LOGIN_ADMIN.email}" readonly>
                                            </div>
                                            <div class="mb-3">
                                                <div class="setting-form_content">
                                                    <p class="title">Sex</p>
                                                    <div class="radio-box">
                                                        <label class="radio-container">Male
                                                            <input type="radio" checked name="userSex" value="Male">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                        <label class="radio-container">Female
                                                            <input type="radio" name="userSex" value="Female">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dateOfBirth">Date Of Birth</label>
                                                <input type="date" name="dateOfBirth" class="form-control" id="dateOfBirth" required="">
                                            </div>
                                            <div class="mb-3">
                                                <label for="phoneNumber">Phone Number</label>
                                                <input type="text" name="phoneNumber" class="form-control" id="phoneNumber" placeholder="Phone Number" value="${PHONE_NUMBER != null ? PHONE_NUMBER : sessionScope.LOGIN_ADMIN.phoneNumber}" required="">
                                                <div class="invalid-feedback phoneNumber d-none">Please enter phone number!</div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="address">Address</label>
                                                <input type="text" name="address" class="form-control" id="address" placeholder="Address" value="${ADDRESS != null ? ADDRESS : sessionScope.LOGIN_ADMIN.userAddress}" required="">
                                                <div class="invalid-feedback address d-none">Please enter address!</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="button success profile-button">Save Profile</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
        <script src=".././js/admin/AdminRoot.js"></script>
        <script src=".././js/admin/UploadAvatarPopup.js"></script>
        <script src=".././js/admin/EditProfile.js"></script>
        <script>
            activeSidebarLink();
        </script>
    </body>
</html>
