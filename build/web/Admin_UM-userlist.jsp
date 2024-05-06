<%-- 
    Document   : Admin_UserManagement
    Created on : Apr 27, 2024, 6:38:58 PM
    Author     : Kavindu Piyumal
--%>

<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        
        .edit-button {
                     margin-right: 20px; /* Adjust the value as per your preference */
                }
                
         
    </style>
</head>
<body class=" container-fluid  text-center mt-5"><br>
    <div class="container-fluid"><br>
        <center> <h2 class="text-dark font-weight-bold ">User List</h2> </center><br><br>
        <div class="container-fluid text-right">
            <a href="<%=request.getContextPath()%>/newUser-form.jsp" class="btn btn-success"> New User</a>
        </div>

                                            <br>
        <table class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Phone No</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>User Type</th>
                    <th>Action</th>
                   
                </tr>
            </thead>

            <%
                String url = "jdbc:mysql://localhost:3306/dias-family";
                String username = "root";
                String password = "";

                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, username, password);
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM user";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int id = rs.getInt("user_id");
                        String usernameVal = rs.getString("username");
                        String phoneNumber = rs.getString("phone_number");
                        String address = rs.getString("address");
                        String email = rs.getString("email");
                        String userType = rs.getString("user_type");

            %>
            <tr>
                <td><%= id %></td>
                <td><%= usernameVal %></td>
                <td><%= phoneNumber %></td>
                <td><%= address %></td>
                <td><%= email %></td>
                <td><%= userType %></td>
               <td>
        <div class="btn-group">
          <a href="editUser.jsp?id=<%= id %>" class="btn btn-primary edit-button">Edit</a>
          <a href="deleteUser.jsp?id=<%= id %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
        </div>
      </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </table>
    </div>
</body>
</html>