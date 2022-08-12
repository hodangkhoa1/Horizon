<%-- 
    Document   : FAQPage
    Created on : Mar 10, 2022, 11:12:03 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FAQPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body onload="loadFileJson('${pageContext.request.contextPath}')">
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <div class="faq-body">
            <main class="faq-wrapper">
                <div class="image__wrapper" style="background-image: url('./images/bg-pattern-desktop.svg')">
                    <div class="image__wrapper-inner">
                        <img src="./images/Questions.svg" alt="image">
                    </div>
                    <img src="./images/illustration-box-desktop.svg" alt="image" class="image__wrapper-box">
                </div>
                <div class="accordion__wrapper">
                    <h1 class="title__accordion">FAQ</h1>
                    <div class="questions__accordions"></div>
                </div>
            </main>
        </div>
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>

        <!-- BOOTSTRAP 5 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <!-- JQUERY -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
        <!-- FAQPage -->
        <script src="./js/user/FAQPage.js"></script>
    </body>
</html>
