<%@page import="com.team.horizon.models.ProductType"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%
    int totalCourses = 0;
    if (request.getAttribute("TOTAL_PRODUCT_LIST") != null) {
        totalCourses = (int) request.getAttribute("TOTAL_PRODUCT_LIST");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONTAWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <!-- BOX ICONS -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/Product.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/SideBarProduct.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <div id="error-box"></div>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <div class="row">
                <div class="col-2 sidebar-infor">
                    <nav class="nav">
                        <svg class="nav__expand" viewBox="0 0 256 512" width="100" title="angle-right">
                            <path
                                d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z" style="fill: white"/>
                        </svg>

                        <ul class="nav__list">
                            <li class="nav__header" style="background: #EDE9F5;">
                                <div style="display: flex; align-items: center; gap: 30px;">
                                    <i class="fas fa-store" style="color: #9930ad"></i>
                                    <p style="color: #ff00d2; font-size: 19px; font-weight: 700;">HORIZON</p>
                                </div>
                            </li>
                            <c:forEach items="${PRODUCT_CATEGORY}" var="category">
                                <li class="nav__listitem">
                                    <button id="${category.productTypeID}" onclick="category('${category.productTypeID}', '${pageContext.request.contextPath}/product', this)" type="submit">
                                        ${category.iconProductType}
                                        <p>${category.productTypeName}</p>
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            <div class="col-10">
                <div class="container px-4 px-lg-5 mt-5">
                    <div id="product-list" class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-3 justify-content-center">
                        <c:if test="${NOT_EMPTY != null}">
                            <lottie-player src="https://assets2.lottiefiles.com/private_files/lf30_cgfdhxgx.json" background="transparent" speed="1" loop autoplay class="empty-product"></lottie-player>
                        </c:if>
                        <c:if test="${PRODUCT_LIST != null}">
                            <c:forEach items="${PRODUCT_LIST}" var="product">
                                <div class="product-amount col mb-5">
                                    <div class="card h-100">
                                        <!-- Product image-->
                                        <div class="card-image">
                                            <img class="card-img-top" src="data:image/png;base64,${product.imageProduct}" alt="${product.productName}" />
                                        </div>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${product.productName}</h5>
                                                <!-- Product price-->
                                                <c:if test="${product.productDiscount != null}">
                                                    <span class="text-muted text-decoration-line-through"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VNĐ" /></span>
                                                    <fmt:formatNumber value="${product.productPrice * ((100 - product.productDiscount) / 100)}" pattern="#,##0 VNĐ" />
                                                </c:if>
                                                <c:if test="${product.productDiscount == null}">
                                                    <fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VNĐ" />
                                                </c:if>
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <button onclick="buttonAddCart('${sessionScope.LOGIN_USER.userId != null ? sessionScope.LOGIN_USER.userId : sessionScope.GOOGLE_USER.id}', '${pageContext.request.contextPath}/detail?product=${product.productId}')" class="btn btn-outline-dark mt-auto">See More</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <c:if test="${NOT_EMPTY == null}">
                        <div class="col-12">
                            <div class="view-more">
                                <button onclick="loadMore('<%=totalCourses%>', '${pageContext.request.contextPath}/product')" class="button-view">Load more</button>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <jsp:include page="../../layouts/user/FooterPage.jsp"></jsp:include>

        <!-- BOOTSTRAP 5 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <!-- JQUERY -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Lottie Files -->
        <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
        <script src="./js/user/Product.js"></script>
        <script type="text/javascript">
            setActiveMenuBar();
        </script>
    </body>
</html>
