package com.team.horizon.dbo;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.team.horizon.models.Account;
import com.team.horizon.utils.FunctionSendEmail;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountFacade extends AbstractAccount<Account> {

    private static final String SQL_LOGIN = "SELECT * FROM Account WHERE Email = ?";
    private static final String SQL_GET_ALL_ACCOUNT = "SELECT * FROM Account ORDER BY UserID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
    private static final String SQL_REGISTER_USER = "INSERT INTO Account(UserID, UserName, PasswordHash, Email, DefaultAvatar, ColorAvatar) VALUES(?, ?, ?, ?, ?, ?)";
    private static final String SQL_DISABLE_ACCOUNT = "UPDATE Account SET DisableAccount = 1 WHERE UserID = ?";
    private static final String SQL_UN_DISABLE_ACCOUNT = "UPDATE Account SET DisableAccount = 0 WHERE UserID = ?";
    private static final String SQL_EDIT_PROFILE = "UPDATE Account SET UserName = ?, Sex = ?, DateOfBirth = ?, PhoneNumber = ?, ImageAvatar = ?, UserAddress = ? WHERE Email = ?";
    private static final String SQL_CHANGE_PASSWORD = "UPDATE Account SET PasswordHash = ? WHERE Email = ?";
    private static final String SQL_ACTIVE_ACCOUNT = "UPDATE Account SET Active = '1' WHERE Email = ?";
    private static final String SQL_DELETE_ACCOUNT = "DELETE FROM Account WHERE Email = ?";
    private static final String SQL_GET_TOTAL_ACCOUNT = "SELECT COUNT(*) FROM Account";
    private static final String SQL_SEARCH_ACCOUNT_BY_NAME = "SELECT * FROM Account WHERE UserName LIKE ?";
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    private Account getInfoAccountFromSQL(ResultSet resultSet) throws SQLException {
        String getUserId = resultSet.getString("UserID");
        String getUsername = resultSet.getString("UserName");
        String getPassword = resultSet.getString("PasswordHash");
        String getEmail = resultSet.getString("Email");
        String getSex = resultSet.getString("Sex");
        Date getDateOfBirth = resultSet.getDate("DateOfBirth");
        String getPhoneNumber = resultSet.getString("PhoneNumber");
        int getActive = resultSet.getInt("Active");
        int getDisableAccount = resultSet.getInt("DisableAccount");
        int getIsAdmin = resultSet.getInt("IsAdmin");
        String getDefaultAvatar = resultSet.getString("DefaultAvatar");
        String getColorAvatar = resultSet.getString("ColorAvatar");
        byte[] getImageAvatar = resultSet.getBytes("ImageAvatar");
        String getUserAddress = resultSet.getString("UserAddress");
        Timestamp getAccountCreated = resultSet.getTimestamp("AccountCreated");

        return new Account(getUserId, getUsername, getPassword, getEmail, getSex, getPhoneNumber, getDefaultAvatar, getColorAvatar, Base64.encode(getImageAvatar), getUserAddress, getDateOfBirth, getActive, getDisableAccount, getIsAdmin, getAccountCreated);
    }

    @Override
    protected List<Account> pagingAccount(Connection connection, Object object) throws SQLException {
        ArrayList<Account> accountsList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_ALL_ACCOUNT);
                preparedStatement.setInt(1, ((int) object - 1) * 5);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    Account allAccount = getInfoAccountFromSQL(resultSet);
                    accountsList.add(allAccount);
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return accountsList;
    }

    @Override
    protected String registerAccount(Connection connection, Account account) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_REGISTER_USER);

                preparedStatement.setString(1, account.getUserId());
                preparedStatement.setString(2, account.getUserName());
                preparedStatement.setString(3, account.getPasswordHash());
                preparedStatement.setString(4, account.getEmail());
                preparedStatement.setString(5, account.getDefaultAvatar());
                preparedStatement.setString(6, account.getColorAvatar());

                FunctionSendEmail se = new FunctionSendEmail(account, "Verify Account");
                if (se.sendMailVerifyAccount()) {
                    preparedStatement.executeUpdate();
                    return "success";
                }
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return "error";
    }

    @Override
    protected Account checkAccount(Connection connection, Object object) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_LOGIN);
                preparedStatement.setString(1, object.toString());
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    return getInfoAccountFromSQL(resultSet);
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return null;
    }

    @Override
    protected boolean update(Connection connection, Account account, Object object) throws SQLException {
        try {
            if (connection != null) {
                switch (object.toString()) {
                    case "Disable":
                        preparedStatement = connection.prepareStatement(SQL_DISABLE_ACCOUNT);
                        preparedStatement.setString(1, account.getUserId());
                        break;
                    case "UnDisable":
                        preparedStatement = connection.prepareStatement(SQL_UN_DISABLE_ACCOUNT);
                        preparedStatement.setString(1, account.getUserId());
                        break;
                    case "EditProfile":
                        preparedStatement = connection.prepareStatement(SQL_EDIT_PROFILE);
                        preparedStatement.setString(1, account.getUserName());
                        preparedStatement.setString(2, account.getSex());
                        preparedStatement.setDate(3, account.getDateOfBirth());
                        preparedStatement.setString(4, account.getPhoneNumber());
                        preparedStatement.setBytes(5, Base64.decode(account.getImageAvatar()));
                        preparedStatement.setString(6, account.getUserAddress());
                        preparedStatement.setString(7, account.getEmail());
                        break;
                    case "ChangePassword":
                        preparedStatement = connection.prepareStatement(SQL_CHANGE_PASSWORD);
                        preparedStatement.setString(1, account.getPasswordHash());
                        preparedStatement.setString(2, account.getEmail());
                        break;
                    case "ActiveAccount":
                        preparedStatement = connection.prepareStatement(SQL_ACTIVE_ACCOUNT);
                        preparedStatement.setString(1, account.getEmail());
                        break;
                }

                preparedStatement.executeUpdate();
                return true;
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return false;
    }

    @Override
    protected boolean delete(Connection connection, Object object) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_DELETE_ACCOUNT);
                preparedStatement.setString(1, object.toString());
                preparedStatement.executeUpdate();
                return true;
            }
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return false;
    }

    @Override
    protected int countAccount(Connection connection) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_ACCOUNT);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return 0;
    }

    @Override
    protected List<Account> searchAccount(Connection connection, Object object) throws SQLException {
        
        ArrayList<Account> tmpAccountList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_SEARCH_ACCOUNT_BY_NAME);
                preparedStatement.setString(1, "%" + object.toString() + "%");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Account account = getInfoAccountFromSQL(resultSet);
                    tmpAccountList.add(account);
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        
        return tmpAccountList;
    }
}
