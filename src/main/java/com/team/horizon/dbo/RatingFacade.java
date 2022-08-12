/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.dbo;

import com.team.horizon.models.Rating;
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
public class RatingFacade extends AbstractRating<Rating> {
    
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String SQL_INSERT_RATING = "INSERT INTO Rating(RatingID, ProductID, UserID, NumberRating) VALUES(?, ?, ?, ?)";
    private static final String SQL_GET_ALL_RATING = "SELECT * FROM Rating WHERE ProductID = ?";
    
    private Rating getInfoRatingFromSQL(ResultSet resultSet) throws SQLException {
        String getRatingID = resultSet.getString("RatingID");
        String getProductID = resultSet.getString("ProductID");
        String getUserID = resultSet.getString("UserID");
        int getNumberRating = resultSet.getInt("NumberRating");
        Timestamp getRatingCreated = resultSet.getTimestamp("RatingCreated");
        return new Rating(getRatingID, getProductID, getUserID, getNumberRating, getRatingCreated);
    }

    @Override
    protected boolean insertRating(Connection connection, Rating rating) throws SQLException {
        String ratingID = rating.getRatingId();
        String productID = rating.getProductId();
        String userID = rating.getUserId();
        int numberRating = rating.getNumberRating();


        try {
            if(connection != null) {
                preparedStatement = connection.prepareStatement(SQL_INSERT_RATING);

                preparedStatement.setString(1, ratingID);
                preparedStatement.setString(2, productID);
                preparedStatement.setString(3, userID);
                preparedStatement.setInt(4, numberRating);
                preparedStatement.executeUpdate();
                return true;
            }
        } finally {
            if(preparedStatement != null) {
                preparedStatement.close();
            }
            if(connection != null) {
                connection.close();
            }
        }
        return false;
    }

    @Override
    protected List<Rating> getRating(Connection connection, Object productID) throws SQLException {
        ArrayList<Rating> ratingAllList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_ALL_RATING);
                preparedStatement.setString(1, productID.toString());
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Rating rating = getInfoRatingFromSQL(resultSet);
                    ratingAllList.add(rating);
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
        return ratingAllList;
    }
    
}
