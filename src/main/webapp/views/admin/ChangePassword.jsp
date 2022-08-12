<%-- 
    Document   : ChangePassword
    Created on : Mar 21, 2022, 10:16:39 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password ${sessionScope.LOGIN_ADMIN != null ? "| ".concat(sessionScope.LOGIN_ADMIN.userName) : ""}</title>
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
        <link href=".././css/admin/ChangePassword.css" rel="stylesheet" type="text/css"/>
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
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card login-form">
                                    <div class="card-body">
                                        <h1 class="card-title text-center pt-5"><b>Change password</b></h1>
                                        <div class="card-text">
                                            <form action="${pageContext.request.contextPath}/admin/change-password" method="post" id="formChangePassword">
<!--                                                <div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
                                                    The current password is incorrect. Please try again
                                                    <a class="close" href="#">
                                                        <span aria-hidden="true">&times;</span>
                                                    </a>
                                                </div>
                                                <div class="alert alert-danger alert-dismissible fade show unmatch-password d-none" role="alert">
                                                    Password incorrect. Please try again
                                                    <a class="close close-unmatch" href="#">
                                                        <span aria-hidden="true">&times;</span>
                                                    </a>
                                                </div>-->
                                                <div class="form-group">
                                                    <label for="currentpassword">Current Password</label>
                                                    <input type="password" name="currentpassword" class="form-control form-control-sm" id="current-password">
                                                    <div class="invalid-feedback d-none">
                                                        Please enter your current password!
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="newpassword">New Password</label>
                                                    <input type="password" name="newpassword" class="form-control new-password form-control-sm" id="new-password">
                                                    <div class="invalid-feedback d-none">
                                                        Please enter your new password!
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="repeatnewpassword">Confirm Password</label>
                                                    <input type="password" name="repeatnewpassword" class="form-control new-password form-control-sm" id="repeat-new-password">
                                                    <div class="invalid-feedback d-none">
                                                        Please enter your confirm password!
                                                    </div>
                                                </div>
                                                <div class="" id="position">
                                                    <button type="submit" class="btn btn-primary btn-block button password-button">Change</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_huqty7bz.json" background="transparent" speed="1" loop autoplay class="setting-password"></lottie-player>
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
        <!-- Lottie Files -->
        <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
        <script src=".././js/admin/AdminRoot.js"></script>
        <script src=".././js/admin/ChangePassword.js"></script>
        <script>
            activeSidebarLink();
        </script>
    </body>
</html>
