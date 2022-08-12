package com.team.horizon.controllers;

import com.team.horizon.dbo.CartFacade;
import java.io.IOException;
import java.sql.SQLException;
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
public class PaymentController extends HttpServlet {

    private static final String TOTAL_MONEY = "TOTAL_MONEY";
    private static final String TOTAL_CART = "TOTAL_CART";
    private String storeTotal;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String totalMoney = request.getParameter("total");
        storeTotal = totalMoney;
        request.setAttribute(TOTAL_MONEY, totalMoney);

        RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/user/Payment.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String district = request.getParameter("district");
            String ward = request.getParameter("ward");

            CartFacade cartFacade = new CartFacade();
            HttpSession session = request.getSession();

            boolean checkDeletAllCart = cartFacade.deleteAll(email);
            if (checkDeletAllCart) {
                session.setAttribute(TOTAL_CART, 0);
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/home");
                requestDispatcher.forward(request, response);
            }

            request.setAttribute(TOTAL_MONEY, storeTotal);
            RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/user/Product.jsp");
            requestDispatcher.forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

}
