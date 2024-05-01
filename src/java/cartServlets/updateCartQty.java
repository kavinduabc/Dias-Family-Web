package cartServlets;

import database_connection.dbCon;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dewmini
 */
@WebServlet(name = "updateCartQty", urlPatterns = {"/updateCartQty"})
public class updateCartQty extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ResultSet resultSet;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = dbCon.connectToDB();
        response.setContentType("text/html");
        //String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        double quantity = Double.parseDouble(request.getParameter("quantity"));
        //String userId = request.getParameter("userId");
        int userId = Integer.parseInt(request.getParameter("userId"));
        String operation = request.getParameter("operation");
        //response.getWriter().write(action);
        //response.getWriter().write(productId +"<br>");
        //response.getWriter().write("quantity"+quantity +"<br>");

        // Retrieve the cart product IDs and quantities from the database
        String updatedProductIdsString = "";
        String updatedQuantitiesString = "";

        try {
            String cartProductsQuery = "SELECT product_id, quantity FROM cart_1 where user_id= ?";
            PreparedStatement statement = connection.prepareStatement(cartProductsQuery);
            statement.setInt(1, userId);
            //statement.setString(1, cartProductsQuery);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                updatedProductIdsString = resultSet.getString("product_id");
                updatedQuantitiesString = resultSet.getString("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            //response.getWriter().write("cannot retrieve product id and quantity");
            // Handle any exceptions that occur during database access
        }

        // Convert the updated product IDs and quantities from strings to arrays
        String[] updatedProductIds = updatedProductIdsString.split(",");
        String[] updatedQuantities = updatedQuantitiesString.split(",");

        //display the values
//        for (int i=0;i<updatedProductIds.length;i++){
//            response.getWriter().write("updated product ids list" +i +":"+updatedProductIds[i] +"<br>");
//        }
//        
//        for (int i=0;i<updatedQuantities.length;i++){
//            response.getWriter().write("updated quantity ids list" +i +":"+updatedQuantities[i]+"<br>");
//        }
        // Find the index of the product in the cart
        int index = -1;
        for (int i = 0; i < updatedProductIds.length; i++) {
            String updatedProductId = updatedProductIds[i];
            if (!updatedProductId.isEmpty() && Integer.parseInt(updatedProductId) == productId) {
                index = i;
                //print the index
                //response.getWriter().write("index :"+index+"<br>");
                break;
            }
        }

        int availableQty = 0;

        if (index >= 0) {
            if (quantity > 0) {
                try {
                    String availableQtyQuery = "SELECT available_qty FROM product WHERE product_id = ?";
                    PreparedStatement availableQtyStatement = connection.prepareStatement(availableQtyQuery);
                    availableQtyStatement.setInt(1, productId);
                    ResultSet availableQtyResult = availableQtyStatement.executeQuery();
                    if (availableQtyResult.next()) {
                        availableQty = availableQtyResult.getInt("available_qty");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (operation.equals("+")) {
                    if (availableQty > 0) {
                        quantity += 1.0;
                        availableQty -= 1;
                    } else {
                        response.getWriter().write("<script>alert('Insufficient quantity available for this product.');</script>");
        }
                } else if (operation.equals("-") && quantity > 1) {
                    quantity -= 1.0;
                    availableQty += 1;
                } else {
                    response.getWriter().write("<script>alert('Quantity cannot be less than 1.');</script>");
                }
            } else {
                response.getWriter().write("<script>alert('Invalid quantity input. Please enter a positive number.');</script>");
            }
            updatedQuantities[index] = String.valueOf(quantity);
        }

        //}
        // Convert the updated product IDs and quantities back to strings
        String updatedProductIdsStringNew = String.join(",", updatedProductIds);
        String updatedQuantitiesStringNew = String.join(",", updatedQuantities);

        //display the string values
        response.getWriter().write("updatedProductIdsStringNew :" + updatedProductIdsStringNew + "<br>");
        response.getWriter().write("updatedQuantitiesStringNew :" + updatedQuantitiesStringNew + "<br>");

        // Update the cart in the database
        String updateCartQuery = "UPDATE cart_1 SET product_id = ?, quantity = ? where user_id= ? ";
        PreparedStatement updateStatement;

        try {
            updateStatement = connection.prepareStatement(updateCartQuery);
            updateStatement.setString(1, updatedProductIdsStringNew);
            updateStatement.setString(2, updatedQuantitiesStringNew);
            updateStatement.setInt(3, userId);
            updateStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("cannot update the product");
            // Handle any exceptions that occur during the database update
        }
        // Update the product quantity in the database
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
        }

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        //doPost(request, response);
    }
}
