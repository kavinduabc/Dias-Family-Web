<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="databaseConn.dbCon"%>
<%@page import="CartModel.*"%>
<%@page import ="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<%
//Connection conn;
	try{
		int userId=1;
		dbCon.connect();
		/*cartDAO dao = new cartDAO(dbCon.connect());
        int length = dao.displayCartLength(userId);*/
%>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Header</title>
  <link rel="stylesheet" href="header.css">
  <!-- Google Icons Link -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>

<body>
  <header>
    <nav class="navbar">
      <a href="index.jsp" class="logo">
        <img src="" alt="Logo">
      </a>
      <ul class="menu-links">
		  <li>
		    <a href="#">Categories</a>
		    <ul class="dropdown">
			   	<% String sqlCat = "SELECT * FROM category WHERE category_id<6;";
		        ResultSet rsCategory = dbCon.executeQuery(sqlCat);
		        while (rsCategory.next()) { %>
			        <li>
			          <a href="product.jsp?sellerId=0&categoryId=<%= rsCategory.getInt("category_id") %>">
			            <%= rsCategory.getString("category_name") %>
			          </a>
			        </li>
		        <% } %>
			</ul>
		  </li>
		  <li>
		    <a href="#">Best Seller</a>
		    <ul class="dropdown">
			   	<% String sqlSeller = "SELECT * FROM seller WHERE seller_id>6;";
		        ResultSet rsSeller = dbCon.executeQuery(sqlSeller);
		        while (rsSeller.next()) { %>
			        <li>
			          <a href="product.jsp?categoryId=0&sellerId=<%= rsSeller.getInt("seller_id") %>">
			            <%= rsSeller.getString("seller_name") %>
			          </a>
			        </li>
		        <% } %>
			</ul>
		  </li>
        <li class="cart-item">
	          <span class="material-symbols-outlined"></span>
	          <a href="cart.jsp"> Cart</a>
        </li>
        <li> <a href="aboutus.jsp">About Us</a> </li>
        <li><a href="contactus.jsp">Contact Us</a></li>
        <%
	        String sqlUser = "SELECT * FROM user WHERE user_id="+userId;
	        ResultSet rsUser = dbCon.executeQuery(sqlUser);
	        while (rsUser.next()) { 
	        	String userType=rsUser.getString("user_type");
	        	if(userType.equals("Admin")){
	        	%>
	        	<li><a href="AdminPanel.html">Admin Panel</a></li>
	    <%} }%>
        
        <li class="join-btn"><a href="login.jsp">Logout</a> </li>
        <span id="close-menu-btn" class="material-symbols-outlined">close</span>
      </ul>
      <span id="hamburger-btn" class="material-symbols-outlined">menu</span>
    </nav>
  </header>
  <section class="hero-section">
    <div class="content">
      <h1>We'll carefully hand pick your shopping, just the way you like</h1>
      <form action="#" class="search-form">
        <input type="text" placeholder="Search for any service..." required>
        <button class="material-symbols-outlined" type="sumbit">search</button>
      </form>
      <div class="popular-tags">
        Popular:
        <ul class="tags">
        <% String sqltag = "SELECT * FROM category ORDER BY category_id DESC LIMIT 4;";
		        ResultSet rstag = dbCon.executeQuery(sqltag);
		        while (rstag.next()) { %>
			        <li>
			          <a href="product.jsp?sellerId=0&categoryId=<%= rstag.getInt("category_id") %>">
			            <%= rstag.getString("category_name") %>
			          </a>
			        </li>
		        <% } %>
        </ul>
      </div>
    </div>
  </section>



  <script>
    const header = document.querySelector("header");
    const hamburgerBtn = document.querySelector("#hamburger-btn");
    const closeMenuBtn = document.querySelector("#close-menu-btn");

    // Toggle mobile menu on hamburger button click
    hamburgerBtn.addEventListener("click", () => header.classList.toggle("show-mobile-menu"));

    // Close mobile menu on close button click
    closeMenuBtn.addEventListener("click", () => hamburgerBtn.click());
  </script>
</body>
<% } catch (Exception e) {
         e.printStackTrace();
   } finally {
       dbCon.close();
   }%>
</html>