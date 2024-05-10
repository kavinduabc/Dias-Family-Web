package CartModel;
//dao means Data Access Object. daos are used to handle database opertaions.
//provide methods to interact with the database for crud

import database_connection.dbCon;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 *
 * @author Dewmini
 */
public class cartDAO {

    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public cartDAO(Connection con) {
        this.con = con;
    }

    public List<cart> getCartItemsByUserId(int userId) {
        List<cart> product = new ArrayList<cart>();
        try {
            query = "SELECT c.*,p.product_id, p.product_name, p.product_price, p.product_image FROM cart_1 c "
                    + "JOIN product p ON FIND_IN_SET(p.product_id, c.product_id) "
                    + "WHERE c.user_id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            //get the user id from the session...
            while (rs.next()) {
                String[] productIds = rs.getString("product_id").split(",");
                String[] quantities = rs.getString("quantity").split(",");
                
                // Reverse the order of productIds and quantities arrays
                List<String> productIdList = Arrays.asList(productIds);
                List<String> quantityList = Arrays.asList(quantities);
                Collections.reverse(productIdList);
                Collections.reverse(quantityList);
                //productIds and quantities arrays have the same length
                for (int i = 0; i < productIds.length; i++) {
                    // Create a new cart item
                    cart item = new cart();

                    // Set cart item properties from the arrays
                    item.setProductId(Integer.parseInt(productIds[i]));
                    item.setUserId(userId); // Set user ID from the method parameter
                    item.setQuantity(Double.parseDouble(quantities[i]));
                     

                    // Retrieve product details based on product ID
                    product productDetails = getProductById(Integer.parseInt(productIds[i]));

                    // Set product details to the cart item
                    item.setName(productDetails.getName());
                    item.setPrice(productDetails.getPrice());
                    item.setImage(productDetails.getImage());

                    // Retrieve category name based on category ID
                    String categoryName = getCategoryNameById(productDetails.getCategoryId());

                    // Set category name to the cart item
                    item.setCategory(categoryName);

                    // Add the cart item to the list
                    product.add(item);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    
    public cart getCartId(int userId){
        cart cartId=null;
        try {
            query = "SELECT cart_id FROM cart_1 WHERE user_id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            // Check if there are multiple rows returned
            if (rs.next()) {
                // Initialize the productDetails object
                cart cId = new cart();
                cId.setId(rs.getInt("cart_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return cartId;
    }
    
    public product getProductById(int productId) {
        product productDetails = null;
        try {
            query = "SELECT * FROM product WHERE product_id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, productId);
            rs = pst.executeQuery();

            // Check if there are multiple rows returned
            if (rs.next()) {
                // Initialize the productDetails object
                productDetails = new product();
                productDetails.setId(rs.getInt("product_id"));
                productDetails.setName(rs.getString("product_name"));
                productDetails.setCategoryId(rs.getInt("category_id"));
                productDetails.setPrice(rs.getDouble("product_price"));
                productDetails.setImage(rs.getString("product_image"));
                
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDetails;
    }

    public String getCategoryNameById(int categoryId) {
        String categoryName = null;
        try {
            query = "SELECT category_name FROM category WHERE category_id = ?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, categoryId);
            rs = pst.executeQuery();
            if (rs.next()) {
                categoryName = rs.getString("category_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryName;
    }
    
    // Method to update the subtotals in the database
    public void updateSubtotals(int userId, String subtotalString) {
     try {
            query = "UPDATE cart_1 SET subtotal = ? WHERE user_id = ?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, subtotalString);
            pst.setInt(2, userId);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
    
    // Method to update total in the database
    public void updateTotal(int userId, double totalPrice) {
        try {
            query = "UPDATE cart_1 SET total = ? WHERE user_id = ?";
            pst = con.prepareStatement(query);
            pst.setDouble(1, totalPrice);
            pst.setInt(2, userId);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Method to update length in the database
    public void updateLength(int userId, int length) {
        try {
            query = "UPDATE cart_1 SET item_count = ? WHERE user_id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, length);
            pst.setInt(2, userId);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
       
    
    
    public int displayCartLength(int userId) {
    	List<cart> cartlists = getCartItemsByUserId(userId);
		int length = cartlists.size();
		return length;
    }
    
    public void deleteProduct(int userId, int productId, double quantity){
            // Retrieve the cart product IDs and quantities from the database
        String updatedProductIdsString = "";
        String updatedQuantitiesString = "";

        try {
            String cartProductsQuery = "SELECT product_id, quantity FROM cart_1 where user_id= ?";
            PreparedStatement statement = con.prepareStatement(cartProductsQuery);
            statement.setInt(1, userId);
            rs = statement.executeQuery();
            if (rs.next()) {
                updatedProductIdsString = rs.getString("product_id");
                updatedQuantitiesString = rs.getString("quantity");
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
            
            // Update the product quantity in the database
        String updateProductQuery = "UPDATE product SET available_qty = available_qty + ? WHERE product_id = ?";
        PreparedStatement updateProductStatement;

        try {
            updateProductStatement = con.prepareStatement(updateProductQuery);
            updateProductStatement.setDouble(1, quantity);
            updateProductStatement.setInt(2, productId);
            updateProductStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any exceptions that occur during the database update
        }
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
            updateStatement = con.prepareStatement(updateCartQuery);
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
    }
    
    public void updateCartQuantity (int userId, int productId, double quantity, String operation){
        ResultSet resultSet;
        String updatedProductIdsString = "";
        String updatedQuantitiesString = "";

        try {
            String cartProductsQuery = "SELECT product_id, quantity FROM cart_1 where user_id= ?";
            PreparedStatement statement = con.prepareStatement(cartProductsQuery);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                updatedProductIdsString = resultSet.getString("product_id");
                updatedQuantitiesString = resultSet.getString("quantity");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String[] updatedProductIds = updatedProductIdsString.split(",");
        String[] updatedQuantities = updatedQuantitiesString.split(",");

        int index = -1;
        for (int i = 0; i < updatedProductIds.length; i++) {
            String updatedProductId = updatedProductIds[i];
            if (!updatedProductId.isEmpty() && Integer.parseInt(updatedProductId) == productId) {
                index = i;
                break;
            }
        }

        int availableQty = 0;

        if (index >= 0) {
            if (quantity > 0) {
                try {
                    String availableQtyQuery = "SELECT available_qty FROM product WHERE product_id = ?";
                    PreparedStatement availableQtyStatement = con.prepareStatement(availableQtyQuery);
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
                        System.out.println("Insufficient quantity available for this product.");
                    }
                } else if (operation.equals("-") && quantity > 1) {
                    quantity -= 1.0;
                    availableQty += 1;
                } else {
                    System.out.println("Quantity cannot be less than 1.");
                }
            } else {
                System.out.println("Invalid quantity input. Please enter a positive number.");
            }
            updatedQuantities[index] = String.valueOf(quantity);
        }


        String updatedProductIdsStringNew = String.join(",", updatedProductIds);
        String updatedQuantitiesStringNew = String.join(",", updatedQuantities);

        String updateCartQuery = "UPDATE cart_1 SET product_id = ?, quantity = ? where user_id= ? ";
        PreparedStatement updateStatement;

        try {
            updateStatement = con.prepareStatement(updateCartQuery);
            updateStatement.setString(1, updatedProductIdsStringNew);
            updateStatement.setString(2, updatedQuantitiesStringNew);
            updateStatement.setInt(3, userId);
            updateStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String updateProductQuery = "UPDATE product SET available_qty = ? WHERE product_id = ?";
        PreparedStatement updateProductStatement;

        try {
            updateProductStatement = con.prepareStatement(updateProductQuery);
            updateProductStatement.setInt(1, availableQty);
            updateProductStatement.setInt(2, productId);
            updateProductStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Integer> getCartProductIdByUserId(int userId) throws SQLException {
    	// Retrieve the cart product IDs and quantities from the database
        String updatedProductIdsString = "";
		List<Integer> updatedProductIdsList = new ArrayList<Integer>();

		
		    String cartProductsQuery = "SELECT product_id FROM cart_1 WHERE user_id = ?";
		    pst = this.con.prepareStatement(cartProductsQuery);
		    pst.setInt(1, userId);
		    ResultSet resultSet = pst.executeQuery();
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
		            e.printStackTrace();
		        }
		    }
		    return updatedProductIdsList;
    }
}
