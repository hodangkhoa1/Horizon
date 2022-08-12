package com.team.horizon.controllers;

import com.team.horizon.dbo.AccountFacade;
import com.team.horizon.dbo.NotificationFacade;
import com.team.horizon.models.Account;
import com.team.horizon.models.AccountError;
import com.team.horizon.models.Notification;
import com.team.horizon.utils.Encrypt;
import com.team.horizon.utils.FunctionRandom;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

public class RegisterController extends HttpServlet {
    
    private static final String INTRO_USER = "INTRO_USER";
    private static final String WELCOME_USER = "WELCOME_USER";
    private static final String SIGN_UP_ACCOUNT_ERROR = "SIGN_UP_ACCOUNT_ERROR";
    private static final String SECRET_KEY = "ssshhhhhhhhhhh!!!!";
    private static final String USERNAME_REGISTER = "USERNAME_REGISTER";
    private static final String EMAIL_REGISTER = "USERNAME_REGISTER";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            String signupUsername = request.getParameter("signupUsername");
            String signupEmail = request.getParameter("signupEmail");
            String signupPassword = request.getParameter("signupPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String newPassword = DigestUtils.md5Hex(signupPassword);
            String userID = FunctionRandom.randomID(10);

            Account account;
            Notification notification;
            AccountError accountError = new AccountError();
            AccountFacade accountFacade = new AccountFacade();
            boolean hasError = false;

            if(signupUsername.equals("")) {
                hasError = true;
                accountError.setUsernameError("Please enter your username!");
            } else if(signupEmail.equals("")) {
                hasError = true;
                accountError.setEmailError("Please enter your email!");
            } else if(signupPassword.equals("")) {
                hasError = true;
                accountError.setPasswordError("Please enter your password!");
            } else if(confirmPassword.equals("")) {
                hasError = true;
                accountError.setConfirmPasswordError("Please enter your confirm password!");
            } else if(!signupPassword.equals(confirmPassword)) {
                hasError = true;
                accountError.setConfirmPasswordError("Password does not match!");
            } else {
                String colorAvatar = FunctionRandom.colorAvatar();
                char getFirstCharacter = signupUsername.charAt(0);
                
                account = new Account();
                account.setUserName(signupUsername);
                account.setEmail(signupEmail);
                account.setPasswordHash(newPassword);
                account.setUserId(userID);
                account.setDefaultAvatar(Character.toString(getFirstCharacter));
                account.setColorAvatar(colorAvatar);

                Account checkAccount = accountFacade.checkAccount(signupEmail);
                if(checkAccount == null) {
                    String message = accountFacade.registerAccount(account);
                    if(!message.equals("success")) {
                        hasError = true;
                        accountError.setUsernameError("System error please try again!");
                    }
                } else {
                    hasError = true;
                    accountError.setUsernameError("Account already exists!");
                }
            }

            if(hasError) {
                request.setAttribute(SIGN_UP_ACCOUNT_ERROR, accountError);
                request.setAttribute(USERNAME_REGISTER, signupUsername);
                request.setAttribute(EMAIL_REGISTER, signupEmail);
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/Login.jsp");
                requestDispatcher.forward(request, response);
            } else {
                notification = new Notification();
                notification.setNotifyId(FunctionRandom.randomID(10));
                notification.setUserId(userID);
                notification.setNotifyType("NewAccount");
                NotificationFacade checkNotification = new NotificationFacade();
                boolean addNotificationDone = checkNotification.insertNotification(notification);
                if(addNotificationDone) {
                    String encryptedUsername = Encrypt.encrypt(signupUsername, SECRET_KEY);
                    HttpSession session = request.getSession();
                    session.setAttribute(INTRO_USER, encryptedUsername);
                    session.setAttribute(WELCOME_USER, encryptedUsername);
                    session.setMaxInactiveInterval(500);
                    response.sendRedirect(request.getContextPath() + "/verify");
                }
            }
        } catch (Exception e) {
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
