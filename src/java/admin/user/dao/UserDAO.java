/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.user.dao;

//Import the Related packages and Java Classes
import java.util.logging.Logger;
import admin.user.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

/**
 *
 * @author CHAMOD
 */
public class UserDAO {
    
    // Create variables.
    private static final Logger logger = Logger.getLogger(UserDAO.class.getName());
    private static final String SELECT_ALL_USERS = "select * from user";
    private static final String UPDATE_USER = "UPDATE user SET user_type = ? WHERE user_id = ?";
    private static final String DELETE_USER = "DELETE FROM user WHERE user_id = ?";
    private Connection con;
    private PreparedStatement preparedStatement ;

        // Create a UserDAO constructor with a parameter to receive a Connection object
        public UserDAO(Connection con) {
            this.con = con;
        }

            //SELECT * USER - selectUser Method 
            public List<User> selectUser() {
                
                   // Create a List to store User objects usinf ArrayList Class
                    List<User> users = new ArrayList<User>();
                    try{
                            // Prepare a SQL statement for selecting all users
                            preparedStatement = con.prepareStatement(SELECT_ALL_USERS);
                            
                            // Execute the SQL query and retrieve the results
                            ResultSet rs = preparedStatement.executeQuery();
                            
                            // Iterate over the rows of the ResultSet and create User objects
                            while (rs.next()) {
                                
                                 // Create a new User object
                                User user=new User();
                                
                                // Set the properties of the User object based on the values from the ResultSet
                                user.setId(rs.getInt("user_id"));
                                user.setName(rs.getString("name"));
                                user.setPassword(rs.getString("password"));
                                user.setPhone(rs.getString("phone_number"));
                                user.setAddress(rs.getString("address"));
                                user.setEmail(rs.getString("email"));
                                user.setUserType(rs.getString("user_type"));
                                
                                // Add the User object to the users list
                                users.add(user);
                            }
                            } catch (SQLException e) {
                                         logger.log(Level.SEVERE, "An error occurred while selecting users", e);
                              }
                return users;
            }
            
            //UPDATE USER - updateUser Method with user parameter.
            public boolean updateUser(User user) {
                try {
                    
                    // Prepare a SQL statement for update user.
                    preparedStatement = con.prepareStatement(UPDATE_USER);
                    
                    // Set the value of the first parameter in the prepared statement to the userType property of the User object. 
                    preparedStatement.setString(1, user.getUserType());
                    
                    // Set the value of the second parameter in the prepared statement to the id property of the User object.
                    preparedStatement.setInt(2, user.getId());

                    // Execute the SQL statement and get the number of rows affected
                    int rowsAffected = preparedStatement.executeUpdate();
                    
                    // Return a boolean indicating if any rows were affected
                    return rowsAffected > 0;
                } 
                catch (SQLException e) {
                    logger.log(Level.SEVERE, "Error occurred while updating user: " + user.getId(), e);      
                 }
                return false;
            }
    
            //DELETE USER - deleteUser Method with id parameter.
            public boolean deleteUser(int id) {
                try {
                    
                    // Prepare a SQL statement for delete user.
                    preparedStatement = con.prepareStatement(DELETE_USER);

                    // Set the value of the first parameter in the prepared statement to the id property of the User object.
                    preparedStatement.setInt(1,id);

                    // Execute the SQL statement and get the number of rows affected
                    int rowsAffected = preparedStatement.executeUpdate();
                    
                    // Return a boolean indicating if any rows were affected
                    return rowsAffected > 0;
                }
                catch (SQLException e) {
                    logger.log(Level.SEVERE, "Error occurred while deleting user with ID: " + id, e);
                }
                return false;
            }
}






