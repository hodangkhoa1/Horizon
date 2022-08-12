package com.team.horizon.dbo;

import com.team.horizon.models.ProductType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ProductTypeFacade extends AbstractProductType<ProductType> {
    
    private static final String SQL_GET_ALL_PRODUCT_TYPE = "SELECT * FROM ProductType";
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    
    private ProductType getInfoProductTypeFromSQL(ResultSet resultSet) throws SQLException {
        String getProductTypeID = resultSet.getString("ProductTypeID");
        String getProductTypeName = resultSet.getString("ProductTypeName");
        String getIconProductType = resultSet.getString("IconProductType");

        return new ProductType(getProductTypeID, getProductTypeName, getIconProductType);
    }

    @Override
    protected List<ProductType> getAllProductType(Connection connection) throws SQLException {
        ArrayList<ProductType> productTypeList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_ALL_PRODUCT_TYPE);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    ProductType allProductType = getInfoProductTypeFromSQL(resultSet);
                    productTypeList.add(allProductType);
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
        return productTypeList;
    }
    
}
