package com.team.horizon.controllers;

import com.team.horizon.dbo.ProductFacade;
import com.team.horizon.dbo.ProductTypeFacade;
import com.team.horizon.models.Account;
import com.team.horizon.models.GoogleAccount;
import com.team.horizon.models.Product;
import com.team.horizon.models.ProductType;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class ProductController extends HttpServlet {

    private static final String PRODUCT_LIST = "PRODUCT_LIST";
    private static final String PRODUCT_CATEGORY = "PRODUCT_CATEGORY";
    private static final String TOTAL_PRODUCT_LIST = "TOTAL_PRODUCT_LIST";
    private static final String TOTAL_PRODUCT_TYPE_ID_LIST = "TOTAL_PRODUCT_TYPE_ID_LIST";
    private static final String TOTAL_PRODUCT_BRAND_ID_LIST = "TOTAL_PRODUCT_BRAND_ID_LIST";
    private static final String NOT_EMPTY = "NOT_EMPTY";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String categoryId = request.getParameter("categoryId");
            String productAmount = request.getParameter("productExits");
            String textSearch = request.getParameter("search");
            PrintWriter printWriter = response.getWriter();

            ProductFacade productFacade = new ProductFacade();
            ProductTypeFacade productTypeFacade = new ProductTypeFacade();

            List<Product> productList;
            List<ProductType> productTypeList = productTypeFacade.getAllProductType();

            if (categoryId != null) {
                productList = productFacade.getProduct(categoryId, "getProductWithCategory");
                returnPrintWriter(productList, printWriter, request);
            } else if (productAmount != null) {
                int productAmountInt = Integer.parseInt(productAmount);
                productList = productFacade.getProduct(productAmountInt, "getNext6Course");
                returnPrintWriter(productList, printWriter, request);
            } else if (textSearch != null) {
                productList = productFacade.getProduct(textSearch, "searchByName");
                returnPrintWriter(productList, printWriter, request);
            } else {
                String brandId = request.getParameter("brand");
                String productTypeID = request.getParameter("type");

                if (brandId != null) {
                    productList = productFacade.getProduct(brandId, "getProductWithBrand");
                    request.setAttribute(TOTAL_PRODUCT_BRAND_ID_LIST, productFacade.countProduct("SQL_GET_TOTAL_PRODUCT_WITH_BRAND_ID", brandId));
                    request.setAttribute(NOT_EMPTY, NOT_EMPTY);
                } else if (productTypeID != null) {
                    productList = productFacade.getProduct(productTypeID, "getProductWithCategory");
                    request.setAttribute(TOTAL_PRODUCT_TYPE_ID_LIST, productFacade.countProduct("SQL_GET_TOTAL_PRODUCT_WITH_TYPE_ID", productTypeID));
                    request.setAttribute(NOT_EMPTY, NOT_EMPTY);
                } else {
                    productList = productFacade.getAllProduct("top6Course");
                    request.setAttribute(TOTAL_PRODUCT_LIST, productFacade.countProduct("SQL_GET_TOTAL_PRODUCT", ""));
                }

                request.setAttribute(PRODUCT_LIST, productList);
                if (productTypeList.isEmpty()) {
                    request.setAttribute(PRODUCT_CATEGORY, null);
                } else {
                    request.setAttribute(PRODUCT_CATEGORY, productTypeList);
                }

                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/user/Product.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (IOException | SQLException | ServletException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

    private void returnPrintWriter(List<Product> productList, PrintWriter printWriter, HttpServletRequest request) {
        if (productList.isEmpty()) {
            returnEmptyList(printWriter);
        } else {
            for (Product product : productList) {
                printWriter.println("<div class=\"product-amount col mb-5\">\n"
                        + "                                    <div class=\"card h-100\">\n"
                        + "                                        <div class=\"card-image\">\n"
                        + "                                            <img class=\"card-img-top\" src=\"data:image/png;base64," + product.getImageProduct() + "\" alt=\"" + product.getProductName() + "\" />\n"
                        + "                                        </div>\n"
                        + "                                        <div class=\"card-body p-4\">\n"
                        + "                                            <div class=\"text-center\">\n"
                        + "                                                <h5 class=\"fw-bolder\">" + product.getProductName() + "</h5>\n"
                        + "                                                " + formatMoney(product) + "\n"
                        + "                                            </div>\n"
                        + "                                        </div>\n"
                        + "                                        <div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">\n"
                        + "                                            <div class=\"text-center\">\n"
                        + "                                                <button onclick=\"buttonAddCart('" + getSessionId(request) + "', '" + request.getContextPath() + "/detail?product=" + product.getProductId() + "')\" class=\"btn btn-outline-dark mt-auto\">See More</button>\n"
                        + "                                            </div>\n"
                        + "                                        </div>\n"
                        + "                                    </div>\n"
                        + "                                </div>");
            }
        }
    }

    private void returnEmptyList(PrintWriter printWriter) {
        printWriter.println("<lottie-player src=\"https://assets2.lottiefiles.com/private_files/lf30_cgfdhxgx.json\" background=\"transparent\" speed=\"1\" loop autoplay class=\"empty-product\"></lottie-player>");
    }

    private String formatMoney(Product product) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        String convertMoney = formatter.format(product.getProductPrice()) + " VNĐ";
        String template;

        if (product.getProductDiscount() == 0) {
            template = convertMoney;
        } else {
            String convertDiscount = formatter.format(product.getProductPrice() * (100 - product.getProductDiscount()) / 100) + " VNĐ";
            template = "<span class=\"text-muted text-decoration-line-through\">" + convertMoney + "</span>\n"
                    + "                                                    " + convertDiscount + "";
        }

        return template;
    }

    private String getSessionId(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Account getAccountId = (Account) session.getAttribute("LOGIN_USER");
        GoogleAccount getGoogleAccountId = (GoogleAccount) session.getAttribute("GOOGLE_USER");

        if (getAccountId != null) {
            return getAccountId.getUserId();
        } else if (getGoogleAccountId != null) {
            return getGoogleAccountId.getId();
        } else {
            return "";
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
