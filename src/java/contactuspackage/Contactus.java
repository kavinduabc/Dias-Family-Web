/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package contactuspackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class Contactus {
    static Statement st; 
    
    static void connectToDB() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/dias-family";
        try {
            Class.forName(driver);//loading the driver
            Connection con = DriverManager.getConnection(url, "root", "");
            st = con.createStatement();
            
        } catch (ClassNotFoundException|SQLException ex) {
            System.out.println(ex.getMessage());
            Logger.getLogger(Contactus.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    void insertinfo(String message,String subject) {
    connectToDB(); // Call connectToDB method to establish a database connection
    String query = "INSERT INTO review VALUES('" + message + "','" + subject + "')"; // Construct SQL query
    try {
        st.executeUpdate(query); // Execute SQL query
        System.out.println("Record inserted");
    } catch (SQLException ex) {
        System.out.println(ex.getMessage());
        Logger.getLogger(Contactus.class.getName()).log(Level.SEVERE, null, ex);
    }


    }
    
}
