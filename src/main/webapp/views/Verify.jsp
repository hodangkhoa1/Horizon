<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify Account</title>
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/Verify.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="root">
            <div>
                <div class="container-fluid root-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="verify-body">
                                <table class="verify-table">
                                    <!-- LOGO -->
                                    <tr>
                                        <td class="verify-table_header">
                                            <table>
                                                <tr>
                                                    <td class="verify-table_background"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="verify-table_welcome">
                                            <table class="verify-welcome_content">
                                                <tr>
                                                    <td>
                                                        <h1 class="verify-content_header">Welcome!</h1>
                                                        <div class="verify-content_body">
                                                            <lottie-player src="https://assets10.lottiefiles.com/packages/lf20_c1hkermx.json" background="transparent" speed="1" loop autoplay class="verify-content_image"></lottie-player>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="verify-table_info">
                                            <table>
                                                <tr>
                                                    <td class="verify-info-start">
                                                        <p>Hey ${sessionScope.LOGIN_USER.userName},</p>
                                                        <p>We're excited to have you get started. First, you need to confirm your account, we have sent you a letter.</p>
                                                        <p>If you have any questions, just reply to this email—we're always happy to help out.</p>
                                                        <p>Cheers,<br>Horizon Team</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="verify-table_button">
                                                        <table>
                                                            <tr>
                                                                <td class="verify-button_home">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="verify-button_content">
                                                                                <a href="${pageContext.request.contextPath}/login">Back To Login</a>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            console.log("%cHello! \ud83d\ude4b", "color: #29c4a9;font-size: 16px;font-weight: 600;"),
            console.log("%cHorizon front-end was built with HTML, CSS, and lots of love. \n\nHorizon back-end was built with SQL Server, and lots of love. \n\n\ud83d\udc49 Want to learn with us? Check out ".concat(window.location.origin, "/Horizon/home"), "color: #29c4a9;font-size: 14px;");
        </script>
    </body>
</html>