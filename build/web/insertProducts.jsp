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
 <style>
      @import url('https://fonts.googleapis.com/css2?family=Fira+Sans:wght@300;400;500;600;700&display=swap');
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
          font-family: 'Fira Sans', sans-serif;
        }  

        .card {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
        margin: 5px;
        }
        .image-container
        {
            padding: 10px;
        }
        .form-group
        {
            padding: 5.5px;
        }
  
        
        
    </style>        
    </head>
    <body>
       
        <main>
            <div class="container col-md-5 pt-5">
                <div class="card mb-3" style="max-width: 800px;"  id="form-wrapper">
                             			
                    <h2 class="card-header">
						<c:if test="${product != null}">
            			Edit Product
            		</c:if>
						<c:if test="${product == null}">
            			Add New Product
            		</c:if>
                    </h2>               
                    <div class="row g-0">
                        <div class="col-md-4 d-flex justify-content-center align-items-center">

                            <div class="image-container" id="preview">
                                
                            </div>
                         </div>                        
			<div class="card-body col-md-8">
				<c:if test="${product != null}">
					<form action="update" method="post" enctype="multipart/form-data">
				</c:if>
				<c:if test="${product == null}">
					<form action="insert" method="post" enctype="multipart/form-data">
				</c:if>



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
					<label>Quantity</label> <input type="text"
						value="<c:out value='${product.qty}' />" class="form-control"
						name="quantity">
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
                                
                                    <label>Product Image</label>
                                            <input type="file" class="form-control" name="productImage" value="images/<c:out value='${product.productImage}' />" accept="image/*" onchange="getImagePreview(event)">
                                </fieldset>
				<button type="submit" class="btn btn-success">Save</button>
				</form>
                    
                </div>
                    </div>  
            </div>   
            
        </main>
                                                <script>
                                                     function getImagePreview(event)
                                                     {
                                                       var image = URL.createObjectURL(event.target.files[0]);
                                                       var imagediv = document.getElementById('preview');
                                                       var newimg = document.createElement('img');
                                                      
                                                       newimg.src = image;
                                                       newimg.width = "200";
                                                       imagediv.appendChild(newimg);
                                                     }
                                                </script> 
                                                
                                                
    </body>
</html>
