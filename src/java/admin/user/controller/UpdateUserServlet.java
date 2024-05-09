/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin.user.controller;
//Import the Related packages and Java Classes
import admin.user.dao.UserDAO;
import admin.user.model.User;
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
@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/UpdateUserServlet"})
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the user ID parameter from(userlist.jsp) the request and assign it to the userId variable.
            int userId = Integer.parseInt(request.getParameter("user_id"));
            
            // Retrieve the user Type parameter from(userlist.jsp) the request and assign it to the userType variable.
            String userType = request.getParameter("user_type");
            
            // Create an instance of UserDAO
            UserDAO userDAO = new UserDAO(DatabaseUtil.getConnection());
            
            // Create a User object with the updated information
            User user = new User();
            user.setId(userId);
            user.setUserType(userType);
            
            // Call the updateUser method
            boolean updateSuccessful = userDAO.updateUser(user);
            
            if (updateSuccessful) {
                // Redirect to the user list page or display a success message
                response.sendRedirect(request.getContextPath() + "/userlist.jsp");
            } else {
                // Handle the case where the update was not successful
                // Redirect to an error page or display an error message
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }   } catch (SQLException ex) {
            Logger.getLogger(UpdateUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
}
}
