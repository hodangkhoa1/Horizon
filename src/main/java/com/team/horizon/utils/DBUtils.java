/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.horizon.utils;

import java.sql.*;

/**
 *
 * @author ASUS
 */
public class DBUtils {

    public static Connection makeConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            String urlDataConnection = "jdbc:sqlserver://localhost;databaseName=Horizon";
            
            Connection dataConn = DriverManager.getConnection(urlDataConnection, "sa", Encrypt.decrypt("u+X+On2XQDymkX7xtpuohQ==", "ssshhhhhhhhhhh!!!!"));
            
            return dataConn;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
