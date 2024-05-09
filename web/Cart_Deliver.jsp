<%--
    Document   : index
    Created on : Apr 14, 2024, 6:42:33 AM
    Author     : Dewmini
--%>

<%@page import="java.util.*"%>
<%@page import="CartModel.*"%>
<%@page import="cartServlets.*"%>
<%@page import="java.sql.*"%>
<%@page import="database_connection.dbCon"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shopping cart</title>
        <link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">

        <!--customized CSS file-->
        <link rel='stylesheet' href='css/cart.css'>
        <style>
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container">



            <%   try{                          
                // Retrieve the "userId" attribute from the session
    		Object userIdObj = session.getAttribute("userId");

    		// Default value in case the attribute is not set or is not an integer
    		int userId = 0;

    		if (userIdObj != null) {
    		    try {
    		        // Convert the retrieved object to an integer
    		        userId = Integer.parseInt(userIdObj.toString());
    		    } catch (NumberFormatException e) {
    		        // Handle the exception if the conversion to an integer fails
    		        out.println("Error: Could not convert 'userId' to an integer.");
    		        e.printStackTrace();
    		    }
    		} else {
    			response.sendRedirect("Login.jsp");
    		}
                double totalPrice = 0.0;
                double totalQuantity = 0.0;

                //fetch cart item from database using productDAO class
                cartDAO dao = new cartDAO(dbCon.connectToDB());
                List<cart> cartlists = dao.getCartItemsByUserId(userId);

                //create a list to add the subtotals
                List<Double> subtotals = new ArrayList<Double>();

                
                int length = dao.displayCartLength(userId);

                if (length == 0) {
            %>
            <div class="alert alert-info" role="alert">
                Your cart is empty. Explore our store <a href="index.jsp" class="btn btn-primary">Go to Store</a>
            </div>
            <%
            } else {

                //iterate over the cart items
%>
            <div class="left-side">
                <br>
                <div class="heading-box">
                    
                    <span class="bi bi-cart-fill cart-icon"></span> 
                </div>
                <div class="d-flex py-3" id="cart-table-content" >                      

                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th scope="col" style="text-align:center;">Item</th>
                                <th scope="col" style="text-align: left;">Unit Price</th>
                                <th scope="col" style="text-align: center;">Quantity</th>
                                <th scope="col" style="text-align: left;">Total</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (cart item : cartlists) {
                                    // Calculate subtotal for each item
                                    double subtotal = item.getPrice() * item.getQuantity();
                                    totalPrice += subtotal;
                                    totalQuantity += item.getQuantity();
                                    subtotals.add(subtotal);
                            %>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        
                                        <img src="images/<%= item.getImage()%>" alt=" //item.getImage()" class="img-thumbnail" style="max-width: 100px;">
                                        
                                        <div class="ml-2">
                                            <%= item.getName()%>
                                            <br>
                                            <small><%= item.getCategory()%></small>
                                        </div>
                                    </div>
                                </td>
                                <td style="text-align: left;"><%= String.format("%.2f", item.getPrice())%></td>
                                <td>
                                    <form action="updateCartQty" method="post" class="form-inline">
                                        <input type="hidden" name="productId" value="<%= item.getProductId()%>">
                                        <div class="form-group d-flex justify-content-between">

                                            <input type="hidden" name="userId" value="<%= userId%>">
                                            <!--<input type="hidden" name="operation" value="">-->

                                            <button type="submit" name="operation" value="-" class="btn btn-sm btn-decre">
                                                <i class="fas fa-minus-square"></i>
                                            </button>
                                            <input type="text" name="quantity" class="form-control" style="width: 80px;" value="<%= item.getQuantity()%>" >
                                            <button type="submit" name="operation" value="+" class="btn btn-sm btn-incre">
                                                <i class="fas fa-plus-square"></i>
                                            </button>
                                        </div>
                                    </form>
                                </td>
                                <td style="text-align: left;"><%= String.format("%.2f", subtotal)%></td>
                                <td>
                                    <form action="deleteProduct" method="post" class="form-inline">
                                        <input type="hidden" name="productId" value="<%= item.getProductId()%>">
                                        <div class="form-group">
                                            <input type="hidden" name="userId" value="<%= userId%>">
                                            <input type="hidden" name="quantity" value="<%= item.getQuantity()%>" >
                                            <button type="submit" class="btn btn-danger">
                                                <i class="fas fa-trash"></i> </button>
                                        </div>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>

                </div>
            </div>
            <div class="row" >
                <div class="col-md-9"></div>
                <div class="col-md-3">
                    <h5>Total price : <%= String.format("%.2f", totalPrice)%></h5>
                    <h5>Number of items : <%=length%></h5>
                    <div class="d-flex justify-content-start">
                        <button class="btn btn-primary checkout" onclick="window.location.href = 'payment.jsp'">checkout</button>
                    </div>

                    <%
                            // convert subtotals to a string
                            StringBuilder subtotalBuilder = new StringBuilder();
                            for (int i = 0; i < subtotals.size(); i++) {
                                subtotalBuilder.append(subtotals.get(i));
                                if (i < subtotals.size() - 1) {
                                    subtotalBuilder.append(",");
                                }
                            }
                            String subtotalString = subtotalBuilder.toString();
                            dao.updateSubtotals(userId, subtotalString);
                            dao.updateTotal(userId, totalPrice);
                            dao.updateLength(userId, length);
                        }
                    %>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.js'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
    </body>
    <% } catch (Exception e) {
         e.printStackTrace();
   } finally {
       dbCon.close();
   }%>
</html>
