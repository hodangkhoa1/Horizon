/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.dbo;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.team.horizon.models.Product;
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
public class ProductFacade extends AbstractProduct<Product> {

    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String SQL_GET_TOP_4_PRODUCT = "SELECT TOP 4 * FROM Product";
    private static final String SQL_GET_TOP_9_PRODUCT = "SELECT TOP 9 * FROM Product";
    private static final String SQL_GET_TOP_8_PRODUCT = "SELECT TOP 8 * FROM Product WHERE ProductDiscount > 0 ORDER BY NEWID()";
    private static final String SQL_GET_TOP_8_PRODUCT_WITH_TYPE_LAPTOP = "SELECT * FROM Product WHERE ProductTypeID = (SELECT ProductTypeID FROM ProductType WHERE ProductTypeName = 'Laptop') ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY";
    private static final String SQL_GET_NEXT_6_PRODUCT = "SELECT * FROM Product ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
    private static final String SQL_GET_PRODUCT_BY_ID = "SELECT * FROM Product WHERE ProductID = ?";
    private static final String SQL_GET_PRODUCT_BY_BRAND = "SELECT TOP 6 * FROM Product WHERE BrandID = ?";
    private static final String SQL_GET_PRODUCT_BY_TYPE = "SELECT TOP 6 * FROM Product WHERE ProductTypeID = ?";
    private static final String SQL_SEARCH_PRODUCT_BY_NAME = "SELECT * FROM Product WHERE ProductName LIKE ?";
    private static final String SQL_GET_PAGING_PRODUCT = "SELECT * FROM Product ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
    private static final String SQL_DELETE_PRODUCT = "DELETE FROM Product WHERE ProductID = ?";
    private static final String SQL_ADD_PRODUCT = "INSERT INTO Product(ProductID, ProductName, ImageProduct, BrandID, ProductPrice, ProductDiscount, ProductTypeID, Quantity) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SQL_GET_TOTAL_PRODUCT = "SELECT COUNT(*) FROM Product";
    private static final String SQL_GET_TOTAL_PRODUCT_WITH_TYPE_LATOP = "SELECT COUNT(*) FROM Product WHERE ProductTypeID = (SELECT ProductTypeID FROM ProductType WHERE ProductTypeName = ?)";
    private static final String SQL_GET_TOTAL_PRODUCT_WITH_TYPE_ID = "SELECT COUNT(*) FROM Product WHERE ProductTypeID = ?";
    private static final String SQL_GET_TOTAL_PRODUCT_WITH_BRAND_ID = "SELECT COUNT(*) FROM Product WHERE BrandID = ?";

    private Product getInfoProductFromSQL(ResultSet resultSet) throws SQLException {
        String getProductID = resultSet.getString("ProductID");
        String getProductName = resultSet.getString("ProductName");
        byte[] getImageProduct = resultSet.getBytes("ImageProduct");
        String getBrandID = resultSet.getString("BrandID");
        String getProductTypeId = resultSet.getString("ProductTypeID");
        int getProductPrice = resultSet.getInt("ProductPrice");
        int getProductDiscount = resultSet.getInt("ProductDiscount");
        int getViewers = resultSet.getInt("Viewers");
        int getQuantity = resultSet.getInt("Quantity");
        Timestamp getProductCreated = resultSet.getTimestamp("ProductCreated");

        return new Product(getProductID, getProductName, getBrandID, Base64.encode(getImageProduct), getProductTypeId, getProductPrice, getProductDiscount, getViewers, getQuantity, getProductCreated);
    }

    @Override
    protected List<Product> getAllProduct(Connection connection, Object object) throws SQLException {
        ArrayList<Product> productAllList = new ArrayList<>();

        try {
            if (connection != null) {
                switch (object.toString()) {
                    case "top4Course":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOP_4_PRODUCT);
                        break;
                    case "top6Course":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOP_9_PRODUCT);
                        break;
                    case "top8Course":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOP_8_PRODUCT);
                        break;
                }
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Product product = getInfoProductFromSQL(resultSet);
                    productAllList.add(product);
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
        return productAllList;
    }

    @Override
    protected boolean deleteProduct(Connection connection, Object id) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_DELETE_PRODUCT);
                preparedStatement.setString(1, id.toString());
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
    protected int countProduct(Connection connection, Object action, Object id) throws SQLException {
        try {
            if (connection != null) {
                switch (action.toString()) {
                    case "SQL_GET_TOTAL_PRODUCT":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_PRODUCT);
                        break;
                    case "SQL_GET_TOTAL_PRODUCT_WITH_TYPE_LATOP":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_PRODUCT_WITH_TYPE_LATOP);
                        preparedStatement.setString(1, id.toString());
                        break;
                    case "SQL_GET_TOTAL_PRODUCT_WITH_TYPE_ID":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_PRODUCT_WITH_TYPE_ID);
                        preparedStatement.setString(1, id.toString());
                        break;
                    case "SQL_GET_TOTAL_PRODUCT_WITH_BRAND_ID":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_PRODUCT_WITH_BRAND_ID);
                        preparedStatement.setString(1, id.toString());
                        break;
                }
                
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
    protected List<Product> getProduct(Connection connection, Object value, Object action) throws SQLException {
        ArrayList<Product> listProduct = new ArrayList<>();

        try {
            if (connection != null) {
                switch (action.toString()) {
                    case "getProductWithBrand":
                        preparedStatement = connection.prepareStatement(SQL_GET_PRODUCT_BY_BRAND);
                        preparedStatement.setString(1, value.toString());
                        break;
                    case "getProductWithCategory":
                        preparedStatement = connection.prepareStatement(SQL_GET_PRODUCT_BY_TYPE);
                        preparedStatement.setString(1, value.toString());
                        break;
                    case "searchByName":
                        preparedStatement = connection.prepareStatement(SQL_SEARCH_PRODUCT_BY_NAME);
                        String[] cutText = value.toString().split("\\.");
                        preparedStatement.setString(1, "%" + cutText[0] + "%");
                        break;
                    case "pagingProduct":
                        preparedStatement = connection.prepareStatement(SQL_GET_PAGING_PRODUCT);
                        preparedStatement.setInt(1, (Integer.parseInt(value.toString()) - 1) * 5);
                        break;
                    case "getNext6Course":
                        preparedStatement = connection.prepareStatement(SQL_GET_NEXT_6_PRODUCT);
                        preparedStatement.setInt(1, (Integer.parseInt(value.toString())));
                        break;
                    case "top8CourseWithType":
                        preparedStatement = connection.prepareStatement(SQL_GET_TOP_8_PRODUCT_WITH_TYPE_LAPTOP);
                        preparedStatement.setInt(1, (Integer.parseInt(value.toString()) - 1) * 8);
                        break;
                }
                
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Product product = getInfoProductFromSQL(resultSet);
                    listProduct.add(product);
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
        return listProduct;
    }

    @Override
    protected Product checkProduct(Connection connection, Object object) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_PRODUCT_BY_ID);
                preparedStatement.setString(1, object.toString());
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    return getInfoProductFromSQL(resultSet);
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
    protected boolean addProduct(Connection connection, Product product) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_ADD_PRODUCT);
                preparedStatement.setString(1, product.getProductId());
                preparedStatement.setString(2, product.getProductName());
                preparedStatement.setBytes(3, Base64.decode(product.getImageProduct()));
                preparedStatement.setString(4, product.getBrandId());
                preparedStatement.setInt(5, product.getProductPrice());
                preparedStatement.setInt(6, product.getProductDiscount());
                preparedStatement.setString(7, product.getProductTypeId());
                preparedStatement.setInt(8, product.getQuantity());
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
