package com.team.horizon.controllers;

import com.team.horizon.dbo.BrandFacade;
import com.team.horizon.dbo.ProductContentFacade;
import com.team.horizon.dbo.ProductFacade;
import com.team.horizon.dbo.ProductTypeFacade;
import com.team.horizon.models.Brand;
import com.team.horizon.models.Product;
import com.team.horizon.models.ProductContent;
import com.team.horizon.models.ProductContentError;
import com.team.horizon.models.ProductError;
import com.team.horizon.models.ProductType;
import com.team.horizon.utils.FunctionRandom;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class AddProductController extends HttpServlet {

    private static final String BRAND_LIST = "BRAND_LIST";
    private static final String PRODUCT_TYPE_LIST = "PRODUCT_TYPE_LIST";
    private static final String CURRENT_PAGE = "CURRENT_PAGE";
    private static final String CHANGE_PAGE_STEP_2 = "CHANGE_PAGE_STEP_2";
    private static final String ADD_PRODUCT_SUCCESS = "ADD_PRODUCT_SUCCESS";
    private static final String NAME_PRODUCT = "NAME_PRODUCT";
    private static final String BRAND_PRODUCT = "BRAND_PRODUCT";
    private static final String PRODUCT_TYPE = "PRODUCT_TYPE";
    private static final String QUANTITY_PRODUCT = "QUANTITY_PRODUCT";
    private static final String PRICE_PRODUCT = "PRICE_PRODUCT";
    private static final String DESCRIPTION_PRODUCT = "DESCRIPTION_PRODUCT";
    private static final String CONTENT_PRODUCT = "CONTENT_PRODUCT";
    private static final String ADD_PRODUCT_ERROR = "ADD_PRODUCT_ERROR";
    private String tmpProductID;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            BrandFacade brandFacade = new BrandFacade();
            ProductTypeFacade productTypeFacade = new ProductTypeFacade();
            List<Brand> brandList = brandFacade.getAllBrand();
            List<ProductType> productTypeList = productTypeFacade.getAllProductType();

            if (brandList.isEmpty()) {
                request.setAttribute(BRAND_LIST, null);
            } else {
                request.setAttribute(BRAND_LIST, brandList);
            }

            if (productTypeList.isEmpty()) {
                request.setAttribute(PRODUCT_TYPE_LIST, null);
            } else {
                request.setAttribute(PRODUCT_TYPE_LIST, productTypeList);
            }

            request.setAttribute(CURRENT_PAGE, CURRENT_PAGE);
            RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/AddProduct.jsp");
            requestDispatcher.forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String nameProduct = request.getParameter("nameProduct");
            String imageProduct = request.getParameter("imageProduct");
            String brandProduct = request.getParameter("brand");
            String productType = request.getParameter("productType");
            String quantityProduct = request.getParameter("quantity");
            String priceProduct = request.getParameter("price");
            String discountProduct = request.getParameter("discount");
            String descriptionProduct = request.getParameter("description");
            String contentProduct = request.getParameter("content");

            BrandFacade brandFacade = new BrandFacade();
            ProductTypeFacade productTypeFacade = new ProductTypeFacade();
            List<Brand> brandList = brandFacade.getAllBrand();
            List<ProductType> productTypeList = productTypeFacade.getAllProductType();

            if (brandList.isEmpty()) {
                request.setAttribute(BRAND_LIST, null);
            } else {
                request.setAttribute(BRAND_LIST, brandList);
            }

            if (productTypeList.isEmpty()) {
                request.setAttribute(PRODUCT_TYPE_LIST, null);
            } else {
                request.setAttribute(PRODUCT_TYPE_LIST, productTypeList);
            }

            Product product;
            ProductContent productContent;
            ProductError productError = new ProductError();
            ProductFacade productFacade = new ProductFacade();
            ProductContentFacade productContentFacade = new ProductContentFacade();
            boolean hasError = false;

            if (nameProduct != null && imageProduct != null && brandProduct != null && quantityProduct != null && priceProduct != null && productType != null) {
                if (nameProduct.equals("")) {
                    hasError = true;
                    productError.setProductNameError("Please enter name product!");
                } else if (nameProduct.length() > 50) {
                    hasError = true;
                    productError.setProductNameError("Please enter less than 50 characters!");
                } else if (imageProduct.equals("")) {
                    hasError = true;
                    productError.setImageProductError("Please choose image product!");
                } else if (brandProduct.equals("")) {
                    hasError = true;
                    productError.setProductBrandError("Please select brand product!");
                } else if (productType.equals("")) {
                    hasError = true;
                    productError.setProductTypeError("Please select product type!");
                } else if (quantityProduct.equals("")) {
                    hasError = true;
                    productError.setQuantityError("Please enter quantity product!");
                } else if (priceProduct.equals("")) {
                    hasError = true;
                    productError.setProductPriceError("Please enter price product!");
                }
            } else {
                if (descriptionProduct.equals("")) {
                    hasError = true;
                    productError.setProductDescriptionError("Please enter description product!");
                } else if (contentProduct.equals("")) {
                    hasError = true;
                    productError.setProductContentError("Please enter content product!");
                }
            }

            if (hasError) {
                if (nameProduct != null && imageProduct != null && brandProduct != null && quantityProduct != null && priceProduct != null && productType != null) {
                    request.setAttribute(CURRENT_PAGE, CURRENT_PAGE);
                    request.setAttribute(NAME_PRODUCT, nameProduct);
                    request.setAttribute(BRAND_PRODUCT, brandProduct);
                    request.setAttribute(PRODUCT_TYPE, productType);
                    request.setAttribute(QUANTITY_PRODUCT, quantityProduct);
                    request.setAttribute(PRICE_PRODUCT, priceProduct);
                    request.setAttribute(ADD_PRODUCT_ERROR, productError);
                } else {
                    request.removeAttribute(CURRENT_PAGE);
                    request.setAttribute(CHANGE_PAGE_STEP_2, CHANGE_PAGE_STEP_2);
                    request.setAttribute(DESCRIPTION_PRODUCT, descriptionProduct);
                    request.setAttribute(CONTENT_PRODUCT, contentProduct);
                    request.setAttribute(ADD_PRODUCT_ERROR, productError);
                }

                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/AddProduct.jsp");
                requestDispatcher.forward(request, response);
            } else {
                product = new Product();
                productContent = new ProductContent();

                if (nameProduct != null && imageProduct != null && brandProduct != null && quantityProduct != null && priceProduct != null && productType != null) {
                    String[] cutCodeImage = imageProduct.split("\\,");
                    String productID = FunctionRandom.randomID(10);
                    tmpProductID = productID;

                    if (discountProduct.equals("")) {
                        discountProduct = "0";
                    }

                    product.setProductId(productID);
                    product.setProductName(nameProduct);
                    product.setImageProduct(cutCodeImage[1]);
                    product.setBrandId(brandProduct);
                    product.setProductPrice(Integer.parseInt(priceProduct));
                    product.setProductDiscount(Integer.parseInt(discountProduct));
                    product.setProductTypeId(productType);
                    product.setQuantity(Integer.parseInt(quantityProduct));

                    boolean checkAddProduct = productFacade.addProduct(product);
                    if (checkAddProduct) {
                        request.removeAttribute(CURRENT_PAGE);
                        request.setAttribute(CHANGE_PAGE_STEP_2, CHANGE_PAGE_STEP_2);
                    }
                } else {
                    String productContentID = FunctionRandom.randomID(10);

                    productContent.setProductContentId(productContentID);
                    productContent.setProductId(tmpProductID);
                    productContent.setProductDescription(descriptionProduct);
                    productContent.setProductContent(contentProduct);

                    boolean checkAddProductContent = productContentFacade.addProductContent(productContent);
                    if (checkAddProductContent) {
                        request.removeAttribute(CHANGE_PAGE_STEP_2);
                        request.setAttribute(CURRENT_PAGE, CURRENT_PAGE);
                        request.setAttribute(ADD_PRODUCT_SUCCESS, ADD_PRODUCT_SUCCESS);
                    }
                }

                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/AddProduct.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
            e.printStackTrace();
//            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

}
