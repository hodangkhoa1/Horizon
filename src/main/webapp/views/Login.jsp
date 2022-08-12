<%@page import="com.team.horizon.models.AccountError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AccountError accountError = (AccountError) request.getAttribute("LOGIN_ACCOUNT_ERROR");
    AccountError signupAccountError = (AccountError) request.getAttribute("SIGN_UP_ACCOUNT_ERROR");
    
    if (accountError == null) {
        accountError = new AccountError();
    }
    
    if(signupAccountError == null) {
        signupAccountError = new AccountError();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Horizon</title>
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="./css/Login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="preloader">
            <div class="preloader-image"></div>
        </div>
        <div class="body_container">
            <div class="forms_container">
                <div class="signin_signup">
                    <!-- Form Login -->
                    <form action="${pageContext.request.contextPath}/login" method="POST" class="sign_in_form">
                        <h2 class="title">Sign in</h2>
                        <div class="input_field" id="signinUsernameField">
                            <i class='bx bx-user'></i>
                            <input type="email" placeholder="Email" id="signinUsername" name="signinUsername" value="${USERNAME != null ? USERNAME : ""}">
                            <i class='bx bx-check-circle signin_username_icon_check'></i>
                            <i class='bx bx-error-circle signin_username_icon_error'></i>
                        </div>
                        <div class="message">
                            <span class="error_message" id="username_error_signin"><%=accountError.getUsernameError()%></span>
                        </div>
                        <div class="input_field" id="signinPasswordField">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" placeholder="Password" id="signinPassword" name="signinPassword">
                            <i class='bx bx-check-circle signin_password_icon_check'></i>
                            <i class='bx bx-error-circle signin_password_icon_error'></i>
                        </div>
                        <div class="message">
                            <span class="error_message" id="password_error_signin"><%=accountError.getPasswordError()%></span>
                        </div>
                        <div class="login-options">
                            <div class="remember-me">
                                <input type="checkbox" id="rememberMe" name="rememberMe" value="Y">
                                <label for="rememberMe">Remember me</label>
                            </div>
                            <div class="forgot_field">
                                <a href="${pageContext.request.contextPath}/forgot-password">Forgot password</a>
                            </div>
                        </div>
                        <input type="submit" value="Login" class="btn solid" name="Login">

                        <p class="social_text">Or Sign up with social platforms</p>
                        <div class="social_media">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/Horizon/login-google&response_type=code&client_id=636259858750-9k9sn13vat21svptl6ov9ugcb3n42s3f.apps.googleusercontent.com&approval_prompt=force" class="social_icon">
                                <i class='bx bxl-google'></i>
                            </a>
                            <a href="" class="social_icon">
                                <i class='bx bxl-facebook'></i>
                            </a>
                            <a href="" class="social_icon">
                                <i class='bx bxl-twitter'></i>
                            </a>
                        </div>
                    </form>
                    <!-- Form Sign Up -->
                    <form action="${pageContext.request.contextPath}/register" method="POST" class="sign_up_form">
                        <h2 class="title">Sign up</h2>
                        <div class="input_field" id="signupUsernameField">
                            <i class='bx bx-user'></i>
                            <input type="text" placeholder="Username" id="signupUsername" name="signupUsername" value="${USERNAME_REGISTER != null ? USERNAME_REGISTER : ""}">
                            <i class='bx bx-check-circle signup_username_icon_check'></i>
                            <i class='bx bx-error-circle signup_username_icon_error'></i>
                        </div>
                        <div class="message">
                            <span class="error_message" id="username_error_signup"><%=signupAccountError.getUsernameError()%></span>
                        </div>
                        <div class="input_field" id="signupEmailField">
                            <i class='bx bx-envelope'></i>
                            <input type="text" placeholder="Email" id="signupEmail" name="signupEmail" value="${EMAIL_REGISTER != null ? EMAIL_REGISTER : ""}">
                            <i class='bx bx-check-circle signup_email_icon_check'></i>
                            <i class='bx bx-error-circle signup_email_icon_error'></i>
                        </div>
                        <div class="message">
                            <span class="error_message" id="email_error_signup"><%=signupAccountError.getEmailError()%></span>
                        </div>
                        <div class="input_field" id="signupPasswordField">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" placeholder="Password" id="signupPassword" name="signupPassword">
                            <i class='bx bx-check-circle signup_password_icon_check'></i>
                            <i class='bx bx-error-circle signup_password_icon_error'></i>
                        </div>
                        <div class="message">
                            <span class="error_message" id="password_error_signup"><%=signupAccountError.getPasswordError()%></span>
                        </div>
                        <div class="input_field" id="confirmPasswordField">
                            <i class='bx bx-lock-alt'></i>
                            <input type="password" placeholder="Confirm Password" id="confirmPassword" name="confirmPassword">
                            <i class='bx bx-check-circle confirm_password_icon_check'></i>
                            <i class='bx bx-error-circle confirm_password_icon_error'></i>
                        </div>
                        <div class="message">
                            <span class="error_message" id="confirm_password_error_signup"><%=signupAccountError.getConfirmPasswordError()%></span>
                        </div>

                        <input type="submit" value="SignUp" class="btn solid">

                        <p class="social_text">Or Sign in with social platforms</p>
                        <div class="social_media">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8080/Horizon/login-google&response_type=code&client_id=636259858750-9k9sn13vat21svptl6ov9ugcb3n42s3f.apps.googleusercontent.com&approval_prompt=force" class="social_icon">
                                <i class='bx bxl-google'></i>
                            </a>
                            <a href="" class="social_icon">
                                <i class='bx bxl-facebook'></i>
                            </a>
                            <a href="" class="social_icon">
                                <i class='bx bxl-twitter' ></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panels_container">
                <div class="panel left_panel">
                    <div class="content">
                        <h3>Do not have an account ?</h3>
                        <p>
                            Horizon is the leading website selling computer components in Vietnam. Quickly create an account and let's explore Horizon!
                        </p>
                        <button class="btn transparent" id="sign_up_btn">Sign up</button>
                    </div>
                    <img src="./images/undraw_maker_launch_crhe.svg" class="image" alt="">
                </div>

                <div class="panel right_panel">
                    <div class="content">
                        <h3>Already have an account ?</h3>
                        <p>
                            Sign in and shopping with Horizon! Let's Go!
                        </p>
                        <button class="btn transparent" id="sign_in_btn">Sign in</button>
                    </div>
                    <img src="./images/undraw_winter_designer_a2m7.svg" class="image" alt="">
                </div>
            </div>
        </div>

        <script src="./js/Login.js"></script>
    </body>
</html>
