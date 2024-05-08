<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Management</title>
    <%--Bootstrap css --%>
    <link rel="stylesheet" type="text/css" href="css/Admin_Product.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:wght@300;400;500;600;700&display=swap');
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: 'Fira Sans', sans-serif;
        }  
        header .navbar {
          height:60px;
          background-color:#000;
          color: #fff;
        }
        .navbar-nav .nav-link {
            color: #fff; 
        }

        .navbar-nav .nav-link:hover {
            color: #1dbf73; 
        }
        
        .dropdown-menu
        {
          background:#242526;
        }
        .dropdown-item
        {
            color: #fff;
        }
        .dropdown-item:hover
        {
           color: #1dbf73; 
        }
        .card {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
        }
    </style>
</head>
<body>

    <header>
        
        <div class="container mt-2">
        <div class="row">    
        <nav class="navbar navbar-expand-lg ">
          <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="#">Admin Panel</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="<%=request.getContextPath()%>/new">Add item</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Categories
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"></a></li>
                    <li><a class="dropdown-item" href="#">Another action</a></li>
                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                  </ul>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Log out</a>
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
        </div>
    </header>   
    <main>
        <%--<a href="<=%request.getContextPath()%>/list"></a>--%>
        <div class="container mt-5">
                <div class="row align-items-center mb-5"> 
                    <div class="card">
                        <div class="card-body">
                            <div class="row align-items-center"> 
                                <div class="col-md-6"> 
                                     <h2 class="display-4">All Products</h2> 
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
                                            <table class="table table-striped">
                                               <thead>
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
                                               <c:forEach var="products" items="${listProducts}"> 

                                               <tr>
                                                   <td><c:out value="${products.productID}" /></td>
                                                   <td><c:out value="${products.productName}" /></td>
                                                   <td><c:out value="${products.productPrice}" /></td>
                                                   <td><c:out value="${products.qty}" /></td>
                                                   <td><c:out value="${products.productImage}" /></td>
                                                   <td><c:out value="${products.categoryID}" /></td>
                                                   <td><c:out value="${products.sellerID}" /></td>
                                                   <td><a href="edit?productID=<c:out value='${products.productID}' />" class="btn btn-primary">Edit</a>
                                                   &nbsp;&nbsp;&nbsp;&nbsp; 
                                                   <a href="delete?productID=<c:out value='${products.productID}' />" class="btn btn-danger">Delete</a></td>
                                               </tr>            
                                               </c:forEach>            
                                               </tbody>
                                           </table>                        
                                        </div>

                                    </div>                                     
                </div>                 
       </div>
    </main>
                <script>
                 const header = document.querySelector("header");
                 const hamburgerBtn = document.querySelector("#hamburger-btn");
                 const closeMenuBtn = document.querySelector("#close-menu-btn");

                 // Toggle mobile menu on hamburger button click
                 hamburgerBtn.addEventListener("click", () => header.classList.toggle("show-mobile-menu"));

                 // Close mobile menu on close button click
                 closeMenuBtn.addEventListener("click", () => hamburgerBtn.click());
               </script>   
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>    
</body>