<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detail ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
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
        <link href="./css/ToastSuccess.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../../layouts/ToastSuccess.html"></jsp:include>
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <div id="error-box"></div>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                        <img class="card-img-top mb-5 mb-md-0" src="data:image/png;base64,${PRODUCT_DETAIL.imageProduct}" alt="${PRODUCT_DETAIL.productName}" />
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder">${PRODUCT_DETAIL.productName}</h1>
                        <div class="fs-5 mb-5">
                            <c:if test="${PRODUCT_DETAIL.productDiscount != null}">
                                <span class="text-decoration-line-through"><fmt:formatNumber value="${PRODUCT_DETAIL.productPrice}" pattern="#,##0 VNĐ" /></span>
                                <span><fmt:formatNumber value="${PRODUCT_DETAIL.productPrice * ((100 - PRODUCT_DETAIL.productDiscount) / 100)}" pattern="#,##0 VNĐ" /></span>
                            </c:if>
                            <c:if test="${PRODUCT_DETAIL.productDiscount == null}">
                                <span><fmt:formatNumber value="${PRODUCT_DETAIL.productPrice}" pattern="#,##0 VNĐ" /></span>
                            </c:if> 
                        </div>
                        <p class="lead">${PRODUCT_CONTENT.productDescription}</p>
                        <form action="${pageContext.request.contextPath}/detail" method="post" class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="number" value="1" style="max-width: 4rem" name="quantity"/>
                            <input type="hidden" value="${sessionScope.LOGIN_USER.userId}" name="userID">
                            <input type="hidden" value="${PRODUCT_DETAIL.imageProduct}" name="imageProduct">
                            <input type="hidden" value="${PRODUCT_DETAIL.productName}" name="productName">
                            <input type="hidden" value="<fmt:formatNumber value="${PRODUCT_DETAIL.productPrice * ((100 - PRODUCT_DETAIL.productDiscount) / 100)}" />" name="price">
                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Parameter  -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <h2 class="my-4">Thông số kỹ thuật</h2>
                <table border="1" class="table table-bordered">
                    <tbody>
                        <tr>
                            <td style="background-color:#f7f7f7"><strong>Main board</strong></td>
                            <td><span>MSI H510M Pro-E</span></td>
                        </tr>               
                        <tr>
                            <td style="background-color:#f7f7f7"><strong>CPU</strong></td>
                            <td><span>Intel Core i3 10100F / 6MB / 4.3GHZ / 4 nhân 8 luồng / LGA 1200</span></td>
                        </tr>               
                        <tr>
                            <td style="background-color:#f7f7f7"><strong>RAM</strong></td>
                            <td><span>PNY XLR8 RGB DDR4 1x8GB 3200</span></td>
                        </tr>               
                        <tr>
                            <td style="background-color:#f7f7f7"><strong>VGA- Card đồ hoạ</strong></td>
                            <td><span>MANLI GeForce GTX 1050 Ti 4GB GDDR5</span></td>
                        </tr>               
                        <tr>
                            <td style="background-color:#f7f7f7"><strong>HDD</strong></td>
                            <td><span>Tuỳ chọn</span></td>
                        </tr>               
                        <tr>
                            <td style="background-color:#f7f7f7"><strong>SSD</strong></td>
                            <td><span>PNY CS900 120G 2.5" Sata 3</span></td>
                        </tr>               
                    </tbody>
                </table>
            </div>          
        </section>
        <!-- Product Review -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <h2 class="my-4">Đánh giá chi tiết</h2>
                <p>${PRODUCT_CONTENT.productContent}</p>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${RELATE_PRODUCT}" var="product">
                        <div class="col mb-5">
                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="data:image/png;base64,${product.imageProduct}" alt="${product.productName}" />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${product.productName}</h5>
                                        <!-- Product price-->
                                        <c:if test="${product.productDiscount != null}">
                                            <span class="text-muted text-decoration-line-through"><fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VNĐ" /></span>
                                            <fmt:formatNumber value="${product.productPrice * (100 - product.productDiscount) / 100}" pattern="#,##0 VNĐ" />
                                        </c:if>
                                        <c:if test="${product.productDiscount == null}">
                                            <fmt:formatNumber value="${product.productPrice}" pattern="#,##0 VNĐ" />
                                        </c:if>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center">
                                        <a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/detail?product=${product.productId}">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
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
        <!-- Toast Success -->
        <script src="./js/ToastSuccess.js"></script>
    </body>
</html>
