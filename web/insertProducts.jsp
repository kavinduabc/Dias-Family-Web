<%-- 
    Document   : insertProducts
    Created on : May 1, 2024, 5:26:50 PM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>product-form</title>
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
                           <li class="nav-item">
                             <a class="nav-link" href="#">Products</a>
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
            <div class="container col-md-5 pt-5">
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <div class="image-container">
                               <img src="" alt="Preview Image">  
                            </div>
                         </div>                        
			<div class="card-body col-md-8">
				<c:if test="${product != null}">
					<form action="update" method="post" enctype="multipart/form-data">
				</c:if>
				<c:if test="${product == null}">
					<form action="insert" method="post" enctype="multipart/form-data">
				</c:if>

				<caption>
					<h2>
						<c:if test="${product != null}">
            			Edit Product
            		</c:if>
						<c:if test="${product == null}">
            			Add New Product
            		</c:if>
					</h2>
				</caption>

				<c:if test="${product != null}">
					<input type="hidden" name="productID" value="<c:out value='${product.productID}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Product Name</label> <input type="text"
						value="<c:out value='${product.productName}' />" class="form-control"
						name="productName" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Price</label> <input type="text"
						value="<c:out value='${product.productPrice}' />" class="form-control"
						name="productPrice">
				</fieldset>

				<fieldset class="form-group">
					<label>Category</label> <input type="text"
						value="<c:out value='${product.categoryID}' />" class="form-control"
						name="categoryID">
				</fieldset>
				<fieldset class="form-group">
					<label>Seller</label> <input type="text"
						value="<c:out value='${product.sellerID}' />" class="form-control"
						name="sellerID">
                                </fieldset>        
                                <fieldset class="form-group">
					<label>Product Image</label> <input type="file"
						value="<c:out value='${product.productImage}' />" class="form-control"
						name="productImage" id="image" accept="image/png, image/jpg, image/jpeg" onchange="previewImage(this)">
                                </fieldset>
				<button type="submit" class="btn btn-success">Save</button>
				</form>
                    
                </div>
                    </div>  
            </div>   
            
        </main>
                                                <script>
                                                    function previewImage(input) {   
                                                    var imageContainer = $(".image-container img")[0];
                                                    var fileInput = input.files[0];

                                                    if (fileInput) {
                                                        var reader = new FileReader();

                                                        reader.onload = function (e) {
                                                            imageContainer.src = e.target.result;
                                                        };
                                                        reader.readAsDataURL(fileInput);
                                                    }
                                                }
                                                </script>                                            
    </body>
</html>
