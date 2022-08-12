package com.team.horizon.controllers;

import com.team.horizon.dbo.BrandFacade;
import com.team.horizon.dbo.ProductFacade;
import com.team.horizon.dbo.ProductTypeFacade;
import com.team.horizon.models.Brand;
import com.team.horizon.models.Product;
import com.team.horizon.models.ProductType;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeController extends HttpServlet {

    private static final String CAROUSEL_PRODUCT = "CAROUSEL_PRODUCT";
    private static final String BRAND_LIST = "BRAND_LIST";
    private static final String PRODUCT_TYPE_LIST = "PRODUCT_TYPE_LIST";
    private static final String CATEGORY_PRODUCT = "CATEGORY_PRODUCT";
    private static final String END_PAGE = "END_PAGE";
    private static final String CURRENT_PAGE = "CURRENT_PAGE";
    private static final String SMART_WATCH = "SMART_WATCH";
    private static final String MODULE_WIFI = "MODULE_WIFI";
    private static final String WEBCAM = "WEBCAM";
    private static final String RADIATOR_BASE = "RADIATOR_BASE";
    private static final String GAMING_CONSOLE = "GAMING_CONSOLE";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String indexPage = request.getParameter("page");

            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            ProductFacade productFacade = new ProductFacade();
            BrandFacade brandFacade = new BrandFacade();
            ProductTypeFacade productTypeFacade = new ProductTypeFacade();

            List<Product> carouselProduct = productFacade.getAllProduct("top8Course");
            List<Product> categoryProduct = productFacade.getProduct(index, "top8CourseWithType");
            List<Product> smartwatchList = productFacade.getProduct("A75YbCKU99", "getProductWithCategory");
            List<Product> moduleWifiList = productFacade.getProduct("WvGl2UmvhM", "getProductWithCategory");
            List<Product> webcamList = productFacade.getProduct("kY3z8oAYp0", "getProductWithCategory");
            List<Product> radiatorList = productFacade.getProduct("z8SA3vVqGb", "getProductWithCategory");
            List<Product> gamingConsoleList = productFacade.getProduct("MjIpr046KF", "getProductWithCategory");
            List<Brand> brandList = brandFacade.getAllBrand();
            List<ProductType> productTypeList = productTypeFacade.getAllProductType();
            
            request.setAttribute(SMART_WATCH, smartwatchList);
            request.setAttribute(MODULE_WIFI, moduleWifiList);
            request.setAttribute(WEBCAM, webcamList);
            request.setAttribute(RADIATOR_BASE, radiatorList);
            request.setAttribute(GAMING_CONSOLE, gamingConsoleList);
            
            if (carouselProduct.isEmpty()) {
                request.setAttribute(CAROUSEL_PRODUCT, null);
            } else {
                request.setAttribute(CAROUSEL_PRODUCT, carouselProduct);
            }

            if (categoryProduct.isEmpty()) {
                request.setAttribute(CATEGORY_PRODUCT, null);
            } else {
                request.setAttribute(CATEGORY_PRODUCT, categoryProduct);
            }

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

            int countProduct = productFacade.countProduct("SQL_GET_TOTAL_PRODUCT_WITH_TYPE_LATOP", "Laptop");
            int endPage = countProduct / 8;
            if (countProduct % 8 != 0) {
                endPage++;
            }

            request.setAttribute(END_PAGE, endPage);
            request.setAttribute(CURRENT_PAGE, index);

            RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/user/Home.jsp");
            requestDispatcher.forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
            response.sendRedirect(request.getContextPath() + "/error");
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
