<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "productPackage.databaseConn"  %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.*" %>
<% ArrayList<Integer> pIds = new ArrayList<>();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="product.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<title>Products</title>
</head>
<body>
	<%
		databaseConn conn = null;
		try{
			
			conn = new databaseConn();
	          conn.connect();
			  String userId="1";
	          int categoryId = 2;
	          int sellerId=-1;
	          
	          //fetching category items in category table
	          String categoryName = null;
	          String queryCategory= "SELECT * FROM category WHERE category_id ="+categoryId;
	          ResultSet resultCategory = conn.executeQuery(queryCategory);
	          while(resultCategory.next()){
	        	  categoryName=resultCategory.getString("category_name");
	          }
	          
	%>
	
	<div class="conntainer">
        <div class="search-container">
        	
		    <h2 class="title"><%= categoryName %></h2>
		    
		    <div class="search">
		    	<span class="material-symbols-outlined">search</span>
       			<input type="text" name="" id="find" placeholder="Search here...." onkeyup="search()">
       		</div>
		</div>
        <hr class="hr-category">
        <div class="listproduct id="listproduct">
	        <%
        // Connect to database
        
      		//fetching all cart items related to the user
          	String queryCart = "SELECT * FROM product JOIN cart ON product.product_id = cart.product_id WHERE cart.user_id = " + userId + " ORDER BY cart.cart_id DESC;";
          	ResultSet resultcart = conn.executeQuery(queryCart);
          	while (resultcart.next()) {
	        	  int pId = resultcart.getInt("product_id");
	        	  pIds.add(pId);
	        }

          	
          	
	        // Fetching all products from database
	        String sql= null;
	        if(categoryId >= 0){
	        	sql = "SELECT * FROM product WHERE category_id="+categoryId+";";
	        }else{
	        	sql = "SELECT * FROM product WHERE category_id="+sellerId+";";
	        }
	        ResultSet rs = conn.executeQuery(sql);
	        while (rs.next()) {
	          boolean isInCart = false;
	          int productId = rs.getInt("product_id");
	          
	        	// Access the product IDs in the array
	        	for (int id : pIds) {
	        		if (productId == id) {
		                  isInCart = true;
		                  break;
		            }
	        	}
	        	%>
        		<div  onclick= "redirectToProductView('<%= productId %>','<%=isInCart %>','<%=categoryName %>')" class="item">
	                <img src="images/<%=categoryName %>/<%=rs.getString("product_image") %>" alt="category_name">
	                <h2><%= rs.getString("product_name") %></h2>
	                <h4 class="price"> <%= String.format("%.2f", rs.getDouble("product_price")) %>/=</h4>
	                <form action="addCart" method="get">
		                <div class="footer-card">
		                	<input type="hidden" name="userId" value="1"/>
		                	<input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>">
		                	<input type="hidden" name="quantity" value="1">
		                	<%if(!isInCart){ %>
		                    	<button type="submit" class="cart-btn">Add to cart</button>
		                    <%}else{ %>
		                    	<button type="submit" class="added-cart-btn" disabled>Added</button>
		                    <%} %>
		                </div> 
	                </form>
	            </div>
            <%} %>
        </div>
    </div>
    <script>
	    function redirectToProductView(productId, isInCart , categoryName) {
	        window.location.href = 'productView.jsp?productId=' + productId + '&isInCart=' + isInCart+'&categoryName='+categoryName;
    	}
	    
	    const search = () => {
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
	<%
        } catch (Exception e) {
          // Handle database connection error
          out.println(e.getMessage());
        } finally {
          if (conn != null) {
            conn.close();
          }
        }
      %>
</body>
</html>
