package com.team.horizon.dbo;

import com.team.horizon.utils.DBUtils;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author ASUS
 * @param <T>
 */
public abstract class AbstractProductContent<T> {
    
    private Connection connection;
    
    protected abstract T getProductContent(Connection connection, Object productId) throws SQLException;
    
    protected abstract boolean addProductContent(Connection connection, T productContent) throws SQLException;
    
    public T getProductContent(Object productId) throws SQLException {
        T t = null;

        try {
            connection = DBUtils.makeConnection();
            t = getProductContent(connection, productId);
        } finally {
            connection.close();
        }
        return t;
    }
    
    public boolean addProductContent(T productContent) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = addProductContent(connection, productContent);
        } finally {
            connection.close();
        }
        
        return check;
    }
}
