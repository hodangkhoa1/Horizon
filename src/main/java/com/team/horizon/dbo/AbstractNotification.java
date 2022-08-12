/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.dbo;

import com.team.horizon.utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 * @param <T>
 */
public abstract class AbstractNotification<T> {
    
    private Connection connection;
    
    protected abstract List<T> getAllNotification(Connection connection, Object object) throws SQLException;
    
    protected abstract boolean insertNotification(Connection connection, T t) throws SQLException;
    
    protected abstract boolean deleteNotification(Connection connection, Object notifyID, Object userID) throws SQLException;
    
    protected abstract boolean updateNotification(Connection connection, Object notifyID, Object userID) throws SQLException;
    
    protected abstract int countNotification(Connection connection, Object userID) throws SQLException;
    
    public List<T> getAllNotification(Object object) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getAllNotification(connection, object);
        } finally {
            connection.close();
        }
        return list;
    }
    
    public boolean insertNotification(T t) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = insertNotification(connection, t);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public boolean deleteNotification(Object notifyID, Object userID) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = deleteNotification(connection, notifyID, userID);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public boolean updateNotification(Object notifyID, Object userID) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = updateNotification(connection, notifyID, userID);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public int countNotification(Object userID) throws SQLException {
        int check;
        
        try {
            connection = DBUtils.makeConnection();
            check = countNotification(connection, userID);
        } finally {
            connection.close();
        }
        
        return check;
    }
}
