<%@page import="Daisfamily.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <%--Bootstrap css --%>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
 
                              .card {
                              box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
                              }
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
                                .custom-table th{
                                    background-color: #332D2D;
                                    color: #ffffff;
                                }        
        
        
    </style>
</head>
<body class="container-fluid text-center mt-5">

    <br>
    <br>
    <%@include file="header.jsp" %>

  
    <main>
        <%--<a href="<=%request.getContextPath()%>/list"></a>--%>
        <div class="container-fluid mt-5">
                <div class="row align-items-center mb-5"> 
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center"> 
                                <div class="col-md-6"> 
                                     <h2 class="heading">All Products</h2> 
                                 </div>
                                 <div class="col-md-6 text-end"> 
                                     <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add Product</a> 
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>           
                <div class="row">
                        <div class="card">
                                        <div class="card-body">
                                            <table class="table table-striped table-bordered table-hover custom-table">
                                               <thead class="thead-dark">
                                               <th>Product id</th>
                                               <th>Product name</th>
                                               <th>Price</th>
                                               <th>Quantity</th>
                                               <th>Image</th>
                                               <th>Category id</th>
                                               <th>Seller id</th>
                                               <th>Operations</th>
                                               </thead>
                                               <tbody>


                                                    <%
                                                        List<Product> listProducts = (List<Product>) request.getAttribute("listProducts");


                                                        for (Product product : listProducts) {
                                                    %>
                                                        <tr>
                                                            <td><%= product.getProductID() %></td>
                                                            <td><%= product.getProductName() %></td>
                                                            <td><%= product.getProductPrice() %></td>
                                                            <td><%= product.getQty() %></td>

                                                            <td><img src="<%= request.getContextPath() %>/products/<%= product.getProductImage()%>" alt="<%= product.getProductImage() %>" width="50px" height="50px"></td>

                                                        

                                                            <td><%= product.getCategoryID() %></td>
                                                            <td><%= product.getSellerID() %></td>
                                                            <td>
                                                                <a href="edit?productID=<%= product.getProductID() %>" class="btn btn-primary">Edit</a>
                                                                &nbsp;&nbsp;&nbsp;&nbsp; 
                                                                <a href="delete?productID=<%= product.getProductID() %>" class="btn btn-danger">Delete</a>
                                                            </td>
                                                        </tr>
                                                    <%
                                                        }
                                                    %>           
                                               </tbody>
                                           </table>                        
                                        </div>
                                               
                                    </div>                                     
                </div>                 
       </div>
    </main>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

</body>