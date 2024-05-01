package cartServlets;

import database_connection.dbCon;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
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
@WebServlet(name = "deleteProduct", urlPatterns = {"/deleteProduct"})
public class deleteProduct extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ResultSet resultSet;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        Connection connection = dbCon.connectToDB();
        response.setContentType("text/html");

        int productId = Integer.parseInt(request.getParameter("productId"));
        int userId = Integer.parseInt(request.getParameter("userId"));

        // Retrieve the cart product IDs and quantities from the database
        String updatedProductIdsString = "";
        String updatedQuantitiesString = "";

        try {
            String cartProductsQuery = "SELECT product_id, quantity FROM cart_1 where user_id= ?";
            PreparedStatement statement = connection.prepareStatement(cartProductsQuery);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                updatedProductIdsString = resultSet.getString("product_id");
                updatedQuantitiesString = resultSet.getString("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions that occur during database access
        }

        // Convert the updated product IDs and quantities from strings to arrays
        String[] updatedProductIds = updatedProductIdsString.split(",");
        String[] updatedQuantities = updatedQuantitiesString.split(",");

        // Convert the updated product IDs and quantities from strings to ArrayLists
        ArrayList<String> updatedProductIdsList = new ArrayList<String>(Arrays.asList(updatedProductIds));
        ArrayList<String> updatedQuantitiesList = new ArrayList<String>(Arrays.asList(updatedQuantities));

        // Find the index of the product in the cart
        int index = -1;
        for (int i = 0; i < updatedProductIds.length; i++) {
            String updatedProductId = updatedProductIds[i];
            if (!updatedProductId.isEmpty() && Integer.parseInt(updatedProductId) == productId) {
                index = i;
                break;
            }
        }

        if (index >= 0) {
            // Remove the element at the specified index
            updatedProductIdsList.remove(index);
            updatedQuantitiesList.remove(index);
        }

        // Convert the updated product IDs and quantities back to arrays
        updatedProductIds = updatedProductIdsList.toArray(new String[0]);
        updatedQuantities = updatedQuantitiesList.toArray(new String[0]);

        // Convert the updated product IDs and quantities back to strings
        String updatedProductIdsStringNew = String.join(",", updatedProductIds);
        String updatedQuantitiesStringNew = String.join(",", updatedQuantities);
        
        // Update the cart in the database
        String updateCartQuery = "UPDATE cart_1 SET product_id = ?, quantity = ? where user_id= ?; ";
        PreparedStatement updateStatement = null;

        try {
            updateStatement = connection.prepareStatement(updateCartQuery);
            updateStatement.setString(1, updatedProductIdsStringNew);
            updateStatement.setString(2, updatedQuantitiesStringNew);
            updateStatement.setInt(3, userId);
            updateStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions that occur during the database update
        } finally {
            if (updateStatement != null) {
                try {
                    updateStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        // Redirect back to the cart page
        response.sendRedirect("Cart_Deliver.jsp");

    }
}
