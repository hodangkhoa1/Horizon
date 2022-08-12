package com.team.horizon.dbo;

import com.team.horizon.utils.DBUtils;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 * @param <T>
 */
public abstract class AbstractCart<T> {

    private Connection connection;

    protected abstract boolean addCart(Connection connection, T t) throws SQLException;

    protected abstract boolean update(Connection connection, T t) throws SQLException;

    protected abstract boolean delete(Connection connection, Object userId, Object productName) throws SQLException;
    
    protected abstract boolean deleteAll(Connection connection, Object userId) throws SQLException;

    protected abstract int countCart(Connection connection, Object userId) throws SQLException;
    
    protected abstract List<T> getAllCart(Connection connection, Object userId) throws SQLException;
    
    protected abstract T checkProduct(Connection connection, Object object) throws SQLException;
    
    public boolean update(T t) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = update(connection, t);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public boolean addCart(T t) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = addCart(connection, t);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public boolean delete(Object userId, Object productName) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = delete(connection, userId, productName);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public boolean deleteAll(Object userId) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = deleteAll(connection, userId);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public int countCart(Object userId) throws SQLException {
        int check;
        
        try {
            connection = DBUtils.makeConnection();
            check = countCart(connection, userId);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public List<T> getAllCart(Object userId) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getAllCart(connection, userId);
        } finally {
            connection.close();
        }
        return list;
    }
    
    public T checkProduct(Object object) throws SQLException {
        T t = null;

        try {
            connection = DBUtils.makeConnection();
            t = checkProduct(connection, object);
        } finally {
            connection.close();
        }
        return t;
    }
}
