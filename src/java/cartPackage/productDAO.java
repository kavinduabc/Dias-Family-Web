    package cartPackage;

    import java.sql.*;
    import java.util.*;

    public class productDAO {


        private Connection con;
        //private String query;
        private PreparedStatement pst;
        private ResultSet rs;

        public productDAO(Connection con) {
            this.con = con;
        }
        public List<product> getAllProducts() {
            List<product> products = new ArrayList<product>();
            try {
                String queryProducts = "SELECT * FROM product";
                pst = con.prepareStatement(queryProducts);
                rs = pst.executeQuery();

                while (rs.next()) {
                    product p = new product();
                    p.setId(rs.getInt("product_id"));
                    p.setName(rs.getString("product_name"));
                    //p.setDescription(rs.getString("product_description"));
                    p.setPrice(rs.getDouble("product_price"));
                    //p.setImage(rs.getString("product_image"));
                    products.add(p);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return products;
        }

//        public void addCart(int userId, int productId) {
//            try {
//                String queryCart = "SELECT * FROM cart_1 WHERE user_id = ?";
//                pst = con.prepareStatement(queryCart);
//                pst.setInt(1, userId);
//                rs = pst.executeQuery();
//
//                if (rs.next()) {
//                    // Update existing cart entry
//                    // Retrieve the product IDs and quantities from the cart entry
//                        String productIdsString = rs.getString("product_id");
//                        String quantitiesString = rs.getString("quantity");
//
//                        // Split the comma-separated values into arrays
//                        String[] productIdArray = productIdsString.split(",");
//                        String[] quantityArray = quantitiesString.split(",");
//
//                        // Convert the arrays to lists
//                        List<String> productIdList = new ArrayList<String>(Arrays.asList(productIdArray));
//                        List<String> quantityList = new ArrayList<String>(Arrays.asList(quantityArray));
//
//                        // Check if the product ID already exists in the list
//                        int index = productIdList.indexOf(productId);
//                        if (index != -1) {
//                            // Product ID exists, update the quantity
//                            int quantity = Integer.parseInt(quantityList.get(index));
//                            quantityList.set(index, String.valueOf(quantity + 1));
//                        } else {
//                            // Product ID does not exist, add new entry
//                            productIdList.add(String.valueOf(productId));
//                            quantityList.add("1");
//                        }
//
//                        // Join the lists back into comma-separated strings
//                        String updatedProductIdsString = String.join(",", productIdList);
//                        String updatedQuantitiesString = String.join(",", quantityList);
//
//                        // Update the cart entry
//                        String updateQuery = "UPDATE cart_1 SET product_id = ?, quantity = ? WHERE user_id = ?";
//                        pst = con.prepareStatement(updateQuery);
//                        pst.setString(1, updatedProductIdsString);
//                        pst.setString(2, updatedQuantitiesString);
//                        pst.setInt(3, userId);
//                        pst.executeUpdate();
//                } else {
//                    // Create a new cart entry
//                    String insertQuery = "INSERT INTO cart_1 (user_id, product_id, quantity) VALUES (?, ?, ?)";
//                    pst = con.prepareStatement(insertQuery);
//                    pst.setInt(1, userId);
//                    pst.setInt(2, productId);
//                    pst.setString(3, "1");
//                    pst.executeUpdate();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
    }
