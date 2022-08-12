<%@page import="com.team.horizon.models.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    ProductError productError = (ProductError) request.getAttribute("ADD_PRODUCT_ERROR");
    
    if (productError == null) {
        productError = new ProductError();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product</title>
        <link rel="icon" type="image/png" sizes="200x138" href=".././images/iconHorizon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href=".././css/RootPage.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/UploadImagePopup.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/ToastSuccess.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/NavBarAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/ProfileAdmin.css" rel="stylesheet" type="text/css"/>
        <link href=".././css/admin/AddProduct.css" rel="stylesheet" type="text/css"/>
    </head>
    <body onload="${ADD_PRODUCT_SUCCESS != null ? "ToastSuccess()" : ""}">
        <jsp:include page="../../layouts/ToastSuccess.html"></jsp:include>
        <jsp:include page="../../layouts/UploadImagePopup.html"></jsp:include>
        <section>
            <jsp:include page="../../layouts/admin/NavBarAdmin.jsp"></jsp:include>
            <div class="w3-main" style="margin-left:230px">
                <div>
                    <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</button>
                    <jsp:include page="../../layouts/admin/ProfileAdmin.jsp"></jsp:include>
                </div>

                <div class="add-box" style="top: ${CURRENT_PAGE != null ? "65%" : "50%"}">
                    <h2 class="title">Add Product <span>${CURRENT_PAGE != null ? "Step 1" : "Step 2"}</span></h2>
                    <c:if test="${CURRENT_PAGE != null}">
                        <form action="${pageContext.request.contextPath}/admin/add-product" method="post">
                            <div class="user-box">
                                <input oninput="CheckNameProduct()" onblur="CheckNameProduct()" id="inputNameProduct" type="text" name="nameProduct" value="${NAME_PRODUCT}">
                                <i class='bx bx-check-circle name-product-icon-check'></i>
                                <i class='bx bx-error-circle name-product-icon-error'></i>
                                <label>Name</label>
                                <span class="error_message" id="name-product-error"><%=productError.getProductNameError()%></span>
                            </div>
                            <div class="user-box">
                                <label class="label-image" for="img">Image</label>
                                <div class="box-add-image">
                                    <div id="img" class="add-image">
                                        <div class="button-add-image">
                                            <i class="fas fa-plus"></i>
                                        </div>
                                    </div>
                                </div>
                                <span class="error_message"><%=productError.getImageProductError()%></span>
                            </div>
                            <div class="user-box">
                                <input oninput="CheckQuantityProduct()" onblur="CheckQuantityProduct()" id="inputQuantityProduct" type="number" name="quantity" value="${QUANTITY_PRODUCT}">
                                <i class='bx bx-check-circle quantity-product-icon-check'></i>
                                <i class='bx bx-error-circle quantity-product-icon-error'></i>
                                <label>Quantity</label>
                                <span class="error_message" id="quantity-product-error"><%=productError.getQuantityError()%></span>
                            </div>
                            <div class="user-box">
                                <input oninput="CheckPriceProduct()" onblur="CheckPriceProduct()" id="inputPriceProduct" type="number" name="price" value="${PRICE_PRODUCT}">
                                <i class='bx bx-check-circle price-product-icon-check'></i>
                                <i class='bx bx-error-circle price-product-icon-error'></i>
                                <label>Price</label>
                                <span class="error_message" id="price-product-error"><%=productError.getProductPriceError()%></span>
                            </div>
                            <div class="user-box">
                                <input type="number" step="1" name="discount" min="1" max="100">
                                <label>Discount</label>
                            </div>
                            <div class="user-box">
                                <select onclick="CheckBrandProduct()" id="selectBrandProduct" name="brand">
                                    <option value="">Choose a brand</option>
                                    <c:forEach items="${BRAND_LIST}" var="brand">
                                        <option value="${brand.brandId}" ${brand.brandId == BRAND_PRODUCT ? selected : ''}>${brand.brandName}</option>
                                    </c:forEach>
                                </select>
                                <i class='bx bx-check-circle brand-product-icon-check'></i>
                                <i class='bx bx-error-circle brand-product-icon-error'></i>
                                <label>Brand</label>
                                <span class="error_message" id="brand-product-error"><%=productError.getProductBrandError()%></span>
                            </div>
                            <div class="user-box">
                                <select onclick="CheckProductType()" id="selectProductType" name="productType">
                                    <option value="">Choose a product type</option>
                                    <c:forEach items="${PRODUCT_TYPE_LIST}" var="productType">
                                        <option value="${productType.productTypeID}" ${productType.productTypeID == PRODUCT_TYPE ? selected : ''}>${productType.productTypeName}</option>
                                    </c:forEach>
                                </select>
                                <i class='bx bx-check-circle product-type-icon-check'></i>
                                <i class='bx bx-error-circle product-type-icon-error'></i>
                                <label>Product Type</label>
                                <span class="error_message" id="product-type-error"><%=productError.getProductTypeError()%></span>
                            </div>

                            <button type="submit">Next</button>
                        </form>
                    </c:if>
                    <c:if test="${CHANGE_PAGE_STEP_2 != null}">
                        <form action="${pageContext.request.contextPath}/admin/add-product" method="post">
                            <div class="user-box">
                                <input oninput="CheckDescriptionProduct()" onblur="CheckDescriptionProduct()" id="inputDescriptionProduct" type="text"
                                       name="description" value="${DESCRIPTION_PRODUCT}">
                                <i class='bx bx-check-circle description-product-icon-check'></i>
                                <i class='bx bx-error-circle description-product-icon-error'></i>
                                <label>Description</label>
                                <span class="error_message" id="description-product-error"><%=productError.getProductDescriptionError()%></span>
                            </div>
                            <div class="user-box">
                                <h6 class="desc">Content</h6>
                                <textarea oninput="CheckContentProduct()" onblur="CheckContentProduct()"
                                    id="inputContentProduct" row="3" name="content">${CONTENT_PRODUCT}</textarea><br>
                                <i class='bx bx-check-circle content-product-icon-check'></i>
                                <i class='bx bx-error-circle content-product-icon-error'></i>
                                <span class="error_message" id="content-product-error"><%=productError.getProductContentError()%></span>
                            </div>

                            <button type="submit">Add into store</button>
                        </form>
                    </c:if>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src=".././js/admin/AdminRoot.js"></script>
        <script src=".././js/admin/UploadImagePopup.js"></script>
        <script src=".././js/admin/AddProduct.js"></script>
        <script src=".././js/ToastSuccess.js"></script>
        <script>
            activeSidebarLink();
        </script>
    </body>
</html>
