<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="productPackage.dbCon"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.*"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<% ArrayList<Integer> pIds = new ArrayList<Integer>();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="product.css">

<title>Products</title>
</head>
<body>
	<%
            dbCon conn = null;
            try {
            	
                conn = new dbCon();
                conn.connect();
				
                
                int userId = 3;
            	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            	int sellerId=Integer.parseInt(request.getParameter("sellerId"));
            	
              //fetching category items in category table
  	          String categoryName = null;
  	          String queryCategory= "SELECT * FROM category WHERE category_id ="+categoryId+";";	
  	          ResultSet resultCategory = conn.executeQuery(queryCategory);
  	          while(resultCategory.next()){
  	        	  categoryName=resultCategory.getString("category_name");
  	          }
  	          
  	      	  //fetching seller items in  seller table
  	          String sellerName = null;
  	          String querySeller= "SELECT * FROM seller WHERE seller_id ="+sellerId+";";	
  	          ResultSet resultSeller = conn.executeQuery(querySeller);
  	          while(resultSeller.next()){
  	        	  sellerName=resultSeller.getString("seller_name");
  	          }
        %>

	<div class="conntainer">
		<div class="search-container">
        	<% if(categoryId>0){ %>
	        	<h2 class="title"><%= categoryName %></h2>
	        <%}if(sellerId>0){ %>
		    	<h2 class="title"><%= sellerName %></h2>
		    <%} %>
		    <div class="search">
		    	<span class="material-symbols-outlined"> search </span>
       			<input type="text" name="" id="find" placeholder="Search here...." onkeyup="search()">
       		</div>
		</div>
		<hr class="hr-category">
		<div class="listproduct" id="categoryId">
		
		<%// Retrieve the cart product IDs and quantities from the database
        String updatedProductIdsString = "";
		List<Integer> updatedProductIdsList = new ArrayList<Integer>();

		
		    String cartProductsQuery = "SELECT product_id FROM cart_1 WHERE user_id = ?";
		    PreparedStatement statement = conn.prepareStatement(cartProductsQuery);
		    statement.setInt(1, userId);
		    ResultSet resultSet = statement.executeQuery();
		    if (resultSet.next()) {
		        updatedProductIdsString = resultSet.getString("product_id");
		    }
		    
		    // Split the string by commas and parse each substring as an integer
		    String[] productIdStrings = updatedProductIdsString.split(",");
		    for (String productIdString : productIdStrings) {
		        try {
		            int productId = Integer.parseInt(productIdString.trim());
		            updatedProductIdsList.add(productId);
		        } catch (NumberFormatException e) {
		            // Handle parsing errors as needed
		            e.printStackTrace();
		        }
		    }

        	//Fetching all products from database
			String sql= null;
			if(categoryId > 0){
				sql = "SELECT * FROM product WHERE category_id="+categoryId+";";
			}if(sellerId > 0){
				sql = "SELECT * FROM product WHERE seller_id="+sellerId+";";
			}
            ResultSet rs = conn.executeQuery(sql);
            while (rs.next()) {
	            boolean isInCart = false;
	            int productId = rs.getInt("product_id");
				int product_catId = rs.getInt("category_id");
				String catName = null;
				//get category name where product.category id= category.categoryId
				String sqlGetCatName = "SELECT category_name FROM category WHERE category_id="+product_catId;
				ResultSet rsGetCatName=conn.executeQuery(sqlGetCatName);
				while(rsGetCatName.next()){
					catName=rsGetCatName.getString("category_name");
				}
						
	            // Check if the product is in the cart
	            for (int id : updatedProductIdsList) {
	                if (productId == id) {
	                    isInCart = true;
	                    break;
	                }
	            }
	            String imgSrc= catName +"/"+rs.getString("product_image");
                %>
			<div
				onclick="redirectToProductView('<%= productId%>', '<%= isInCart%>', '<%=imgSrc %>')"
				class="item">
				<img src="images/<%=imgSrc%>" alt="images/<%=imgSrc%>">
				<h2><%= rs.getString("product_name")%></h2>
				<h4 class="price">
					<%= String.format("%.2f", rs.getDouble("product_price"))%>/=
				</h4>
				<form action="addCart" method="post">
					<div class="card-footer">
						<input type="hidden" name="userId" value="<%= userId%>" /> <input
							type="hidden" name="productId"
							value="<%= rs.getInt("product_id")%>"> <input
							type="hidden" name="quantity" value="1">
						<% if (!isInCart) { %>
						<button type="submit" class="cart-btn">Add to cart</button>
						<% } else { %>
						<button type="submit" class="added-cart-btn" disabled>Added</button>
						<% } %>
					</div>
				</form>
			</div>
		<% } %>
		</div>
	</div>
	<script>
	    function redirectToProductView(productId, isInCart , imgSrc) {
	        window.location.href = 'productView.jsp?productId=' + productId + '&isInCart=' + isInCart+'&imgSrc='+imgSrc;
    	}
	    
	    const search = (categoryId) => {
	        const searchbox = document.getElementById('find').value.toUpperCase();
	        const storeitems = document.getElementById('listproduct');
	        const products = document.querySelectorAll('.item');

	        for (let i = 0; i < products.length; i++) {
	            const productName = products[i].querySelector('h2');
	            if (productName) {
	                const textValue = productName.textContent || productName.innerHTML;
	                if (textValue.toUpperCase().indexOf(searchbox) > -1) {
	                    products[i].style.display = '';
	                } else {
	                    products[i].style.display = 'none';
	                }
	            }
	        }
	    }

	</script>

	<% } catch (Exception e) {
                e.printStackTrace();
       } finally {
                if (conn != null) {
                    conn.close();
                }
       }%>
</body>
</html>
