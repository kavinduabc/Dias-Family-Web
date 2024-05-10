
package admin.user.controller;

//Import the Related packages and Java Classes
import admin.user.dao.UserDAO;
import admin.user.util.DatabaseUtil;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CHAMOD
 */
@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/DeleteUserServlet"})
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doPost(request, response);
            
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
                    // Retrieve the user ID parameter from(userlist.jsp) the request and assign it to the userId variable.
                    int userId = Integer.parseInt(request.getParameter("user_id"));

                    // The line creates a new instance of the UserDAO class and passes the connection obtained from the DatabaseUtil class.
                    UserDAO userDAO = new UserDAO(DatabaseUtil.getConnection());

                   // Call the deleteUser method in UserDAO Java Class to delete the user with the specified userId. 
                    boolean updateSuccessful = userDAO.deleteUser( userId);

                    if (updateSuccessful) {
                                // If the update was successful, redirect to the user list page
                                response.sendRedirect(request.getContextPath() + "/userlist.jsp");
                            }
                    else {
                                // Handle the case where the update was not successful
                                // Log the exception and display an error message
                                try {
                                    throw new Exception("Failed to delete user with ID: " + userId);
                                } catch (Exception ex) {
                                    Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                                    
                                }
                        } 
            }
            catch (SQLException ex) {
                Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
}



