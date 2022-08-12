package com.team.horizon.controllers;

import com.team.horizon.dbo.AccountFacade;
import com.team.horizon.models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Comparator;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserManagementController extends HttpServlet {

    private static final String ACCOUNT_LIST = "ACCOUNT_LIST";
    private static final String END_PAGE = "END_PAGE";
    private static final String CURRENT_PAGE = "CURRENT_PAGE";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String indexPage = request.getParameter("page");
            String userID = request.getParameter("userID");
            String searchAccount = request.getParameter("search");
            
            Account account = new Account();
            AccountFacade accountFacade = new AccountFacade();
            PrintWriter printWriter = response.getWriter();

            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            List<Account> accountList;

            if (userID != null) {
                String actionButton = request.getParameter("action");
                account.setUserId(userID);
                boolean checkDisableAccount = accountFacade.update(account, actionButton);
                if (checkDisableAccount) {
                    accountList = accountFacade.pagingAccount(index);
                    returnPrintWriter(printWriter, accountList, request);
                }
            } else if (searchAccount != null) {
                if (!searchAccount.equals("")) {
                    accountList = accountFacade.searchAccount(searchAccount);
                } else {
                    accountList = accountFacade.pagingAccount(index);
                }
                returnPrintWriter(printWriter, accountList, request);
            } else {
                int countAccount = accountFacade.countAccount();
                int endPage = countAccount / 5;
                if (countAccount % 5 != 0) {
                    endPage++;
                }

                accountList = accountFacade.pagingAccount(index);
                if (accountList.isEmpty()) {
                    request.setAttribute(ACCOUNT_LIST, null);
                } else {
                    sortUsername(accountList);
                    request.setAttribute(ACCOUNT_LIST, accountList);
                }

                request.setAttribute(END_PAGE, endPage);
                request.setAttribute(CURRENT_PAGE, index);

                RequestDispatcher requestDispatcher = this.getServletContext().getRequestDispatcher("/views/admin/UserManagement.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    private void returnPrintWriter(PrintWriter printWriter, List<Account> accountList, HttpServletRequest request) {
        for (Account account : accountList) {
            printWriter.println("<tr>\n"
                    + "                                                                        <td>" + checkAvatar(account) + "</td>\n"
                    + "                                                                        <td>" + account.getUserName() + "</td>\n"
                    + "                                                                        <td>" + account.getSex() + "</td>\n"
                    + "                                                                        <td>" + account.getPhoneNumber() + "</td>\n"
                    + "                                                                        <td>" + account.getEmail() + "</td>\n"
                    + "                                                                        <td>" + checkIsAdmin(account.getIsAdmin()) + "</td>\n"
                    + "                                                                        <td>" + checkIsDisable(account.getDisableAccount()) + "</td>\n"
                    + "                                                                        <td>\n"
                    + "                                                                            <div class=\"table-action-button\">\n"
                    + "                                                                                <button onclick=\"disableButtonUser('" + request.getContextPath() + "/admin/user-management', '" + account.getUserId() + "', '" + checkDisableAccount(account.getDisableAccount()) + "')\" type=\"button\" class=\"users-control " + checkButtonCss(account.getDisableAccount()) + "\">" + checkDisableAccount(account.getDisableAccount()) + "</button>\n"
                    + "                                                                            </div>\n"
                    + "                                                                        </td>\n"
                    + "                                                                    </tr>");
        }
    }

    private String checkIsAdmin(int role) {
        String tmp;

        if (role == 0) {
            tmp = "User";
        } else {
            tmp = "Admin";
        }

        return tmp;
    }

    private String checkIsDisable(int role) {
        String tmp;

        if (role == 0) {
            tmp = "No";
        } else {
            tmp = "Yes";
        }

        return tmp;
    }

    private String checkDisableAccount(int role) {
        String tmp;

        if (role == 0) {
            tmp = "Disable";
        } else {
            tmp = "UnDisable";
        }

        return tmp;
    }

    private String checkButtonCss(int role) {
        String tmp;

        if (role == 0) {
            tmp = "btn btn-danger";
        } else {
            tmp = "btn btn-success";
        }

        return tmp;
    }

    private String checkAvatar(Account account) {
        String tmpForm = "";

        if (account.getImageAvatar() == null) {
            tmpForm = "<span class=\"user-avatar-circle\" style=\"background: " + account.getColorAvatar() + "\">\n"
                    + "                                                                                    <span class=\"user-avatar-name\">" + account.getDefaultAvatar().toUpperCase() + "</span>\n"
                    + "                                                                                </span>";
        }
        return tmpForm;
    }

    private void sortUsername(List<Account> accountList) {
        Comparator<Account> comparator = new Comparator<Account>() {
            @Override
            public int compare(Account account1, Account account2) {
                return account1.getUserName().compareTo(account2.getUserName());
            }
        };
        accountList.sort(comparator);
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
