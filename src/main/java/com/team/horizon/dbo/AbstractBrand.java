/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
public abstract class AbstractBrand<T> {

    protected abstract List<T> getAllBrand(Connection connection) throws SQLException;

    private Connection connection;

    public List<T> getAllBrand() throws SQLException {
        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getAllBrand(connection);
        } finally {
            connection.close();
        }
        return list;
    }
}
