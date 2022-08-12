<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <!-- Link SLICK -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
        <!-- Intro -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/intro.js@3.2.1/introjs.min.css"/>
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/Home.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
            <!------------- HOME CAROUSEL ----------------->
            <section class="home-carousel" data-ride="carousel">
                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff; width: 100%;"
                     class="swiper mySwiper">
                    <div class="parallax-bg" data-swiper-parallax="-23%"></div>
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"
                             style=" background-image: url(./images/272988472_640192540601058_5181364379192242646_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/273906577_1430736460656845_6973013086386929041_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/274765291_616448899433183_9107773915506726319_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/248502846_526261932139859_2431977394741947440_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/274647612_1347699032407831_6284953522811310623_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/274243033_968136084090566_7495436919998526676_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/274331071_319460326884070_633236633994179702_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/274194960_3649506758507310_2125240684733507883_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>

                        <div class="swiper-slide"
                             style=" background-image: url(./images/274260822_396173265604063_420981739062930825_n.png); background-position: center; background-repeat: no-repeat; background-size: cover;">
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </section>
            <!------------- END HOME CAROUSEL ------------->

            <!------------- FEATURES ---------------------->
            <section class="fearures"
                     style="background-image: url(./images/bg2.png); background-repeat: no-repeat; background-position: bottom; background-size: cover;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 story">
                            <div class="fearures--title">
                                <h6>Our Features</h6>
                                <h2>Behind The Story Of Horizon Agency</h2>
                            </div>
                            <div class="fearures__content">
                                <a href="#">
                                    <i class="far fa-lightbulb"></i>
                                </a>
                                <div class="fearures__item">
                                    <h4>Idea & Analysis Gathering</h4>
                                    <p>Maecenas laoreet efficitur sagittis. Aliquam eleifend nisl leo, sit amet consequat augue.
                                    </p>
                                </div>
                            </div>
                            <div class="fearures__content active">
                                <a href="#">
                                    <i class="fa fa-laptop-code"></i>
                                </a>
                                <div class="fearures__item">
                                    <h4>Design & Developing</h4>
                                    <p>Maecenas laoreet efficitur sagittis. Aliquam eleifend nisl leo, sit amet consequat augue.
                                    </p>
                                </div>
                            </div>
                            <div class="fearures__content">
                                <a href="#">
                                    <i class="fa fa-rocket"></i>
                                </a>
                                <div class="fearures__item">
                                    <h4>Testing & Lunching</h4>
                                    <p>Maecenas laoreet efficitur sagittis. Aliquam eleifend nisl leo, sit amet consequat augue.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 overlay">
                            <img src="./images/pic3.png" alt="">
                        </div>
                    </div>
                </div>
            </section>
            <!------------- END FEATURES ------------------>

            <!------------- CAROUSEL PRODUCT ----------------->
            <section class="container carousel-product mb-5">
                <div class="product">
                    <div class="product-brand">
                        <div class="product-brand-name">
                            <h3>Products - FREE SHIPPING NATIONWIDE</h3>
                        </div>

                        <div class="product-link">
                            <a href="${pageContext.request.contextPath}/product">Show more</a>
                            <i class="fas fa-angle-right"></i>
                        </div>
                    </div>

                    <div class="filtering">
                        <c:forEach items="${CAROUSEL_PRODUCT}" var="product">
                            <div>
                                <div class="card" style="width: 18rem;">
                                    <a href="${pageContext.request.contextPath}/detail?product=${product.productId}">
                                        <img src="data:image/png;base64,${product.imageProduct}" class="card-img-top" alt="${product.productName}">
                                        <div class="card-body">
                                            <div class="cart-content">
                                                <h5 class="card-title">${product.productName}</h5>
                                                <c:if test="${product.productDiscount != ''}">
                                                    <p class="card-text"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VND" /></p>
                                                    <h4 class="cart-price"><fmt:formatNumber value="${product.productPrice * ((100 - product.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                </c:if>
                                                <c:if test="${product.productDiscount == ''}">
                                                    <h4 class="cart-price"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VND" /></h4>
                                                </c:if>
                                                <a href="${pageContext.request.contextPath}/detail?product=${product.productId}" class="btn btn-dark see-btn">See more</a>
                                            </div>

                                            <c:if test="${product.productDiscount != ''}">
                                                <div class="cart-discount" id="hexagon">
                                                    <div class="number">
                                                        <span class="big">${product.productDiscount} <span class="up">%</span></span>
                                                    </div>
                                                    <p>OFF</p>
                                                </div>

                                                <div id="rectangle">
                                                    <span class="sale">up to</span>
                                                </div>
                                            </c:if>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!------------- END CAROUSEL PRODUCT ------------->
            
            <!------------- CATEGORY ----------------->
            <section class="container category-product mt-5">
                <div class="category">
                    <div class="category-head product-brand">
                        <div class="product-brand-name">
                            <h3>LAPTOP - FREE SHIPPING</h3>
                        </div>

                        <div class="product-link">
                            <a href="${pageContext.request.contextPath}/product">Show more</a>
                            <i class="fas fa-angle-right"></i>
                        </div>
                    </div>

                    <div class="category-item">
                        <div class="row">
                            <c:forEach items="${CATEGORY_PRODUCT}" var="product">
                                <div class="col-12 col-md-4 col-lg-3 mt-3 d-flex justify-content-center">
                                    <div class="card" style="width: 18rem;">
                                        <a href="${pageContext.request.contextPath}/detail?product=${product.productId}">
                                            <img src="data:image/png;base64,${product.imageProduct}" class="card-img-top" alt="${product.productName}">
                                            <div class="card-body">
                                                <div class="cart-content">
                                                    <h5 class="card-title">${product.productName}</h5>
                                                    <c:if test="${product.productDiscount != ''}">
                                                        <p class="card-text"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VND" /></p>
                                                        <h4 class="cart-price"><fmt:formatNumber value="${product.productPrice * ((100 - product.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                    </c:if>
                                                    <c:if test="${product.productDiscount == ''}">
                                                        <h4 class="cart-price"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VND" /></h4>
                                                    </c:if>
                                                    <a href="${pageContext.request.contextPath}/detail?product=${product.productId}" class="btn btn-dark see-btn">See more</a>
                                                </div>

                                                <c:if test="${product.productDiscount != ''}">
                                                    <div class="cart-discount" id="hexagon">
                                                        <div class="number">
                                                            <span class="big">${product.productDiscount} <span class="up">%</span></span>
                                                        </div>
                                                        <p>OFF</p>
                                                    </div>

                                                    <div id="rectangle">
                                                        <span class="sale">up to</span>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${CURRENT_PAGE > 1}">
                                <div class="table-pagination mt-4">
                                    <ul>
                                        <c:if test="${CURRENT_PAGE > 1}">
                                            <li class="pagination-button button-prev">
                                                <a href="${pageContext.request.contextPath}/home?page=${CURRENT_PAGE - 1}">
                                                    <i class="fas fa-angle-left"></i> Prev
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${END_PAGE}" var="i">
                                            <li class="pagination-number ${CURRENT_PAGE == i ? "active" : ""}">
                                                <a href="${pageContext.request.contextPath}/home?page=${i}" class="pagination-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${CURRENT_PAGE < END_PAGE}">
                                            <li class="pagination-button button-next">
                                                <a href="${pageContext.request.contextPath}/home?page=${CURRENT_PAGE + 1}">
                                                    Next <i class="fas fa-angle-right"></i>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>
            </section>
            <!------------- END CATEGORY ------------->
            
            <!------------- PROMOTION ------------->
            <section class="container promotion mt-5">
                <div class="promotion-content">
                    <div class="row">
                        <div class="promotion-left col-3">
                            <img src="./images/dh.png" alt="" style="width: 106%;">
                        </div>

                        <div class="promotion-right col-9">
                            <div class="tab">
                                <button class="tablinks" onclick="openCity(event, 'SmartWatch')" id="defaultOpen">Smart Watch</button>
                                <button class="tablinks" onclick="openCity(event, 'ModuleWifi')">Module Wifi</button>
                                <button class="tablinks" onclick="openCity(event, 'Webcam')">Webcam</button>
                                <button class="tablinks" onclick="openCity(event, 'RadiatorBase')">Radiator Base</button>
                                <button class="tablinks" onclick="openCity(event, 'GamingConsole')">Gaming Console</button>
                            </div>

                            <div id="SmartWatch" class="tabcontent">
                                <div class="center">
                                    <c:forEach items="${SMART_WATCH}" var="SmartWatch">
                                        <a href="${pageContext.request.contextPath}/detail?product=${SmartWatch.productId}">
                                            <div class="promotion-card">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="data:image/png;base64,${SmartWatch.imageProduct}" class="card-img-top" alt="${SmartWatch.productName}">

                                                    <div class="card-body">
                                                        <div class="cart-content">
                                                            <h5 class="promotion-item">${SmartWatch.productName}</h5>
                                                            <c:if test="${SmartWatch.productDiscount != ''}">
                                                                <p class="card-text"><fmt:formatNumber value="${SmartWatch.productPrice}" pattern="#,##0 VND" /></p>
                                                                <h4 class="cart-price"><fmt:formatNumber value="${SmartWatch.productPrice * ((100 - SmartWatch.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <c:if test="${SmartWatch.productDiscount == ''}">
                                                                <h4 class="cart-price"><fmt:formatNumber value="${SmartWatch.productPrice}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <button onclick="window.location.href='${pageContext.request.contextPath}/detail?product=${SmartWatch.productId}'" type="button" class="btn btn-dark see-btn">See more</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>

                            <div id="ModuleWifi" class="tabcontent">
                                <div class="center">
                                    <c:forEach items="${MODULE_WIFI}" var="ModuleWifi">
                                        <a href="${pageContext.request.contextPath}/detail?product=${ModuleWifi.productId}">
                                            <div class="promotion-card">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="data:image/png;base64,${ModuleWifi.imageProduct}" class="card-img-top" alt="${ModuleWifi.productName}">

                                                    <div class="card-body">
                                                        <div class="cart-content">
                                                            <h5 class="promotion-item">${ModuleWifi.productName}</h5>
                                                            <c:if test="${ModuleWifi.productDiscount != ''}">
                                                                <p class="card-text"><fmt:formatNumber value="${ModuleWifi.productPrice}" pattern="#,##0 VND" /></p>
                                                                <h4 class="cart-price"><fmt:formatNumber value="${ModuleWifi.productPrice * ((100 - ModuleWifi.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <c:if test="${ModuleWifi.productDiscount == ''}">
                                                                <h4 class="cart-price"><fmt:formatNumber value="${ModuleWifi.productPrice}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <button onclick="window.location.href='${pageContext.request.contextPath}/detail?product=${ModuleWifi.productId}'" type="button" class="btn btn-dark see-btn">See more</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>

                            <div id="Webcam" class="tabcontent">
                                <div class="center">
                                    <c:forEach items="${WEBCAM}" var="Webcam">
                                        <a href="${pageContext.request.contextPath}/detail?product=${Webcam.productId}">
                                            <div class="promotion-card">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="data:image/png;base64,${Webcam.imageProduct}" class="card-img-top" alt="${Webcam.productName}">

                                                    <div class="card-body">
                                                        <div class="cart-content">
                                                            <h5 class="promotion-item">${Webcam.productName}</h5>
                                                            <c:if test="${Webcam.productDiscount != ''}">
                                                                <p class="card-text"><fmt:formatNumber value="${Webcam.productPrice}" pattern="#,##0 VND" /></p>
                                                                <h4 class="cart-price"><fmt:formatNumber value="${Webcam.productPrice * ((100 - Webcam.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <c:if test="${Webcam.productDiscount == ''}">
                                                                <h4 class="cart-price"><fmt:formatNumber value="${Webcam.productPrice}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <button onclick="window.location.href='${pageContext.request.contextPath}/detail?product=${Webcam.productId}'" type="button" class="btn btn-dark see-btn">See more</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>

                            <div id="RadiatorBase" class="tabcontent">
                                <div class="center">
                                    <c:forEach items="${RADIATOR_BASE}" var="RadiatorBase">
                                        <a href="${pageContext.request.contextPath}/detail?product=${RadiatorBase.productId}">
                                            <div class="promotion-card">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="data:image/png;base64,${RadiatorBase.imageProduct}" class="card-img-top" alt="${RadiatorBase.productName}">

                                                    <div class="card-body">
                                                        <div class="cart-content">
                                                            <h5 class="promotion-item">${RadiatorBase.productName}</h5>
                                                            <c:if test="${RadiatorBase.productDiscount != ''}">
                                                                <p class="card-text"><fmt:formatNumber value="${RadiatorBase.productPrice}" pattern="#,##0 VND" /></p>
                                                                <h4 class="cart-price"><fmt:formatNumber value="${RadiatorBase.productPrice * ((100 - RadiatorBase.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <c:if test="${RadiatorBase.productDiscount == ''}">
                                                                <h4 class="cart-price"><fmt:formatNumber value="${RadiatorBase.productPrice}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <button onclick="window.location.href='${pageContext.request.contextPath}/detail?product=${RadiatorBase.productId}'" type="button" class="btn btn-dark see-btn">See more</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            <div id="GamingConsole" class="tabcontent">
                                <div class="center">
                                    <c:forEach items="${GAMING_CONSOLE}" var="GamingConsole">
                                        <a href="${pageContext.request.contextPath}/detail?product=${GamingConsole.productId}">
                                            <div class="promotion-card">
                                                <div class="card" style="width: 18rem;">
                                                    <img src="data:image/png;base64,${GamingConsole.imageProduct}" class="card-img-top" alt="${GamingConsole.productName}">

                                                    <div class="card-body">
                                                        <div class="cart-content">
                                                            <h5 class="promotion-item">${GamingConsole.productName}</h5>
                                                            <c:if test="${GamingConsole.productDiscount != ''}">
                                                                <p class="card-text"><fmt:formatNumber value="${GamingConsole.productPrice}" pattern="#,##0 VND" /></p>
                                                                <h4 class="cart-price"><fmt:formatNumber value="${GamingConsole.productPrice * ((100 - GamingConsole.productDiscount) / 100)}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <c:if test="${GamingConsole.productDiscount == ''}">
                                                                <h4 class="cart-price"><fmt:formatNumber value="${GamingConsole.productPrice}" pattern="#,##0 VND" /></h4>
                                                            </c:if>
                                                            <button onclick="window.location.href='${pageContext.request.contextPath}/detail?product=${GamingConsole.productId}'" type="button" class="btn btn-dark see-btn">See more</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!------------- END PROMOTION ------------->

            <!------------- BRAND ----------------->
            <section class="brand container mt-5 mb-5">
                <div class="brand-contain">
                    <div class="brand-title">
                        <h3>Product Brands</h3>
                    </div>
                    <div>
                        <div class="row brand-item">
                            <c:forEach items="${BRAND_LIST}" var="brand" begin="1" end="15">
                                <a href="${pageContext.request.contextPath}/product?brand=${brand.brandId}" class="brand-img col-3">
                                    <img src="data:image/png;base64,${brand.imageBrand}" alt="${brand.brandName}">
                                </a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </section>
            <!------------- END BRAND ------------->
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>

            <!-- BOOTSTRAP 5 -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
            <!-- Swiper JS -->
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
            <!-- JQUERY -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <!-- SLICK -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
            <!-- Lottie Files -->
            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
            <!-- Intro -->
            <script src="https://cdn.jsdelivr.net/npm/intro.js@3.2.1/intro.min.js"></script>
            <!-- Responsivevoice -->
            <script src="https://code.responsivevoice.org/responsivevoice.js?key=twfBO9A0"></script>
            <!-- Root Page -->
            <script src="./js/user/UserRoot.js"></script>
            <!-- Scroll Back To Top -->
            <script src="./js/ScrollBackToTop.js"></script>
            <!-- Home -->
            <script src="./js/user/Home.js"></script>
            <script type="text/javascript">
                <c:if test="${sessionScope.INTRO_USER != null}">
                    window.addEventListener('DOMContentLoaded', () => {
                        introJs().onchange(function () {
                            if (this._introItems[this._currentStep].myChangeFunction) {
                                this._introItems[this._currentStep].myChangeFunction();
                            }
                        })
                                .setOptions({
                                    steps: [
                                        {
                                            title: 'Horizon',
                                            intro: "Hi! I'm Henry - a guide at Horizon, I will take you to visit and introduce you to better understand Horizon. Let's go!",
                                            myChangeFunction: function () {
                                                responsiveVoice.speak(this.intro);
                                            }
                                        },
                                        {
                                            element: document.querySelector('#link-home'),
                                            intro: "This is the home page area of this screen, all services and reviews will be displayed here ${sessionScope.LOGIN_USER.userName}",
                                            position: 'bottom',
                                            myChangeFunction: function () {
                                                responsiveVoice.speak(this.intro);
                                            }
                                        },
                                        {
                                            element: document.querySelector('#link-product'),
                                            intro: "Next is the equally important area, which is the product list in Horizon. You can view for detailed product information. >_<",
                                            position: 'bottom',
                                            myChangeFunction: function () {
                                                responsiveVoice.speak(this.intro);
                                            }
                                        },
                                        {
                                            element: document.querySelector('#link-contact'),
                                            intro: "Next is the equally important area, where you can contact the Horizon team when you have problems with the website.",
                                            position: 'bottom',
                                            myChangeFunction: function () {
                                                responsiveVoice.speak(this.intro);
                                            }
                                        }
                                    ],
                                    showProgress: true
                                }).oncomplete(function() {
                            <%
                                session.removeAttribute("INTRO_USER");
                            %>
                        }).start();
                    });
                </c:if>
        </script>
    </body>
</html>
