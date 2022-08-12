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
public abstract class AbstractProductType<T> {
    
    protected abstract List<T> getAllProductType(Connection connection) throws SQLException;
    
    private Connection connection;
    
    public List<T> getAllProductType() throws SQLException {
        List<T> list = new ArrayList<>();

        try {
            connection = DBUtils.makeConnection();
            list = getAllProductType(connection);
        } finally {
            connection.close();
        }
        return list;
    }
}
