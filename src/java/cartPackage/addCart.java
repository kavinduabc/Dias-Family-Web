package cartPackage;


import productPackage.dbCon;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addCart")
public class addCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ResultSet resultSet;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCart() {
        super();
        // TODO Auto-generated constructor stub
    }


        @Override

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        Connection connection = dbCon.connect();
        response.setContentType("text/html");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String userId = request.getParameter("userId");
        int availableQty=0;
        // Check if an existing entry for the userId exists in the cart table
        String cartProductQuery = "SELECT cart_id, product_id, quantity FROM cart_1 WHERE user_id = ?";
        PreparedStatement statement = connection.prepareStatement(cartProductQuery);
        statement.setString(1, userId);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String cartId = resultSet.getString("cart_id");
            String existingProductIdsString = resultSet.getString("product_id");
            String existingQuantitiesString = resultSet.getString("quantity");

            // Split the existing product IDs and quantities into lists
            List<String> existingProductIdsList = new ArrayList<String>(Arrays.asList(existingProductIdsString.split(",")));
            List<String> existingQuantitiesList = new ArrayList<String>(Arrays.asList(existingQuantitiesString.split(",")));

            // Find the index of the product ID in the list
            int index = existingProductIdsList.indexOf(String.valueOf(productId));

            
            if (index != -1) {
        String availableQtyQuery = "SELECT available_qty FROM product WHERE product_id = ?";
        PreparedStatement availableQtyStatement = connection.prepareStatement(availableQtyQuery);
        availableQtyStatement.setInt(1, productId);
        ResultSet availableQtyResult = availableQtyStatement.executeQuery();
        if (availableQtyResult.next()) {
            availableQty = availableQtyResult.getInt("available_qty");
        }
        int existingQuantity;
        try {
            existingQuantity = Integer.parseInt(existingQuantitiesList.get(index));
        } catch (NumberFormatException e) {
            existingQuantity = 0; // Set a default value if parsing fails
        }
                // Product already exists in the cart, update the quantity
                existingQuantitiesList.set(index, String.valueOf(existingQuantity + quantity));
                availableQty -= 1;
                
            } else {
                // Product does not exist in the cart, add it to the lists
                existingProductIdsList.add(String.valueOf(productId));
                existingQuantitiesList.add(String.valueOf(quantity));
                availableQty -= 1;
            }

            // Convert the updated lists back to strings
            String updatedProductIdsString = String.join(",", existingProductIdsList);
            String updatedQuantitiesString = String.join(",", existingQuantitiesList);

            // Update the cart in the database
            String updateCartQuery = "UPDATE cart_1 SET product_id = ?, quantity = ? WHERE cart_id = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateCartQuery);
            updateStatement.setString(1, updatedProductIdsString);
            updateStatement.setString(2, updatedQuantitiesString);
            updateStatement.setString(3, cartId);
            updateStatement.executeUpdate();
        } else {
            // No existing entry for the userId found, add a new record to the cart table
            String insertCartQuery = "INSERT INTO cart_1 (product_id, user_id, quantity) VALUES (?, ?, ?)";
            PreparedStatement insertStatement = connection.prepareStatement(insertCartQuery);
            insertStatement.setInt(1, productId);
            insertStatement.setString(2, userId);
            insertStatement.setInt(3, quantity);
            insertStatement.executeUpdate();
        }
        // Update the product quantity in the database
        if (availableQty>=0){
        String updateProductQuery = "UPDATE product SET available_qty = ? WHERE product_id = ?";
        PreparedStatement updateProductStatement;

        try {
            updateProductStatement = connection.prepareStatement(updateProductQuery);
            updateProductStatement.setInt(1, availableQty);
            updateProductStatement.setInt(2, productId);
            updateProductStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("cannot update the product");
            // Handle any exceptions that occur during the database update
        }}

        // Redirect back to the cart page
        response.sendRedirect("product.jsp");
    } catch (SQLException ex) {
        Logger.getLogger(addCart.class.getName()).log(Level.SEVERE, null, ex);
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(addCart.class.getName()).log(Level.SEVERE, null, ex);
    }
}
}
