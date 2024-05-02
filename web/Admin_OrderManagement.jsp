<%-- 
    Document   : Admin_OrderManagement
    Created on : Apr 27, 2024, 6:40:23 PM
    Author     : Kavindu Piyumal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Oder Page</title>
                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="css/Admin_Order.css">
    </head>
    <body>
        <body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Order List</h1>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Address</th>
                        <th>Total</th>
                        <th>Status ID</th>
                        <th>User ID</th>
                        <th>Payment Method ID</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Connection connection = null;
                        Statement statement = null;
                        ResultSet rs = null;
                        try {
                            // JDBC connection
                            Class.forName("com.mysql.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3306/shop_order";
                            String username = "root";
                            String password = "";
                            connection = DriverManager.getConnection(url, username, password);
                            
                            // SQL query
                            String query = "SELECT * FROM shop_order";
                            statement = connection.createStatement();
                            rs = statement.executeQuery(query);
                            
                            // Display orders
                            while (rs.next()) {
                    %>
                    <tr id="row_<%= rs.getInt("order_id") %>">
                        <td><%= rs.getInt("order_id") %></td>
                        <td><%= rs.getString("order_date") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getDouble("order_total") %></td>
                        <td><%= rs.getInt("order_status_id") %></td>
                        <td><%= rs.getInt("user_id") %></td>
                        <td><%= rs.getInt("payment_method_id") %></td>
                        <td>
                            <span id="quantity_<%= rs.getInt("order_id") %>">1</span>
                            <button class="button" onclick="addQuantity(<%= rs.getInt("order_id") %>)">+</button>
                            <button class="button" onclick="subtractQuantity(<%= rs.getInt("order_id") %>)">-</button>
                        </td>
                        <td>
                            <button class="btn btn-primary" onclick="updateTotal(<%= rs.getInt("order_id") %>)">Update Total</button>
                            <button class="btn btn-danger" onclick="deleteRow(<%= rs.getInt("order_id") %>)">Delete</button>
                        </td>
                    </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
                            try {
                                if (rs != null) rs.close();
                                if (statement != null) statement.close();
                                if (connection != null) connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="text-center">
            <button class="btn btn-success" onclick="addNewRow()">Add New Row</button>
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Your custom JavaScript -->
    <script>
        // Your JavaScript functions
        function addQuantity(orderId) {
            var quantitySpan = document.getElementById("quantity_" + orderId);
            var quantity = parseInt(quantitySpan.textContent);
            quantity++;
            quantitySpan.textContent = quantity;
        }

        function subtractQuantity(orderId) {
            var quantitySpan = document.getElementById("quantity_" + orderId);
            var quantity = parseInt(quantitySpan.textContent);
            if (quantity > 1) {
                quantity--;
                quantitySpan.textContent = quantity;
            }
        }

        function updateTotal(orderId) {
            // Implement your logic to update the total for the order with the given ID
            // You can use AJAX to send the updated quantity to the server and update the total
            // Here, I'm just alerting the user with the updated quantity
            var quantitySpan = document.getElementById("quantity_" + orderId);
            var quantity = parseInt(quantitySpan.textContent);
            alert("Updated quantity for order " + orderId + ": " + quantity);
        }

        function deleteRow(orderId) {
            // Implement your logic to delete the row with the given ID
            // You can use AJAX to send the request to the server to delete the row
            // Here, I'm just removing the row from the DOM
            var row = document.getElementById("row_" + orderId);
            row.remove();
        }

        function addNewRow() {
            var table = document.querySelector(".table tbody");
            var newRow = table.insertRow(table.rows.length);
            var cellCount = table.rows[0].cells.length;

            for (var i = 0; i < cellCount - 1; i++) {
                var cell = newRow.insertCell(i);
                cell.innerHTML = "<input type='text' class='form-control'>";
            }

            var quantityCell = newRow.insertCell(cellCount - 1);
            quantityCell.innerHTML = "<span class='mr-2'>1</span> <button class='btn btn-sm btn-primary' onclick='addQuantity()'>+</button> <button class='btn btn-sm btn-primary' onclick='subtractQuantity()'>-</button>";

            var actionCell = newRow.insertCell(cellCount);
            actionCell.innerHTML = "<button class='btn btn-sm btn-success' onclick='saveNewRow()'>Save</button>";
        }

        function saveNewRow() {
            // Get input values from the newly added row
            var inputs = document.querySelectorAll(".table tbody tr:last-of-type input");
            var values = [];
            inputs.forEach(function(input) {
                values.push(input.value);
            });

            // For demonstration, just alert the values
            var newRowData = "New Row Data:\n" + values.join("\n");
            alert(newRowData);
        }
    </script>
</body>
    </body>
</html>
