package com.team.horizon.controllers;

import com.team.horizon.dbo.AccountFacade;
import com.team.horizon.models.Account;
import com.team.horizon.models.AccountError;
import com.team.horizon.utils.FunctionRandom;
import com.team.horizon.utils.FunctionSendEmail;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

public class ForgotPasswordController extends HttpServlet {

    private static final String FORGOT_ACCOUNT_ERROR = "FORGOT_ACCOUNT_ERROR";
    private static final String CURRENT_PAGE = "CURRENT_PAGE";
    private static final String CHANGE_PAGE_PASSWORD = "CHANGE_PAGE_PASSWORD";
    private static final String CHANGE_PAGE_VERIFY = "CHANGE_PAGE_VERIFY";
    private static final String CHANGE_PASSWORD_SUCCESS = "CHANGE_PASSWORD_SUCCESS";
    private static final String EMAIL = "EMAIL";
    private String codeVerify, tmpNewPassword, tmpEmail, tmpOldPassword, tmpUsername;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute(CURRENT_PAGE, CURRENT_PAGE);
        RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/ForgotPassword.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String email = request.getParameter("email");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String verifySMS = request.getParameter("verifySMS");

            Account account;
            AccountError accountError = new AccountError();
            AccountFacade accountFacade = new AccountFacade();
            boolean hasError = false;

            if (email != null) {
                if (email.equals("")) {
                    hasError = true;
                    accountError.setEmailError("Please enter your email!");
                } else {
                    Account checkAccount = accountFacade.checkAccount(email);
                    tmpEmail = email;

                    if (checkAccount == null) {
                        hasError = true;
                        accountError.setEmailError("Account does not exist!");
                    } else {
                        tmpOldPassword = checkAccount.getPasswordHash();
                        tmpUsername = checkAccount.getUserName();
                    }
                }
            } else if (oldPassword != null && newPassword != null && confirmPassword != null) {
                if (oldPassword.equals("")) {
                    hasError = true;
                    accountError.setPasswordError("Please enter old password!");
                } else if (newPassword.equals("")) {
                    hasError = true;
                    accountError.setNewPasswordError("Please enter new password!");
                } else if (confirmPassword.equals("")) {
                    hasError = true;
                    accountError.setConfirmPasswordError("Please enter confirm password!");
                } else if (!newPassword.equals(confirmPassword)) {
                    hasError = true;
                    accountError.setConfirmPasswordError("Password does not match!");
                } else {
                    String hashOldPassword = DigestUtils.md5Hex(oldPassword);
                    String hashNewPassword = DigestUtils.md5Hex(newPassword);
                    tmpNewPassword = hashNewPassword;

                    if (!hashOldPassword.equals(tmpOldPassword)) {
                        hasError = true;
                        accountError.setPasswordError("Wrong password, please try again!");
                    }
                }
            } else {
                if (verifySMS.equals("")) {
                    hasError = true;
                    accountError.setVerifySMSError("Please enter code verify!");
                } else if (!verifySMS.equals(codeVerify)) {
                    hasError = true;
                    accountError.setVerifySMSError("Verification code is not correct!");
                }
            }

            if (hasError) {
                if (email != null) {
                    request.setAttribute(CURRENT_PAGE, CURRENT_PAGE);
                    request.setAttribute(EMAIL, email);
                } else if (oldPassword != null && newPassword != null && confirmPassword != null) {
                    request.removeAttribute(CURRENT_PAGE);
                    request.setAttribute(CHANGE_PAGE_PASSWORD, CHANGE_PAGE_PASSWORD);
                } else if (verifySMS != null) {
                    request.removeAttribute(CHANGE_PAGE_PASSWORD);
                    request.setAttribute(CHANGE_PAGE_VERIFY, CHANGE_PAGE_VERIFY);
                }
                request.setAttribute(FORGOT_ACCOUNT_ERROR, accountError);
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/ForgotPassword.jsp");
                requestDispatcher.forward(request, response);
            } else {
                account = new Account();
                account.setPasswordHash(tmpNewPassword);
                account.setEmail(tmpEmail);
                account.setUserName(tmpUsername);

                if (email != null) {
                    request.setAttribute(CHANGE_PAGE_PASSWORD, CHANGE_PAGE_PASSWORD);
                    request.removeAttribute(CURRENT_PAGE);
                    RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/ForgotPassword.jsp");
                    requestDispatcher.forward(request, response);
                } else if (oldPassword != null && newPassword != null && confirmPassword != null) {
                    request.setAttribute(CHANGE_PAGE_VERIFY, CHANGE_PAGE_VERIFY);
                    request.removeAttribute(CHANGE_PAGE_PASSWORD);
                    codeVerify = FunctionRandom.randomVerifyCode(4);
                    FunctionSendEmail functionSendEmail = new FunctionSendEmail(account, "Verification code", codeVerify);
                    functionSendEmail.sendMailChangePassword();
                    RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/ForgotPassword.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    if (verifySMS.equals(codeVerify)) {
                        boolean checkUpdate = accountFacade.update(account, "ChangePassword");
                        if (checkUpdate) {
                            request.setAttribute(CHANGE_PASSWORD_SUCCESS, CHANGE_PASSWORD_SUCCESS);
                            RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/ForgotPassword.jsp");
                            requestDispatcher.forward(request, response);
                        }
                    }
                }
            }
        } catch (IOException | SQLException | ServletException e) {
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

}
