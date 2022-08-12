<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
    <div class="header-navbar">
        <nav class="navbar navbar-expand-xl navbar-light pt-1 pb-1 navbar-bgc">
            <div class="container-fluid me-3 me-xl-0">
                <div class="logo">
                    <a class="navbar-brand header-logo" href="${pageContext.request.contextPath}/home">
                        <img src="./images/iconHorizon.png" alt="logo">
                    </a>
                </div>

                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title mt-2 fs-1 userName" id="offcanvasNavbarLabel">
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <c:if test="${sessionScope.LOGIN_USER.imageAvatar != null}">
                                    <div class="img-user">
                                        <img src="data:image/png;base64,${sessionScope.LOGIN_USER.imageAvatar}" />
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER.imageAvatar == null}">
                                    <div class="img-user" style="background: ${sessionScope.LOGIN_USER.colorAvatar}">
                                        <p>${sessionScope.LOGIN_USER.defaultAvatar.toUpperCase()}</p>
                                    </div>
                                </c:if>
                                <div class="user-infor">
                                    <span>${sessionScope.LOGIN_USER.userName}</span>
                                    <p>${sessionScope.LOGIN_USER.email}</p>
                                </div>
                            </c:if>
                        </h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body header-menu ms-3 ms-xl-0 mt-2 mt-xl-0" id="navbarSupportedContent">
                        <div class="convert d-flex flex-column-reverse flex-md-column-reverse flex-xl-row">
                            <ul class="navbar-nav mt-2 mb-2 mb-xl-0" id="menu">
                                <li class="nav-item menu-item d-xl-none">
                                    <a class="nav-link" href="#">English</a>
                                </li>
                                
                                <li id="link-home" class="nav-item active">
                                    <a class="nav-link menu-item" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
                                </li>

                                <li class="nav-item menu-item d-xl-none">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/info-profile">My profile</a>
                                </li>
                                
                                <li class="nav-item menu-item d-xl-none">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/edit-profile">Edit Profile</a>
                                </li>
                                
                                <li class="nav-item menu-item d-xl-none">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/change-password">Change Password</a>
                                </li>

                                <li id="link-product" class="nav-item menu-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/product">Product</a>
                                    <c:if test="${PRODUCT_TYPE_LIST != null}">
                                        <ul class="dropdown_menu">
                                            <c:forEach items="${PRODUCT_TYPE_LIST}" var="productType">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/product?type=${productType.productTypeID}">${productType.productTypeName}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </li>

                                <li id="link-contact" class="nav-item menu-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a>
                                </li>
                                
                                <li id="link-contact" class="nav-item menu-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a>
                                </li>
                                
                                <li class="nav-item menu-item d-xl-none">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
                                </li>
                            </ul>

                            <c:if test="${PRODUCT_LIST != null}">
                                <div class="header-search" style="display: flex; justify-content: center;">
                                    <div class="d-flex">
                                        <input oninput="searchByName(this, '${pageContext.request.contextPath}/product')" onfocusout="showLoadMoreButton()" id="inputSearch" class="form-control me-2" type="search" placeholder="Search on Horizon..." aria-label="Search">
                                        <div class="btn btn-outline-primary">
                                            <i class="fas fa-search"></i>
                                        </div>
                                    </div>
                                    <div class="nav-microphone ms-2">
                                        <div onclick="showMicrophoneBox('${pageContext.request.contextPath}/product')" class="btn btn-outline-primary microphone-button" style="font-size: 1.02rem;">
                                            <i class="fas fa-microphone-alt"></i>
                                        </div>
                                        <div class="microphone-wrapper">
                                            <div class="microphone-box" role="dialog" tabindex="-1">
                                                <div class="microphone-container" tabindex="-1">
                                                    <div class="microphone-header">
                                                        <div class="microphone-header__text">
                                                            <div class="microphone-header__prompt"></div>
                                                        </div>
                                                        <div class="microphone-exit__button">
                                                            <button onclick="hideMicrophoneBox()" class="icon-exit-button">
                                                                <i class="fas fa-times"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="microphone-body">
                                                        <div class="microphone-body-text"></div>
                                                    </div>
                                                    <div class="microphone-footer-button">
                                                        <div onclick="activeMicrophone('${pageContext.request.contextPath}/product')" class="microphone-footer-container">
                                                            <div class="microphone-pulse"></div>
                                                            <div class="microphone-levels"></div>
                                                            <div class="microphone-circle" role="button" tabindex="0">
                                                                <i class="fas fa-microphone"></i>
                                                            </div>
                                                        </div>
                                                        <div class="microphone-footer-label"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <div class="header-notification d-none d-lg-none d-xl-flex">
                            <div class="notification has-notification mt-3 mt-xl-0">
                                <div>
                                    <div class="bell" id="bell">
                                        <i class="fas fa-bell"></i>
                                    </div>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                        <c:if test="${sessionScope.NOTIFICATION_LIST != null || sessionScope.COUNT_NOTIFICATION_NOT_READ != null}">
                                            <div class="bell-number" id="bell-number">${sessionScope.COUNT_NOTIFICATION_NOT_READ}</div>
                                        </c:if>
                                    </c:if>
                                </div>
                                <div class="notification-box">
                                    <div class="notification-box-header">
                                        <h3>Notification</h3>
                                    </div>
                                    <c:if test="${sessionScope.LOGIN_USER == null}">
                                        <div class="notification-item">
                                            <div class="notification-content">
                                                <img src="./images/notification.png" alt="Notification" class="notification-img">
                                                <div class="notification-info">
                                                    <span class="notification-message">Sign in to see notifications</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="notification-footer">
                                            <button type="button" onclick="window.location.href = '${pageContext.request.contextPath}/login';" class="footer-registration">Registration</button>
                                            <button type="button" onclick="window.location.href = '${pageContext.request.contextPath}/login';" class="footer-login">Login</button>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER != null}">
                                        <c:if test="${sessionScope.NOTIFICATION_LIST == null}">
                                            <div class="notification-empty">
                                                <lottie-player src="https://assets3.lottiefiles.com/packages/lf20_buhby0ug.json" background="transparent" speed="1" loop autoplay class="notification-empty_image"></lottie-player>
                                            </div>
                                        </c:if>
                                        <c:if test="${sessionScope.NOTIFICATION_LIST != null}">
                                            <div class="notification-box-body">
                                                <ul>
                                                    <c:forEach items="${sessionScope.NOTIFICATION_LIST}" var="notification">
                                                        <c:if test="${notification.notifyType.equals('NewAccount')}">
                                                            <li id="notification-box-list">
                                                                <div class="notification-logo">
                                                                    <img src="./images/iconHorizon.png" alt="logo">
                                                                </div>
                                                                <div class="notification-message-wrapper">
                                                                    <div>
                                                                        Welcome <span class="name">${sessionScope.LOGIN_USER.userName}</span> to Horizon ❤️
                                                                    </div>
                                                                    <div class="notification-created">${sessionScope.TIME_NOTIFICATION}</div>
                                                                </div>
                                                            </li>
                                                        </c:if>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>

                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <div class="cart-item mt-3 mt-xl-0 ms-md-1 ms-xl-2">
                                    <a href="${pageContext.request.contextPath}/cart?uid=${sessionScope.LOGIN_USER.userId}">
                                        <div class="cart" id="cart">
                                            <i class="fas fa-shopping-cart"></i>
                                        </div>
                                        <c:if test="${sessionScope.TOTAL_CART != null}">
                                            <div class="cart-number" id="cart-number">${sessionScope.TOTAL_CART}</div>
                                        </c:if>
                                    </a>
                                </div>
                            </c:if>
                        </div>

                        <div class="d-xl-flex justify-content-xl-center align-items-xl-center">
                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                <div class="hover-box mt-3 mt-xl-0 ms-md-1 ms-xl-2 d-flex justify-content-center align-items-center d-xl-block">
                                    <a href="${pageContext.request.contextPath}/login" class="btn-login-link">
                                        <span class="name-desc">Login</span>
                                        <div class="btn-icon login">
                                            <i class="fas fa-sign-in-alt"></i>
                                        </div>
                                    </a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER != null}">
                                <div class="user d-none d-xl-flex">
                                    <span class="user-name">${sessionScope.LOGIN_USER.userName}</span>
                                    <c:if test="${sessionScope.LOGIN_USER.imageAvatar != null}">
                                        <div onclick="menuToggle()" class="img-user1">
                                            <img src="data:image/png;base64,${sessionScope.LOGIN_USER.imageAvatar}" />
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.LOGIN_USER.imageAvatar == null}">
                                        <div onclick="menuToggle()" class="img-user" style="background: ${sessionScope.LOGIN_USER.colorAvatar}">
                                            <p>${sessionScope.LOGIN_USER.defaultAvatar.toUpperCase()}</p>
                                        </div>
                                    </c:if>
                                    <div class="menu">
                                        <ul>
                                            <li>
                                                <i class="uil uil-language"></i>
                                                <a href="#">English</a>
                                            </li>
                                            <li>
                                                <i class="uil uil-user-circle"></i>
                                                <a href="${pageContext.request.contextPath}/info-profile">My Profile</a>
                                            </li>
                                            <li>
                                                <i class="uil uil-edit"></i>
                                                <a href="${pageContext.request.contextPath}/edit-profile">Edit Profile</a>
                                            </li>
                                            <li>
                                                <i class="uil uil-padlock"></i>
                                                <a href="${pageContext.request.contextPath}/change-password">Change Password</a>
                                            </li>
                                            <li>
                                                <i class="uil uil-question-circle"></i>
                                                <a href="#">Help</a>
                                            </li>
                                            <li>
                                                <i class="uil uil-signout"></i>
                                                <a href="${pageContext.request.contextPath}/logout">Logout</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="header-contain">
                    <div class="header-notification d-xl-none">
                        <div class="notification mt-3 mt-xl-0">
                            <div class="bell" id="bell">
                                <i class="fas fa-bell"></i>
                            </div>
                            <div class="bell-number" id="bell-number">99+</div>
                        </div>

                        <c:if test="${sessionScope.LOGIN_USER != null}">
                            <div class="cart-item mt-3 mt-xl-0 ms-md-1 ms-xl-2">
                                <a href="${pageContext.request.contextPath}/cart?uid=${sessionScope.LOGIN_USER.userId}">
                                    <div class="cart" id="cart">
                                        <i class="fas fa-shopping-cart"></i>
                                    </div>
                                    <c:if test="${sessionScope.TOTAL_CART != null}">
                                        <div class="cart-number" id="cart-number">${sessionScope.TOTAL_CART}</div>
                                    </c:if>
                                </a>
                            </div>
                        </c:if>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        <span class="navbar-toggler-icon">
                            <i class="fas fa-bars"></i>
                        </span>
                    </button>
                </div>
        </nav>
    </div>
</header>