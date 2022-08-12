/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.dbo;

import com.team.horizon.models.Notification;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class NotificationFacade extends AbstractNotification<Notification> {

    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private static final String SQL_GET_ALL_NOTIFICATION = "SELECT * FROM Notify WHERE UserID = ?";
    private static final String SQL_INSERT_NOTIFICATION = "INSERT INTO Notify(NotifyID, UserID, NotifyType) VALUES(?, ?, ?)";
    private static final String SQL_DELETE_NOTIFICATION = "DELETE FROM Notify WHERE NotifyID = ? AND UserID = ?";
    private static final String SQL_UPDATE_NOTIFICATION = "UPDATE Notify SET IsRead = 1 WHERE NotifyID = ? AND UserID = ?";
    private static final String SQL_GET_TOTAL_NOTIFICATION = "SELECT COUNT(*) FROM Notify WHERE UserID = ? AND IsRead = 0";
    
    private Notification getInfoNotificationFromSQL(ResultSet resultSet) throws SQLException {
        String getNotifyID = resultSet.getString("NotifyID");
        String getUserID = resultSet.getString("UserID");
        String getNotifyType = resultSet.getString("NotifyType");
        int getIsRead = resultSet.getInt("IsRead");
        Timestamp getNotifyCreated = resultSet.getTimestamp("NotifyCreated");
        return new Notification(getNotifyID, getUserID, getNotifyType, getIsRead, getNotifyCreated);
    }

    @Override
    protected List<Notification> getAllNotification(Connection connection, Object object) throws SQLException {
        ArrayList<Notification> notificationAllList = new ArrayList<>();

        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_ALL_NOTIFICATION);
                preparedStatement.setString(1, object.toString());
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    Notification notification = getInfoNotificationFromSQL(resultSet);
                    notificationAllList.add(notification);
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
        return notificationAllList;
    }

    @Override
    protected boolean insertNotification(Connection connection, Notification notification) throws SQLException {
        String notifyID = notification.getNotifyId();
        String userID = notification.getUserId();
        String notifyContent = notification.getNotifyType();


        try {
            if(connection != null) {
                preparedStatement = connection.prepareStatement(SQL_INSERT_NOTIFICATION);

                preparedStatement.setString(1, notifyID);
                preparedStatement.setString(2, userID);
                preparedStatement.setString(3, notifyContent);
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
    protected boolean deleteNotification(Connection connection, Object notifyID, Object userID) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_DELETE_NOTIFICATION);
                preparedStatement.setString(1, notifyID.toString());
                preparedStatement.setString(2, userID.toString());
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
    protected boolean updateNotification(Connection connection, Object notifyID, Object userID) throws SQLException {
        try {
            if (connection != null) {
                preparedStatement = connection.prepareStatement(SQL_UPDATE_NOTIFICATION);
                preparedStatement.setString(1, notifyID.toString());
                preparedStatement.setString(2, userID.toString());
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
    protected int countNotification(Connection connection, Object userID) throws SQLException {
        try {
            if(connection != null) {
                preparedStatement = connection.prepareStatement(SQL_GET_TOTAL_NOTIFICATION);
                preparedStatement.setString(1, userID.toString());
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    return resultSet.getInt(1);
                }
            }
        } finally {
            if(resultSet != null) {
                resultSet.close();
            }
            if(preparedStatement != null) {
                preparedStatement.close();
            }
            if(connection != null) {
                connection.close();
            }
        }
        return 0;
    }
    
}
