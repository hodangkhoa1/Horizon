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
public abstract class AbstractRating<T> {
    
    private Connection connection;
    
    protected abstract List<T> getRating(Connection connection, Object productID) throws SQLException;
    
    protected abstract boolean insertRating(Connection connection, T t) throws SQLException;
    
    public boolean insertRating(T t) throws SQLException {
        boolean check;
        
        try {
            connection = DBUtils.makeConnection();
            check = insertRating(connection, t);
        } finally {
            connection.close();
        }
        
        return check;
    }
    
    public List<T> getRating(Object productID) throws SQLException {

        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getRating(connection, productID);
        } finally {
            connection.close();
        }
        return list;
    }
}
