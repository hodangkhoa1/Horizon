/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public abstract class AbstractProduct<T> {
    
    private Connection connection;
    
    protected abstract List<T> getAllProduct(Connection connection, Object object) throws SQLException;
    
    protected abstract List<T> getProduct(Connection connection, Object value, Object action) throws SQLException;
    
    protected abstract boolean deleteProduct(Connection connection, Object id) throws SQLException;
    
    protected abstract boolean addProduct(Connection connection, T product) throws SQLException;
    
    protected abstract int countProduct(Connection connection, Object action, Object id) throws SQLException;
    
    protected abstract T checkProduct(Connection connection, Object object) throws SQLException;
    
    public List<T> getAllProduct(Object object) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getAllProduct(connection, object);
        } finally {
            connection.close();
        }
        return list;
    }
    
    public List<T> getProduct(Object value, Object action) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getProduct(connection, value, action);
        } finally {
            connection.close();
        }
        return list;
    }
    
    public boolean deleteProduct(Object object) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = deleteProduct(connection, object);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public boolean addProduct(T product) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = addProduct(connection, product);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public int countProduct(Object action, Object id) throws SQLException {
        int check;
        
        try {
            connection = DBUtils.makeConnection();
            check = countProduct(connection, action, id);
        } finally {
            connection.close();
        }
        
        return check;
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
