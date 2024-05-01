package CartModel;
//dao means Data Access Object. daos are used to handle database opertaions.
//provide methods to interact with the database for crud

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
}
