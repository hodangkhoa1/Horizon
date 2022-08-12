<%@page import="com.team.horizon.models.AccountError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AccountError accountError = (AccountError) request.getAttribute("CHANGE_PASSWORD_ERROR");
    if(accountError == null) {
        accountError = new AccountError();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password | ${sessionScope.LOGIN_USER.userName}</title>
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- Box Icons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FormEdit.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="setting-body" style="padding: 82px 0;">
                    <div class="setting-header">
                        <h2 class="setting-header_title">Change Password</h2>
                    </div>
                    <div class="setting-form">
                        <form action="${pageContext.request.contextPath}/change-password" method="POST">
                            <div>
                                <div class="row">
                                    <div class="col-7">
                                        <div class="setting-form_content">
                                            <label for="old-password" class="setting-form_label">Old Password</label>
                                            <div class="setting-form_input">
                                                <input oninput="CheckOldPassword()" onblur="CheckOldPassword()" onkeyup="OldPasswordKeyUp()" type="password" name="oldPassword" id="old-password">
                                                <span class="showBtn" id="show-old-password">
                                                    <i class="fas fa-eye-slash" id="show-old-password-icon"></i>
                                                </span>
                                                <i class='bx bx-check-circle' id="old-password-icon-check"></i>
                                                <i class='bx bx-error-circle' id="old-password-icon-error"></i>
                                            </div>
                                            <div class="message">
                                                <span class="error-message" id="old-password-error"><%=accountError.getPasswordError()%></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="setting-form_content">
                                            <label for="new-password" class="setting-form_label">New Password</label>
                                            <div class="setting-form_input">
                                                <input oninput="CheckNewPassword()" onblur="CheckNewPassword()" onkeyup="CheckPasswordStrength()" type="password" name="newPassword" id="new-password">
                                                <span class="showBtn" id="show-new-password">
                                                    <i class="fas fa-eye-slash" id="show-new-password-icon"></i>
                                                </span>
                                                <i class='bx bx-check-circle' id="new-password-icon-check"></i>
                                                <i class='bx bx-error-circle' id="new-password-icon-error"></i>
                                            </div>
                                            <div class="indicator">
                                                <span class="weak"></span>
                                                <span class="medium"></span>
                                                <span class="strong"></span>
                                            </div>
                                            <div class="error-text"></div>
                                            <div class="message">
                                                <div class="error-message" id="new-password-error"><%=accountError.getNewPasswordError()%></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="setting-form_content">
                                            <label for="confirm-password" class="setting-form_label">Confirm Password</label>
                                            <div class="setting-form_input">
                                                <input oninput="CheckConfirmPassword()" onblur="CheckConfirmPassword()" onkeyup="ConfirmPasswordKeyUp()" type="password" name="confirmPassword" id="confirm-password">
                                                <span class="showBtn" id="show-confirm-password">
                                                    <i class="fas fa-eye-slash" id="show-confirm-password-icon"></i>
                                                </span>
                                                <i class='bx bx-check-circle' id="confirm-password-icon-check"></i>
                                                <i class='bx bx-error-circle' id="confirm-password-icon-error"></i>
                                            </div>
                                            <div class="message">
                                                <span class="error-message" id="confirm-password-error"><%=accountError.getConfirmPasswordError()%></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <div class="setting-form_button">
                                            <button type="submit" class="setting-form_save">Change</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="setting-backgound">
                        <lottie-player src="https://assets9.lottiefiles.com/packages/lf20_msdmfngy.json" background="transparent" speed="1" loop autoplay class="setting-image"></lottie-player>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>
        
        <!-- BOOTSTRAP 5 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <!-- Lottie Files -->
        <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
        <!-- JQUERY -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
        <!-- Change Password -->
        <script src="./js/user/ChangePassword.js"></script>
    </body>
</html>
