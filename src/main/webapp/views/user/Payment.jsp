<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment ${sessionScope.LOGIN_USER != null ? "| ".concat(sessionScope.LOGIN_USER.userName) : ""}</title>
        <!-- BOOTSTRAP 5 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <!-- FONTAWESOME -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <!-- UN ICONS -->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <!-- ICON ON WEB BAR -->
        <link rel="icon" type="image/png" sizes="200x138" href="./images/iconHorizon.png">
        <!-- CSS -->
        <link href="./css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href="./css/ScrollBackToTop.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/NavBar.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/Payment.css" rel="stylesheet" type="text/css"/>
        <link href="./css/user/FooterPage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body onload="loadCityJson('${pageContext.request.contextPath}')">
        <jsp:include page="../../layouts/ScrollBackToTop.html"></jsp:include>
        <jsp:include page="../../layouts/user/NavBar.jsp"></jsp:include>
        <section>
            <div class="container">
                <div class="row g-5 my-1">
                    <div class="col-md-5 col-lg-4 order-md-last">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-primary">Your Cart</span>
                            <span class="badge bg-primary rounded-pill">${sessionScope.TOTAL_CART}</span>
                        </h4>
                        <ul class="list-group mb-3">
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total Money</span>
                                <strong><fmt:formatNumber value="${TOTAL_MONEY}" pattern="#,##0 VNĐ" /></strong>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-7 col-lg-8">
                        <h4 class="mb-3">Billing Information</h4>
                        <form action="${pageContext.request.contextPath}/payment" method="post" id="paymentForm">
                            <div class="row g-3">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">First Name</label>
                                    <input type="text" class="form-control" id="firstName" placeholder="First Name" value="" required="" name="firstName">
                                    <div class="invalid-feedback first-name d-none">Please enter your first name</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" class="form-control" id="lastName" placeholder="Last Name" value="" required="" name="lastName">
                                    <div class="invalid-feedback last-name d-none">Please enter your last name</div>
                                </div>
                                <div class="mb-3">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" value="${sessionScope.LOGIN_USER.email}" readonly name="email">
                                </div>
                                <div class="mb-3">
                                    <label for="address">Address</label>
                                    <input type="text" class="form-control" id="address" value="${sessionScope.LOGIN_USER.userAddress}" required="" name="address">
                                    <div class="invalid-feedback address d-none">Please enter your address</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="city">City</label>
                                    <select class="form-select d-block w-100" id="city" required="" name="city">
                                        <option value="">Choose...</option>
                                    </select>
                                    <div class="invalid-feedback city d-none">Please choose your city</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="district">District</label>
                                    <select class="form-select d-block w-100" id="district" required="" name="district">
                                        <option value="">Choose...</option>
                                    </select>
                                    <div class="invalid-feedback district d-none">Please choose your district</div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="ward">Ward</label>
                                    <select class="form-select d-block w-100" id="ward" required="" name="ward">
                                        <option value="">Choose...</option>
                                    </select>
                                    <div class="invalid-feedback ward d-none">Please choose your ward</div>
                                </div>
                            </div>
                            <hr class="my-4">
                            <div class="my-3">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="save-info" name="saveInfo">
                                    <label class="form-check-label" for="save-info">Save this information for next time</label>
                                </div>
                            </div>
                            <hr class="my-4">
                            <h4 class="mb-3">Payment</h4>
                            <div class="my-3">
                                <div class="form-check">
                                    <input id="payincash" name="paymentMethod" type="radio" class="form-check-input"
                                        required="" checked>
                                    <label class="form-check-label" for="payincash">Pay In Cash</label>
                                </div>
                                <div class="form-check">
                                    <input id="paypal" name="paymentMethod" type="radio" class="form-check-input"
                                        required="">
                                    <label class="form-check-label" for="paypal">Pay With PayPal</label>
                                </div>
                                <div class="form-check">
                                    <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required="" on>
                                    <label class="form-check-label" for="debit">Pay With Visa/Master Card</label>
                                </div>
                            </div>
                            <div class="row gy-3">
                                <div class="col-md-6 online-payment d-none">
                                    <label for="cc-name" class="form-label">Name on card</label>
                                    <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                                    <small class="text-muted">Full name as displayed on card</small>
                                    <div class="invalid-feedback cc-name d-none">
                                        Please enter your name on card
                                    </div>
                                </div>
                                <div class="col-md-6 online-payment d-none">
                                    <label for="cc-number" class="form-label">Card number</label>
                                    <input type="number" class="form-control" id="cc-number" placeholder="" required="">
                                    <div class="invalid-feedback cc-number d-none">
                                        Please enter your card number
                                    </div>
                                </div>
                                <div class="col-md-6 online-payment d-none">
                                    <label for="cc-expiration" class="form-label">Expiration</label>
                                    <input type="month" class="form-control" id="cc-expiration" placeholder="" required=""
                                        pattern="MM/yyyy">
                                    <div class="invalid-feedback cc-expiration d-none">
                                        Please enter your expired date card
                                    </div>
                                </div>

                                <div class="col-md-2 online-payment d-none">
                                    <label for="cc-cvv" class="form-label">CVV</label>
                                    <input type="number" class="form-control" id="cc-cvv" placeholder="" required="">
                                    <div class="invalid-feedback cc-cvv d-none">
                                        Please enter your security code
                                    </div>
                                </div>
                            </div>
                            <hr class="my-4">
                            <button class="truck-button w-100 btn-lg">
                                <span class="default">Checkout</span>
                                <span class="success">
                                    Checkout Successful
                                    <svg viewbox="0 0 12 10">
                                        <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
                                    </svg>
                                </span>
                                <div class="truck">
                                    <div class="wheel"></div>
                                    <div class="back"></div>
                                    <div class="front"></div>
                                    <div class="box"></div>
                                </div>
                            </button>
                        </form>
                        <br class="my-4">
                        <div class="my-4"> </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <!-- Root Page -->
        <script src="./js/user/UserRoot.js"></script>
        <!-- Payment Page -->
        <script src="./js/user/Payment.js"></script>
        <!-- Scroll Back To Top -->
        <script src="./js/ScrollBackToTop.js"></script>
    </body>
</html>
