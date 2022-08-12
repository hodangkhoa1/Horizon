<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
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
        <link href="./css/user/Cart.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <c:set var="total" value="0" />
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <section class="pt-3 pb-5 bg-light">
            <div class="container h-100">
                <div class="row d-flex justify-content-center h-100">
                    <div class="col">
                        <div class="my-4"></div>
                        <div class="card mb-4">
                            <div class="card-body p-4">
                                <div class="row align-items-center">
                                    <div class="col-3 d-flex justify-content-start">
                                        <div>
                                            <p class="lead pb-2 fw-normal position-relative" style="left: 25px">Product Name</p>
                                        </div>
                                    </div>
                                    <div class="col-3 d-flex justify-content-center">
                                        <div>
                                            <p class="lead fw-normal text-center">Quantity</p>
                                        </div>
                                    </div>
                                    <div class="col-2 d-flex justify-content-center">
                                        <div>
                                            <p class="lead pb-2 fw-normal text-center">Price</p>
                                        </div>
                                    </div>
                                    <div class="col-2 d-flex justify-content-center responsive-991-total">
                                        <div>
                                            <p class="lead pb-2 fw-normal text-center">Total</p>
                                        </div>
                                    </div>
                                    <div class="col-2 d-flex justify-content-center responsive-991-operation">
                                        <div>
                                            <p class="lead pb-2 fw-normal text-center">Operation</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <c:if test="${CART_LIST != null}">
                                <c:forEach items="${CART_LIST}" var="cart">
                                    <div class="card-body p-4">
                                        <div class="row align-items-center">
                                            <div class="col-3 d-flex align-items-center justify-content-start">
                                                <img src="data:image/png;base64,${cart.imageProduct}"
                                                    class="img-fluid" alt="${cart.productName}" style="width: 100px;">
                                                <p class="lead fw-normal mb-0 position-relative">${cart.productName}</p>
                                            </div>
                                            <div class="col-3 d-flex justify-content-center">
                                                <div>
                                                    <button class="btn bg-white" type="button" style="border: 1px solid black;"
                                                        name="product-minus" id="product-minus" onclick="buttonMinus('.${cart.cartId}'); theNumberOfProducts()"><i class="fas fa-minus"></i></button>
                                                    <input type="number" class="number ${cart.cartId}"
                                                        style="width: 50px; height: 37.5px; position: relative; top: 2px; text-align: center;"
                                                        value="${cart.quantity}" name="inputQuantity" onblur="blurHandler('.${cart.cartId}'); theNumberOfProducts()">
                                                    <button class="btn bg-white" type="button" style="border: 1px solid black;"
                                                        name="product-plus" id="product-plus" onclick="buttonAdd('.${cart.cartId}'); theNumberOfProducts()"><i class="fas fa-plus"></i></button>
                                                </div>
                                            </div>
                                            <div class="col-2 d-flex justify-content-center">
                                                <div class="money">
                                                    <p class="lead fw-normal mb-0 text-center" id="price"><fmt:formatNumber value="${cart.price}" pattern="#,##0 VNĐ" /></p>
                                                </div>
                                            </div>
                                            <div class="col-2 d-flex justify-content-center text-center">
                                                <div class="money">
                                                    <p class="lead fw-normal mb-0" id="totalPrice"><fmt:formatNumber value="${cart.quantity * cart.price}" pattern="#,##0 VNĐ" /></p>
                                                </div>
                                            </div>
                                            <div class="col-2 d-flex justify-content-center text-center">
                                                <form id="formDelete" action="${pageContext.request.contextPath}/cart" method="post">
                                                    <input type="hidden" value="${cart.cartId}" name="cartID">
                                                    <input type="hidden" value="${sessionScope.LOGIN_USER.userId}" name="userID">
                                                    <button type="submit" class="button">
                                                        <div class="icon">
                                                            <svg class="top">
                                                                <use xlink:href="#top">
                                                            </svg>
                                                            <svg class="bottom">
                                                                <use xlink:href="#bottom">
                                                            </svg>
                                                        </div>
                                                        <span>Delete</span>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="text-muted">
                                    <c:set var="total" value="${total + cart.quantity * cart.price}" />
                                </c:forEach>
                            </c:if>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body p-2">
                                <div class="row align-items-center">
                                    <div class="col-2"></div>
                                    <div class="col-2"></div>
                                    <div class="col-8 d-flex justify-content-end">
                                        <p class="mb-0 me-5 d-flex align-items-center">
                                            <span class="small text-muted me-2">Total Payment:</span> <span
                                                class="lead fw-normal" id="totalPayment"><fmt:formatNumber value="${total}" pattern="#,##0 VNĐ" /></span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end">
                            <button onclick="window.location.href='${pageContext.request.contextPath}/product'" type="button" class="btn btn-secondary btn-lg me-2" name="continue-shopping">Continue Shopping</button>
                            <button onclick="changePayment('${pageContext.request.contextPath}')" type="button" class="effect effect-5">Checkout</button>
                        </div>

                    </div>
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
        <!-- Cart -->
        <script src="./js/user/Cart.js"></script>
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="top">
                <path d="M15,4 C15.5522847,4 16,4.44771525 16,5 L16,6 L18.25,6 C18.6642136,6 19,6.33578644 19,6.75 C19,7.16421356 18.6642136,7.5 18.25,7.5 L5.75,7.5 C5.33578644,7.5 5,7.16421356 5,6.75 C5,6.33578644 5.33578644,6 5.75,6 L8,6 L8,5 C8,4.44771525 8.44771525,4 9,4 L15,4 Z M14,5.25 L10,5.25 C9.72385763,5.25 9.5,5.47385763 9.5,5.75 C9.5,5.99545989 9.67687516,6.19960837 9.91012437,6.24194433 L10,6.25 L14,6.25 C14.2761424,6.25 14.5,6.02614237 14.5,5.75 C14.5,5.50454011 14.3231248,5.30039163 14.0898756,5.25805567 L14,5.25 Z"></path>
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="bottom">
                <path d="M16.9535129,8 C17.4663488,8 17.8890201,8.38604019 17.9467852,8.88337887 L17.953255,9.02270969 L17.953255,9.02270969 L17.5309272,18.3196017 C17.5119599,18.7374363 17.2349366,19.0993109 16.8365446,19.2267053 C15.2243631,19.7422351 13.6121815,20 12,20 C10.3878264,20 8.77565288,19.7422377 7.16347932,19.226713 C6.76508717,19.0993333 6.48806648,18.7374627 6.46907425,18.3196335 L6.04751853,9.04540766 C6.02423185,8.53310079 6.39068134,8.09333626 6.88488406,8.01304774 L7.02377738,8.0002579 L16.9535129,8 Z M9.75,10.5 C9.37030423,10.5 9.05650904,10.719453 9.00684662,11.0041785 L9,11.0833333 L9,16.9166667 C9,17.2388328 9.33578644,17.5 9.75,17.5 C10.1296958,17.5 10.443491,17.280547 10.4931534,16.9958215 L10.5,16.9166667 L10.5,11.0833333 C10.5,10.7611672 10.1642136,10.5 9.75,10.5 Z M14.25,10.5 C13.8703042,10.5 13.556509,10.719453 13.5068466,11.0041785 L13.5,11.0833333 L13.5,16.9166667 C13.5,17.2388328 13.8357864,17.5 14.25,17.5 C14.6296958,17.5 14.943491,17.280547 14.9931534,16.9958215 L15,16.9166667 L15,11.0833333 C15,10.7611672 14.6642136,10.5 14.25,10.5 Z"></path>
            </symbol>
        </svg>
        <script>
            theNumberOfProducts();
        </script>
    </body>
</html>
