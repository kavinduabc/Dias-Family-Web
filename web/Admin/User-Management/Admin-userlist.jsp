<%-- 
    Document   : userlist
    Created on : May 6, 2024, 1:03:32 PM
    Author     : CHAMOD
--%>

<%@page import="java.util.List"%>
<%@page import="com.xadmin.model.User"%>
<%@page import="com.xadmin.dao.UserDAO"%>
<%@page import="com.xadmin.util.DatabaseUtil"%>
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
      <h2 class="heading">Users Management</h2>
        <div class="container-fluid text-right">
            <a href="<%=request.getContextPath()%>/newUser-form.jsp" class="btn btn-success" target="_parent">New User</a>
        </div>

                                            <br>
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

            <% 
            UserDAO dao= new UserDAO(DatabaseUtil.getConnection());
            List<User> users = dao.selectUser();
            
                for(User user:users){
            %>
          <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getPhone() %></td>
                <td><%= user.getAddress() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getUserType()%></td>
               <td>
        <div class="btn-group">
          <a href="editUser.jsp?id=<%= user.getId() %>" class="btn btn-primary edit-button">Edit</a>
          <a href="deleteUser.jsp?id=<%= user.getId() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
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


