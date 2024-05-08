/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daisfamily;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class ProductDAO {
    
    //mySQL conection variables
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/dias?useSSL=false";  //add database name 
    private final String jdbcUserName ="root";
    private final String jdbcPassword ="Root@7532";
    
    //mySQL prepared statements ---> all operations
   
    private static final String INSERT_PRODUCT ="INSERT INTO product"+"(product_name,product_price,product_image,category_id,seller_id,quantity)VALUES"+"(?, ?, ?, ?, ?,?);";
    private static final String SELECT_PRODUCTS_BY_ID = "select product_id,product_name,product_price,product_image,category_id,seller_id,quantity from product where product_id =?";
    private static final String SELECT_ALL_PRODUCTS = "select * from product";
    private static final String DELETE_PRODUCT = "delete from product where product_id =?";
    private static final String UPDATE_PRODUCT = "update product set product_name =?,product_price =?,product_image =?,category_id =?,seller_id =?,quantity=? where product_id =?";

    
    public ProductDAO(){}
    
//connection
    protected Connection getConnection() 
    {
      Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
        } catch (SQLException|ClassNotFoundException ex) {
            ex.printStackTrace();
        }
     return con; 
    }
//insert product
    public void insertProduct(Product product)
    {
        System.out.println(INSERT_PRODUCT);
        try( Connection con = getConnection();
        PreparedStatement preparedStatement = con.prepareStatement(INSERT_PRODUCT))
        {
          preparedStatement.setString(1,product.getProductName());
          preparedStatement.setFloat(2,product.getProductPrice());
          preparedStatement.setString(3,product.getProductImage());
          preparedStatement.setInt(4, product.getCategoryID());
          preparedStatement.setInt(5, product.getSellerID());
          preparedStatement.setDouble(6, product.getQty());
          preparedStatement.executeUpdate();
            
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
            out.println(ex.getMessage());
        }
       
        
    }
//delete product
    public boolean deleteProduct(int productID) throws SQLException
    {
        boolean rowDelected = false;
        try(Connection con = getConnection(); PreparedStatement statement = con.prepareStatement(DELETE_PRODUCT);)
        {
            statement.setInt(1, productID);
            rowDelected = statement.executeUpdate()>0;
            
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
            out.println(ex.getMessage());
        }
        return rowDelected;
    }

//view product by ID
    public Product selectProduct(int productID)
    {
        Product product = null;
        try 
           ( Connection con = getConnection();
            PreparedStatement preparedStatemnt = con.prepareStatement(SELECT_PRODUCTS_BY_ID);)
        {
            preparedStatemnt.setInt(1,productID);
            System.out.println(preparedStatemnt);
            ResultSet rs = preparedStatemnt.executeQuery();
            
            while(rs.next())
            {
                String productName = rs.getString("product_name");
                float productPrice = rs.getFloat("product_price");
                String productImage = rs.getString("product_image");
                int categoryID =rs.getInt("category_id");
                int sellerID = rs.getInt("seller_id");
                double qty = rs.getDouble("quantity");
                
                product = new Product(productID,productName,productPrice,productImage,categoryID,sellerID,qty);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            out.println(ex.getMessage());
        }
       return product; 
    }    

    
//view all products
   public List<Product> selectAllProducts() throws SQLException
   {
       List<Product> products = new ArrayList<>();
		try (java.sql.Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
                                int productID = rs.getInt("product_id");
                                String productName = rs.getString("product_name");
                                float productPrice = rs.getFloat("product_price");
                                String productImage = rs.getString("product_image");
                                int categoryID =rs.getInt("category_id");
                                int sellerID = rs.getInt("seller_id");	
                                double qty = rs.getDouble("quantity");
				products.add(new Product(productID, productName,productPrice,productImage,categoryID,sellerID,qty));
			}
		}            catch(Exception ex)
                                {
                                 ex.printStackTrace();
                                 out.println(ex.getMessage());
                                }
		return products;       
   }
    
//update product 
    public boolean updateProduct(Product product) throws SQLException
    {
        boolean rowUpdated ;
        try(Connection con = getConnection(); 
                PreparedStatement statement = con.prepareStatement(UPDATE_PRODUCT);)
        {
         statement.setInt(1, product.getProductID());
         statement.setString(2, product.getProductName());
         statement.setFloat(3, product.getProductPrice());
         statement.setString(4, product.getProductImage());
         statement.setInt(5, product.getCategoryID());
         statement.setInt(6, product.getSellerID());
         statement.setDouble(7, product.getQty());
         
         
         rowUpdated = statement.executeUpdate() >0 ;
        }
     
        return rowUpdated;
    }
}

