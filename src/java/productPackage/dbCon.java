/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package productPackage;

import java.sql.*;


public class dbCon {
    //private static Statement stmt;
    private static Connection conn;
    private static final String driver ="com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/dias_family";
        
    //private static Connection conn;
	    public static Connection connect() throws SQLException, ClassNotFoundException {
                Class.forName(driver);
	        conn = DriverManager.getConnection(url, "root", "");
                return conn;
	    }
	    public ResultSet executeQuery(String sql) throws SQLException {
	    	PreparedStatement stmt = conn.prepareStatement(sql);
			return stmt.executeQuery();
	    }
            
	    public static PreparedStatement prepareStatement( String query) throws SQLException {
        return conn.prepareStatement(query);
    }
	    public int executeUpdate(String sql) throws SQLException {
	    	PreparedStatement stmt = conn.prepareStatement(sql);
	    	return stmt.executeUpdate();
	    }
	    public void close() throws SQLException {
	    	if(conn!=null) {
	    		conn.close();
	    	}
	    }
 
}
    