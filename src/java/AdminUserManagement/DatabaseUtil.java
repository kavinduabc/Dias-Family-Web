/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminUserManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CHAMOD
 */
public class DatabaseUtil {
    
    public static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://localhost:3306/dias-family";
    public static final String USER = "root";
    public static final String PASS = "";
    public static Connection con;
    public static Statement stmt;
    

    public static Connection getConnection() throws SQLException {
    
        try {
            Class.forName(JDBC_DRIVER); //modern jdbcs can handle drivers automatically so this and the relevant exception handling is not necessary.
            con = DriverManager.getConnection(DB_URL, "root", "");
            stmt = con.createStatement();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DatabaseUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    
}
