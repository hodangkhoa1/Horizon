package com.team.horizon.controllers;

import com.team.horizon.dbo.ProductFacade;
import com.team.horizon.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductManagementController extends HttpServlet {

    private static final String PRODUCTS_ADMIN_LIST = "PRODUCTS_ADMIN_LIST";
    private static final String END_PAGE = "END_PAGE";
    private static final String CURRENT_PAGE = "CURRENT_PAGE";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String indexPage = request.getParameter("page");
            String courseID = request.getParameter("courseID");
            ProductFacade productFacade = new ProductFacade();
            PrintWriter printWriter = response.getWriter();

            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            List<Product> productList;

            if (courseID != null) {
                boolean checkDeleteCourse = productFacade.deleteProduct(courseID);
                if (checkDeleteCourse) {
                    productList = productFacade.getAllProduct("top4Course");
                    returnPrintWriter(printWriter, productList, request);
                }
            } else {
                int countCourse = productFacade.countProduct("SQL_GET_TOTAL_PRODUCT", "");
                int endPage = countCourse / 5;
                if (countCourse % 5 != 0) {
                    endPage++;
                }

                productList = productFacade.getProduct(index, "pagingProduct");
                if (productList.isEmpty()) {
                    request.setAttribute(PRODUCTS_ADMIN_LIST, null);
                } else {
                    sortProductName(productList);
                    request.setAttribute(PRODUCTS_ADMIN_LIST, productList);
                }

                request.setAttribute(END_PAGE, endPage);
                request.setAttribute(CURRENT_PAGE, index);
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/ProductManagement.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private void sortProductName(List<Product> courseList) {
        Comparator<Product> comparator = new Comparator<Product>() {
            @Override
            public int compare(Product product1, Product product2) {
                return product1.getProductName().compareTo(product2.getProductName());
            }
        };
        courseList.sort(comparator);
    }

    private void returnPrintWriter(PrintWriter printWriter, List<Product> productList, HttpServletRequest request) {
        for (Product product : productList) {
            SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MM-yyyy");
            String productCreated = dateFormatter.format(product.getProductCreated());

            printWriter.println("<tr>\n"
                    + "                                    <td>"+ product.getProductId() +"</td>\n"
                    + "                                    <td>\n"
                    + "                                        <img src=\"data:image/png;base64,"+ product.getImageProduct() +"\" alt=\""+ product.getProductName() +"\" />\n"
                    + "                                    </td>\n"
                    + "                                    <td>"+ product.getProductName() +"</td>\n"
                    + "                                    <td>"+ product.getProductPrice() +"</td>\n"
                    + "                                    <td>"+ product.getProductDiscount() +"</td>\n"
                    + "                                    <td>"+ product.getQuantity() +"</td>\n"
                    + "                                    <td>"+ productCreated +"</td>\n"
                    + "                                    <td>\n"
                    + "                                        <div class=\"table-action-button\">\n"
                    + "                                            <button type=\"button\" class=\"users-control btn btn-success\">Edit</button>\n"
                    + "                                            <button type=\"button\" onclick=\"deleteProduct(this.value, '"+ request.getContextPath() +"/admin/product-management')\" value=\""+ product.getProductId() +"\" class=\"users-control btn btn-danger\">Delete</button>\n"
                    + "                                        </div>\n"
                    + "                                    </td>\n"
                    + "                                </tr>");
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
