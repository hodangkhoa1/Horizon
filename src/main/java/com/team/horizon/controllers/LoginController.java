package com.team.horizon.controllers;

import com.team.horizon.dbo.AccountFacade;
import com.team.horizon.dbo.CartFacade;
import com.team.horizon.dbo.NotificationFacade;
import com.team.horizon.models.Account;
import com.team.horizon.models.AccountError;
import com.team.horizon.models.Notification;
import com.team.horizon.utils.CalculatorTime;
import com.team.horizon.utils.Encrypt;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;

public class LoginController extends HttpServlet {

    private static final String LOGIN_ADMIN = "LOGIN_ADMIN";
    private static final String LOGIN_USER = "LOGIN_USER";
    private static final String LOGIN_ACCOUNT_ERROR = "LOGIN_ACCOUNT_ERROR";
    private static final String NOTIFICATION_LIST = "NOTIFICATION_LIST";
    private static final String TIME_NOTIFICATION = "TIME_NOTIFICATION";
    private static final String COUNT_NOTIFICATION_NOT_READ = "COUNT_NOTIFICATION_NOT_READ";
    private static final String REMEMBER_USER = "USER_HORIZON";
    private static final String SECRET_KEY = "ssshhhhhhhhhhh!!!!";
    private static final int TIME_COOKIE = 60 * 60 * 24;
    private static final String USERNAME = "USERNAME";
    private static final String TOTAL_CART = "TOTAL_CART";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/Login.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String username = request.getParameter("signinUsername");
            String password = request.getParameter("signinPassword");
            String hashPassword = DigestUtils.md5Hex(password);
            String rememberMeString = request.getParameter("rememberMe");
            boolean rememberMe = "Y".equals(rememberMeString);

            Account account = null;
            AccountError accountError = new AccountError();
            CartFacade cartFacade = new CartFacade();
            boolean hasError = false;
            Cookie cookieUserName;

            if (username.equals("") && password.equals("")) {
                hasError = true;
                accountError.setUsernameError("Please enter your username!");
                accountError.setPasswordError("Please enter your password!");
            } else if (username.equals("")) {
                hasError = true;
                accountError.setUsernameError("Please enter your username!");
            } else if (password.equals("")) {
                hasError = true;
                accountError.setPasswordError("Please enter your password!");
            } else {
                AccountFacade checkLogin = new AccountFacade();
                account = checkLogin.checkAccount(username);
                if (account == null) {
                    hasError = true;
                    accountError.setUsernameError("Account does not exist!");
                } else if (account.getActiveAccount() == 0) {
                    hasError = true;
                    accountError.setUsernameError("Account not activated!");
                } else if (account.getDisableAccount() == 1) {
                    hasError = true;
                    accountError.setUsernameError("Your account has been locked!");
                } else if (!hashPassword.equals(account.getPasswordHash())) {
                    hasError = true;
                    accountError.setPasswordError("Wrong password, please try again!");
                }
            }

            if (hasError) {
                request.setAttribute(LOGIN_ACCOUNT_ERROR, accountError);
                request.setAttribute(USERNAME, username);
                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/Login.jsp");
                requestDispatcher.forward(request, response);
            } else {
                HttpSession session = request.getSession();
                String encryptedUsername = Encrypt.encrypt(username, SECRET_KEY);

                if (rememberMe) {
                    cookieUserName = new Cookie(REMEMBER_USER, encryptedUsername);
                    cookieUserName.setMaxAge(TIME_COOKIE);
                } else {
                    cookieUserName = new Cookie(REMEMBER_USER, null);
                    cookieUserName.setMaxAge(0);
                }
                response.addCookie(cookieUserName);

                if (account.getIsAdmin() == 1) {
                    session.setAttribute(LOGIN_ADMIN, account);
                    session.setMaxInactiveInterval(500);
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                } else {
                    NotificationFacade checkNotification = new NotificationFacade();
                    List<Notification> notificationList = checkNotification.getAllNotification(account.getUserId());

                    if (notificationList.isEmpty()) {
                        session.setAttribute(NOTIFICATION_LIST, null);
                    } else {
                        NotificationFacade notificationFacade = new NotificationFacade();
                        SimpleDateFormat dateFormatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
                        String currentDateString = dateFormatter.format(Calendar.getInstance().getTime());
                        Date currentDate = dateFormatter.parse(currentDateString);
                        String pastTimeInSecond = dateFormatter.format(account.getAccountCreated());
                        Date pastDate = dateFormatter.parse(pastTimeInSecond);
                        int totalNotification = notificationFacade.countNotification(account.getUserId());
                        session.setAttribute(TIME_NOTIFICATION, CalculatorTime.timeAgo(currentDate, pastDate));
                        session.setAttribute(NOTIFICATION_LIST, notificationList);
                        if (totalNotification == 0) {
                            session.setAttribute(COUNT_NOTIFICATION_NOT_READ, null);
                        } else {
                            session.setAttribute(COUNT_NOTIFICATION_NOT_READ, totalNotification);
                        }
                    }
                    session.setAttribute(TOTAL_CART, cartFacade.countCart(account.getUserId()));
                    session.setAttribute(LOGIN_USER, account);
                    session.setMaxInactiveInterval(500);
                    String uri = (String) session.getAttribute("uri");
                    if (uri != null) {
                        response.sendRedirect(uri);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home");
                    }
                }
            }
        } catch (IOException | SQLException | ParseException | ServletException e) {
            response.sendRedirect(request.getContextPath() + "/error");
        }
    }

}
