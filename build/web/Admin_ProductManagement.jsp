<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <link rel="stylesheet" href="style.css">
    <%--Bootstrap css --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

    <header>
        <div class="container pt-2">
        
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
              <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">Admin Panel</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Add item</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Select Category
                      </a>
                      <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                      </ul>
                    </li>
                  </ul>
                  <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                  </form>
                </div>
              </div>
            </nav>             
        </div>
    </header>   
    <main>
        
        <div class="container mt-5">
                <div class="row align-items-center mb-5"> <!-- Added a row with alignment -->
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center"> <!-- Nested row for alignment -->
                                <div class="col-md-6"> <!-- Added a column for heading -->
                                     <h2 class="display-4">All Products</h2> <!-- Stylish heading -->
                                 </div>
                                 <div class="col-md-6 text-end"> <!-- Added a column for the button (aligned to the right) -->
                                     <a href="<%=request.getContextPath()%>/new" class="btn btn-primary">Add Product</a> <!-- Button -->
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>           
            <div class="card">
                <div class="card-body">
                    <table class="table table-striped">
                       <thead>
                       <th>Product id</th>
                       <th>Product name</th>
                       <th>Price</th>
                       <th>Image</th>
                       <th>Category id</th>
                       <th>Seller id</th>
                       <th>Operations</th>
                       </thead>
                       <tbody>
                       <c:forEach var="products" items="${listProducts}"> 

                       <tr>
                           <td><c:out value="${products.productID}" /></td>
                           <td><c:out value="${products.productName}" /></td>
                           <td><c:out value="${products.productPrice}" /></td>
                           <td><c:out value="${products.productImage}" /></td>
                           <td><c:out value="${products.categoryID}" /></td>
                           <td><c:out value="${products.sellerID}" /></td>
                           <td><a href="edit?id=<c:out value='${products.productID}' />">Edit</a>
                           &nbsp;&nbsp;&nbsp;&nbsp; 
                           <a href="delete?id=<c:out value='${products.productID}' />">Delete</a></td>
                       </tr>            
                       </c:forEach>            
                       </tbody>
                   </table>                        
                </div>
                
            </div>
       </div>
    </main>
    
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>    
</body>