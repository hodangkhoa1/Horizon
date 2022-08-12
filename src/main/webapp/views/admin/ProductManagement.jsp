<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Management | Page: ${CURRENT_PAGE}</title>
        <link rel="icon" type="image/png" sizes="200x138" href=".././images/iconHorizon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href=".././css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/NavBarAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/ProfileAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/Management.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/ProductManagement.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <section>
            <jsp:include page="../../layouts/admin/NavBarAdmin.jsp"></jsp:include>
                <div class="w3-main" style="margin-left:230px">
                    <div>
                        <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</button>
                        <jsp:include page="../../layouts/admin/ProfileAdmin.jsp"></jsp:include>
                    </div>

                    <div class="w3-container">
                        <main class="management-layout">
                            <div class="management-top">
                                <h2 class="management-title">
                                    Product - <span>Management</span>
                                </h2>
                                <div class="management-alert">
                                    You are in admin mode. You can edit the data.
                                </div>
                            </div>
                        </main>

                        <div class="table-users">
                            <table cellspacing="0">
                                <tr>
                                    <th>Image</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Quantity</th>
                                    <th>Created</th>
                                    <th>Actions</th>
                                </tr>

                                <tbody id="table-body">
                                    <c:forEach items="${PRODUCTS_ADMIN_LIST}" var="product">
                                        <tr>
                                            <td>
                                                <img src="data:image/png;base64,${product.imageProduct}" alt="${product.productName}" />
                                            </td>
                                            <td>
                                                ${product.productId}
                                            </td>
                                            <td>${product.productName}</td>
                                            <td>${product.productPrice}</td>
                                            <td>${product.productDiscount}</td>
                                            <td>${product.quantity}</td>
                                            <td><fmt:formatDate value="${product.productCreated}" pattern="dd-MM-yyyy"/></td>
                                            <td>
                                                <div class="table-action-button">
                                                    <button type="button" class="users-control btn btn-success">Edit</button>
                                                    <button type="button" onclick="deleteProduct(this.value, '${pageContext.request.contextPath}/admin/product-management')" value="${product.productId}" class="users-control btn btn-danger">Delete</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="table-pagination">
                            <ul>
                                <c:if test="${CURRENT_PAGE > 1}">
                                    <li class="pagination-button button-prev">
                                        <a href="${pageContext.request.contextPath}/admin/product-management?page=${CURRENT_PAGE - 1}">
                                            <i class="fas fa-angle-left"></i> Prev
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${END_PAGE}" var="i">
                                    <li class="pagination-number ${CURRENT_PAGE == i ? "active" : ""}">
                                        <a href="${pageContext.request.contextPath}/admin/product-management?page=${i}" class="pagination-link">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${CURRENT_PAGE < END_PAGE}">
                                    <li class="pagination-button button-next">
                                        <a href="${pageContext.request.contextPath}/admin/product-management?page=${CURRENT_PAGE + 1}">
                                            Next <i class="fas fa-angle-right"></i>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
        </section>
                    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src=".././js/admin/AdminRoot.js"></script>
        <script src=".././js/admin/ProductManagement.js"></script>
        <script>
            activeSidebarLink();
        </script>
    </body>
</html>