package com.team.horizon.dbo;

import com.team.horizon.models.ProductContent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 */
public class ProductContentFacade extends AbstractProductContent<ProductContent> {
    
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String SQL_GET_PRODUCT_CONTENT_BY_ID = "SELECT * FROM ProductContent WHERE ProductID = ?";
    private static final String SQL_ADD_PRODUCT_CONTENT = "INSERT INTO ProductContent(ProductContentID, ProductID, ProductDescription, ProductContent) VALUES(?, ?, ?, ?)";

    private ProductContent getInfoProductContentFromSQL(ResultSet resultSet) throws SQLException {
        String getProductContentID = resultSet.getString("ProductContentID");
        String getProductID = resultSet.getString("ProductID");
        String getProductDescription = resultSet.getString("ProductDescription");
        String getProductContent = resultSet.getString("ProductContent");

        return new ProductContent(getProductContentID, getProductID, getProductDescription, getProductContent);
    }
    
    @Override
    protected ProductContent getProductContent(Connection connection, Object productId) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_PRODUCT_CONTENT_BY_ID);
                preparedStatement.setString(1, productId.toString());
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    return getInfoProductContentFromSQL(resultSet);
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
    protected boolean addProductContent(Connection connection, ProductContent productContent) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_ADD_PRODUCT_CONTENT);
                preparedStatement.setString(1, productContent.getProductContentId());
                preparedStatement.setString(2, productContent.getProductId());
                preparedStatement.setString(3, productContent.getProductDescription());
                preparedStatement.setString(4, productContent.getProductContent());
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
    
}
