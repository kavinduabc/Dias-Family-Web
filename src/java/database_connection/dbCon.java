/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database_connection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbCon {

    private static Statement stmt;
    private static Connection con;
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/dias-family";

    public static Connection connectToDB() {
        try {
            Class.forName(driver); //modern jdbcs can handle drivers automatically so this and the relevant exception handling is not necessary.
            con = DriverManager.getConnection(url, "root", "");
            stmt = con.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbCon.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(dbCon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

    public ResultSet executeQuery(String sql) throws SQLException {
        PreparedStatement stmt = con.prepareStatement(sql);
        return stmt.executeQuery();
    }

    public static PreparedStatement prepareStatement(String query) throws SQLException {
        return con.prepareStatement(query);
    }

    public int executeUpdate(String sql) throws SQLException {
        PreparedStatement stmt = con.prepareStatement(sql);
        return stmt.executeUpdate();
    }

    public void close() throws SQLException {
        if (con != null) {
            con.close();
        }
    }

}
