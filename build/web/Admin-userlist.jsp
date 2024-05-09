<%-- 
    Document   : userlist
    Created on : May 6, 2024, 1:03:32 PM
    Author     : CHAMOD
--%>
<!-- Import the Related packages and Java Classes. -->
<%@page import="java.util.List"%>
<%@page import="admin.user.model.User"%>
<%@page import="admin.user.dao.UserDAO"%>
<%@page import="admin.user.util.DatabaseUtil"%>

<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <title>User List Page</title>

        <!-- Import the Stylesheet Bootstrap -->
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">

                    <!-- Internal CSS -->
                    <style>
                        .edit-button {
                                    margin-right: 20px;
                                }
                        .heading {
                                    color: gray;
                                    font-family: 'Times New Romen', serif;
                                    font-size: 30px;
                                    text-align: left;
                                    text-transform: capitalize;
                                    letter-spacing: 3px;
                                } 
                        .custom-table {
                                    font-family: 'Times New Roman', serif;
                                    font-size: 17px;
                                }
                        .custom-table th,
                        .custom-table td {
                                    padding: 10px;
                                }
                    </style>
    </head>
            <body class=" container-fluid  text-center mt-5"><br>
                <div class="container-fluid">
                    <h2 class="heading">Users Management</h2><br
                        
                        <!-- Create table for dispaly the user deatails form user table in dias-family database. -->
                        <table class="table table-striped table-bordered table-hover custom-table ">
                            <thead class="thead-dark">
                                <tr>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Phone No</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>User Type</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <!-- Expression tag for create database connection and retrieve data from database -->
                            <% 
                           
                            // Theline creates a new instance of the UserDAO class and passes the connection obtained from the DatabaseUtil class.
                            UserDAO dao= new UserDAO(DatabaseUtil.getConnection());
                            // Retrieve the list of users from the database by calling the selectUser() method of the UserDAO class.
                            List<User> users = dao.selectUser();
                            // Iterate over each user in the users list and perform a specific action for each user
                            for(User user:users){
                            %>
                            
                                <!-- Using the user object in User.Java Class and calling get methods with variables to retrieve the set data from database tables -->
                                <tr>
                                    <td><%= user.getId() %></td>
                                    <td><%= user.getName() %></td>
                                    <td><%= user.getPhone() %></td>
                                    <td><%= user.getAddress() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getUserType()%></td>
                                    <td>
                                        <div class="btn-group">
                                            
                                          <!-- Generate a link to editUser.jsp with the user_Id as a parameter and pass the editUser.jsp, and create a Edit button. -->
                                              <a href="editUser.jsp?id=<%= user.getId() %>" class="btn btn-primary edit-button">Edit</a>
                                          
                                          <!--Create a form to delete users and after submit it use the DeleteUserServle -->
                                          <form action="DeleteUserServlet" method="post">
                                              
                                              <!--  Hidden Input get the  User id-->
                                              <input type="hidden" name="user_id" value="<%= user.getId() %>">
                                              
                                              <!-- Create a button to Delete usera in specific user_Id, and after click button display alert box to confirm the deletion.  -->
                                              <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</button>
                                          </form>
                                        </div>
                                    </td>
                                </tr>

                            <%
                                    }
                            %>
                        </table>
                </div>
            </body>
</html>


