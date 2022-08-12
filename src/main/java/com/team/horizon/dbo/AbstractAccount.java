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
public abstract class AbstractAccount<T> {

    protected abstract List<T> pagingAccount(Connection connection, Object object) throws SQLException;

    protected abstract String registerAccount(Connection connection, T t) throws SQLException;

    protected abstract T checkAccount(Connection connection, Object object) throws SQLException;

    protected abstract boolean update(Connection connection, T t, Object object) throws SQLException;

    protected abstract boolean delete(Connection connection, Object id) throws SQLException;
    
    protected abstract int countAccount(Connection connection) throws SQLException;
    
    protected abstract List<T> searchAccount(Connection connection, Object object) throws SQLException;

    private Connection connection;

    public List<T> pagingAccount(Object object) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = pagingAccount(connection, object);
        } finally {
            connection.close();
        }
        return list;
    }

    public String registerAccount(T t) throws SQLException {
        String tmp = "";
        
        try {
            connection = DBUtils.makeConnection();
            tmp = registerAccount(connection, t);
        } finally {
            connection.close();
        }
        return tmp;
    }

    public T checkAccount(Object object) throws SQLException {
        T t = null;

        try {
            connection = DBUtils.makeConnection();
            t = checkAccount(connection, object);
        } finally {
            connection.close();
        }
        return t;
    }

    public boolean update(T t, Object object) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = update(connection, t, object);
        } finally {
            connection.close();
        }
        
        return check;
    }

    public boolean delete(Object object) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = delete(connection, object);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public int countAccount() throws SQLException {
        int check;
        
        try {
            connection = DBUtils.makeConnection();
            check = countAccount(connection);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public List<T> searchAccount(Object object) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = searchAccount(connection, object);
        } finally {
            connection.close();
        }
        return list;
    }
}
