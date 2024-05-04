<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Viewing Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="productView.css">
</head>
<body>
	<%@ page import="java.io.*, java.util.*, java.sql.*" %>
	<%@ page import = "productPackage.databaseConn"  %>
	
    <div class="container pt-6">
        <div class="row">
	        <%
	        	String productId= request.getParameter("productId");
	        	String isInCartString= request.getParameter("isInCart");
	        	String imgSrc= request.getParameter("imgSrc");
	        	boolean isInCart = Boolean.parseBoolean(isInCartString);
	        	databaseConn conn=new databaseConn();
	        	conn.connect();
	        	
	        	//execute the query
	        	String sql = "SELECT * FROM product WHERE product_id="+productId;
	        	ResultSet rs = conn.executeQuery(sql);
	        	while(rs.next()){
	        %>
            <!-- Item Image Column -->
            <div class="col-md-2"></div>
            <div class="col-md-5 ">
                <div class="product-box">
                    <img src="images/<%=imgSrc %>" class="product-image img-fluid">
                </div>
            </div>
            <!-- Item Details Column -->
            <div class="col-md-4">
                <div class="pname"><%= rs.getString("product_name") %></div>
                <div class="price">Price : <%= String.format("%.2f", rs.getDouble("product_price")) %>/=</div>
                <div class="quantity">
                    <p>Quantity : </p>
                    <input type="number" min="1" value="1">
                </div>
                <div class="btn-box ">
                    <%if(!isInCart){ %>
		                    	<button type="submit" class="cart-btn">Add to cart</button>
		            <%}else{ %>
		                    	<button type="submit" class="added-cart-btn" disabled>Added</button>
		            <%} %>
                    <button class="buy-btn ">Buy Now</button>
                </div>
            </div>
            <%} %>
        </div>
    </div>
<% conn.close(); %>
</body>
</html>
