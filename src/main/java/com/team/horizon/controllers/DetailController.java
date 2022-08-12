package com.team.horizon.controllers;

import com.team.horizon.dbo.CartFacade;
import com.team.horizon.dbo.ProductContentFacade;
import com.team.horizon.dbo.ProductFacade;
import com.team.horizon.dbo.ProductTypeFacade;
import com.team.horizon.models.Cart;
import com.team.horizon.models.Product;
import com.team.horizon.models.ProductContent;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
public class DetailController extends HttpServlet {

    private static final String PRODUCT_DETAIL = "PRODUCT_DETAIL";
    private static final String PRODUCT_CONTENT = "PRODUCT_CONTENT";
    private static final String RELATE_PRODUCT = "RELATE_PRODUCT";
    private static final String PRODUCT_TYPE_LIST = "PRODUCT_TYPE_LIST";
    private static final String TOTAL_CART = "TOTAL_CART";
    private String PRODUCT_DETAIL_ID;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String detailProduct = request.getParameter("product");
            String userID = request.getParameter("userID");
            String imageProduct = request.getParameter("imageProduct");
            String productName = request.getParameter("productName");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");

            ProductFacade productFacade = new ProductFacade();
            ProductTypeFacade productTypeFacade = new ProductTypeFacade();
            ProductContentFacade productContentFacade = new ProductContentFacade();
            CartFacade cartFacade = new CartFacade();
            HttpSession session = request.getSession();
            Product product;
            Cart cart;
            ProductContent productContent;
            List<Product> relatedProducts = productFacade.getAllProduct("top4Course");
            List<ProductType> productTypeList = productTypeFacade.getAllProductType();

            if (detailProduct != null) {
                PRODUCT_DETAIL_ID = detailProduct;
                product = productFacade.checkProduct(detailProduct);
                productContent = productContentFacade.getProductContent(detailProduct);
                request.setAttribute(PRODUCT_DETAIL, product);
                request.setAttribute(PRODUCT_CONTENT, productContent);
            } else if (userID != null && imageProduct != null && productName != null && quantity != null && price != null) {
                String cartID = FunctionRandom.randomID(10);

                cart = new Cart();
                cart.setCartId(cartID);
                cart.setUserId(userID);
                cart.setImageProduct(imageProduct);
                cart.setProductName(productName);
                cart.setQuantity(Integer.parseInt(quantity));
                cart.setPrice(Integer.parseInt(price.replaceAll(",", "")));

                Cart checkProductExist = cartFacade.checkProduct(productName);

                if (checkProductExist == null) {
                    cartFacade.addCart(cart);
                } else {
                    cartFacade.update(cart);
                }

                product = productFacade.checkProduct(PRODUCT_DETAIL_ID);
                productContent = productContentFacade.getProductContent(PRODUCT_DETAIL_ID);
                request.setAttribute(PRODUCT_DETAIL, product);
                request.setAttribute(PRODUCT_CONTENT, productContent);
                session.setAttribute(TOTAL_CART, cartFacade.countCart(userID));
            }

            if (relatedProducts.isEmpty()) {
                request.setAttribute(RELATE_PRODUCT, null);
            } else {
                request.setAttribute(RELATE_PRODUCT, relatedProducts);
            }

            if (productTypeList.isEmpty()) {
                request.setAttribute(PRODUCT_TYPE_LIST, null);
            } else {
                request.setAttribute(PRODUCT_TYPE_LIST, productTypeList);
            }

            RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/user/Detail.jsp");
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
