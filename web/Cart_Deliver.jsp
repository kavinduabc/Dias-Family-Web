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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shopping cart</title>
        <link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
        <style>
            .table tbody td{
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="d-flex justify-content-between py-3">
                <div>
                    <!-- Button for home page -->
                    <a class="btn btn-secondary" href="home.jsp">Home</a>
                </div>
                <div>
                    <!-- Button for checkout -->
                    <a class="btn btn-primary" href="#">Checkout</a>
                </div>
            </div>

            <div class="d-flex py-3">
                <table class="table table-light">
                    <thead>
                        <tr>
                            <th scope="col">name</th>
                            <th scope="col">category</th>
                            <th scope="col">price</th>
                            <th scope="col">quantity</th>
                            <th scope="col">subtotal</th>
                            <th scope="col">cancel</th>

                        </tr>
                    </thead>
                    <tbody>
                        <%                            //retrieve user id frim the session
                            int userId = 1;
                            double totalPrice = 0.0;
                            double totalQuantity = 0.0;

                            //fetch cart item from database using productDAO class
                            cartDAO dao = new cartDAO(dbCon.connectToDB());
                            List<cart> cartlists = dao.getCartItemsByUserId(userId);
                            
                            //create a list to add the subtotals
                            List<Double> subtotals = new ArrayList<Double>();

                            int length = cartlists.size();
                            //iterate over the cart items
                            for (cart item : cartlists) {
                                // Calculate subtotal for each item
                                double subtotal = item.getPrice() * item.getQuantity();
                                totalPrice += subtotal;
                                totalQuantity += item.getQuantity();
                                subtotals.add(subtotal);
                        %>
                        <tr>
                            <td><%= item.getName()%></td>
                            <td><%= item.getCategory()%></td>
                            <td style="text-align: right;"><%= String.format("%.2f", item.getPrice())%></td>
                            <td>
                                <form action="updateCartQty" method="post" class="form-inline">
                                    <input type="hidden" name="productId" value="<%= item.getProductId()%>">
                                    <div class="form-group d-flex justify-content-between">
                                        <input type="hidden" name="action" value="increment">
                                        <input type="hidden" name="userId" value="<%= userId %>">
                                        <input type="text" name="quantity" class="form-control" value="<%= item.getQuantity()%>" >
                                        <input type="hidden" name="action" value="decrement">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </form>
                            </td>

                            <td style="text-align: right;"><%= String.format("%.2f", subtotal)%></td>
                            <td> 
                                <form action="deleteProduct" method="post" class="form-inline">
                                    <input type="hidden" name="productId" value="<%= item.getProductId()%>">
                                    <div class="form-group d-flex justify-content-between">
                                        <input type="hidden" name="userId" value="<%= userId %>">
                                        <input type="hidden" name="quantity" value="<%= item.getQuantity()%>" >
                                        <button type="submit" class="btn btn-danger">remove</button>
                                    </div>
                                </form>
                            </td>

                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </div>
            <div>

                <h3>
                    total price : <%= String.format("%.2f", totalPrice)%>                               
                </h3>

                <h3>
                    number of items : <%=length%>

                </h3>
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
                %>
                
            </div>
        </div>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.js'>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
    </body>
</html>
