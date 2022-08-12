/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.controllers;

import com.team.horizon.dbo.AccountFacade;
import com.team.horizon.models.Account;
import com.team.horizon.models.AccountError;
import java.io.IOException;
import java.sql.Date;
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
public class EditProfileAdminController extends HttpServlet {
    
    private static final String EDIT_PROFILE_ERROR = "EDIT_PROFILE_ERROR";
    private static final String USERNAME = "USERNAME";
    private static final String PHONE_NUMBER = "PHONE_NUMBER";
    private static final String ADDRESS = "ADDRESS";
    private static final String LOGIN_ADMIN = "LOGIN_ADMIN";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/EditProfile.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String sex = request.getParameter("userSex");
            String dateOfBirth = request.getParameter("dateOfBirth");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String imageAvatar = request.getParameter("imageAvatar");

            Account account;
            AccountFacade accountFacade = new AccountFacade();
            AccountError accountError = new AccountError();
            boolean hasError = false;

            if (username.equals("") && phoneNumber.equals("") && address.equals("")) {
                hasError = true;
                accountError.setUsernameError("Please enter your username!");
                accountError.setPhoneNumberError("Please enter your phone number!");
                accountError.setAddressError("Please enter your address!");
            } else if (username.equals("")) {
                hasError = true;
                accountError.setUsernameError("Please enter your username!");
            } else if (phoneNumber.equals("")) {
                hasError = true;
                accountError.setPhoneNumberError("Please enter your phone number!");
            } else if (address.equals("")) {
                hasError = true;
                accountError.setAddressError("Please enter your address!");
            }

            if (hasError) {
                request.setAttribute(USERNAME, username);
                request.setAttribute(PHONE_NUMBER, phoneNumber);
                request.setAttribute(ADDRESS, address);
                request.setAttribute(EDIT_PROFILE_ERROR, accountError);
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/EditProfile.jsp");
                requestDispatcher.forward(request, response);
            } else {
                HttpSession session = request.getSession();
                String gender;
                
                if (sex.equals("Male")) {
                    gender = "M";
                } else {
                    gender = "F";
                }

                account = new Account();
                account.setUserName(username);
                account.setEmail(email);
                account.setSex(gender);
                if (dateOfBirth != null) {
                    Date convertDateOfBirth = Date.valueOf(dateOfBirth);
                    account.setDateOfBirth(convertDateOfBirth);
                }
                account.setPhoneNumber(phoneNumber);
                if (imageAvatar != null) {
                    String[] cutCodeImage = imageAvatar.split("\\,");
                    account.setImageAvatar(cutCodeImage[1]);
                }
                account.setUserAddress(address);

                boolean checkAddProduct = accountFacade.update(account, "EditProfile");
                if (checkAddProduct) {
                    Account getAccountCurrent = accountFacade.checkAccount(email);
                    session.setAttribute(LOGIN_ADMIN, getAccountCurrent);
                }
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/admin/info-profile");
                requestDispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
//            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

}
