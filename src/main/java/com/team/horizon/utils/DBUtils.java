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
            
            String urlDataConnection = "jdbc:sqlserver://sql.bsite.net\\MSSQL2016;databaseName=khoaho_Horizon";
            
            Connection dataConn = DriverManager.getConnection(urlDataConnection, "khoaho_Horizon", Encrypt.decrypt("Iu2IBJxRTjs8GUW2gcG+1w==", "ssshhhhhhhhhhh!!!!"));
            
            return dataConn;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
}
