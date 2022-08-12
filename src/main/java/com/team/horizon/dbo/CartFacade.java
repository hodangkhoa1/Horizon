package com.team.horizon.dbo;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.team.horizon.models.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class CartFacade extends AbstractCart<Cart> {

    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String SQL_ADD_CART = "INSERT INTO Cart(CartID, UserID, ImageProduct, ProductName, Quantity, Price) VALUES(?, ?, ?, ?, ?, ?)";
    private static final String SQL_DELETE_CART = "DELETE FROM Cart WHERE UserID = ? AND CartID = ?";
    private static final String SQL_DELETE_ALL_CART = "DELETE FROM Cart WHERE UserID = (SELECT UserID FROM Account WHERE Email = ?)";
    private static final String SQL_GET_CART = "SELECT * FROM Cart WHERE UserID = ?";
    private static final String SQL_CHECK_CART = "SELECT * FROM Cart WHERE ProductName = ?";
    private static final String SQL_GET_TOTAL_CART = "SELECT COUNT(*) FROM Cart WHERE UserID = ?";
    private static final String SQL_UPDATE_CART = "UPDATE Cart SET Quantity = ? WHERE UserID = ? AND ProductName = ?";

    private Cart getInfoCartFromSQL(ResultSet resultSet) throws SQLException {
        String getCartID = resultSet.getString("CartID");
        String getUserID = resultSet.getString("UserID");
        byte[] getImageProduct = resultSet.getBytes("ImageProduct");
        String getProductName = resultSet.getString("ProductName");
        int getQuantity = resultSet.getInt("Quantity");
        int getPrice = resultSet.getInt("Price");
        Timestamp getPurchaseDate = resultSet.getTimestamp("PurchaseDate");

        return new Cart(getCartID, getUserID, Base64.encode(getImageProduct), getProductName, getQuantity, getPrice, getPurchaseDate);
    }

    @Override
    protected boolean addCart(Connection connection, Cart cart) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_ADD_CART);
                preparedStatement.setString(1, cart.getCartId());
                preparedStatement.setString(2, cart.getUserId());
                preparedStatement.setBytes(3, Base64.decode(cart.getImageProduct()));
                preparedStatement.setString(4, cart.getProductName());
                preparedStatement.setInt(5, cart.getQuantity());
                preparedStatement.setInt(6, cart.getPrice());
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
    protected boolean update(Connection connection, Cart cart) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_UPDATE_CART);
                preparedStatement.setInt(1, cart.getQuantity());
                preparedStatement.setString(2, cart.getUserId());
                preparedStatement.setString(3, cart.getProductName());
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
    protected boolean delete(Connection connection, Object userId, Object cartID) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_DELETE_CART);
                preparedStatement.setString(1, userId.toString());
                preparedStatement.setString(2, cartID.toString());
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
    protected boolean deleteAll(Connection connection, Object userId) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_DELETE_ALL_CART);
                preparedStatement.setString(1, userId.toString());
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
    protected int countCart(Connection connection, Object userId) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_CART);
                preparedStatement.setString(1, userId.toString());
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
    protected List<Cart> getAllCart(Connection connection, Object userId) throws SQLException {
        ArrayList<Cart> cartAllList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_CART);
                preparedStatement.setString(1, userId.toString());
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Cart cart = getInfoCartFromSQL(resultSet);
                    cartAllList.add(cart);
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
        return cartAllList;
    }

    @Override
    protected Cart checkProduct(Connection connection, Object object) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_CHECK_CART);
                preparedStatement.setString(1, object.toString());
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    return getInfoCartFromSQL(resultSet);
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

}
