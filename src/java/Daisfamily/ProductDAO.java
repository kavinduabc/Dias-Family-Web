/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daisfamily;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class ProductDAO {
    
    //mySQL conection variables
    private final String jdbcUrl = "jdbc:mysql://localhost:3306/dias";  //add database name 
    private final String jdbcUserName ="root";
    private final String jdbcPassword ="";
    
    //mySQL prepared statements ---> all operations
   
    private static final String INSERT_PRODUCT ="INSERT INTO product"+"(product_name,product_price,product_image,category_id,seller_id)VALUES"+"(?, ?, ?, ?, ?);";
    private static final String SELECT_PRODUCTS_BY_ID = "select product_id,product_name,product_price,product_image,category_id,seller_id from product where peoduct_id =?";
    private static final String SELECT_ALL_PRODUCTS = "select * from product";
    private static final String DELETE_PRODUCT = "delete from product where product_id =?";
    private static final String UPDATE_PRODUCT = "update product set product_name =?,product_price =?,product_image =?,category_id =?,seller_id =?";
    
    public ProductDAO(){}
    
//connection
    protected Connection getConnection() 
    {
      Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
        } catch (SQLException|ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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
          preparedStatement.executeUpdate();
            
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        
    }
//delete product
    public boolean deleteProduct(int productID) throws SQLException
    {
        boolean rowDelected;
        try(Connection con = getConnection(); PreparedStatement statement = con.prepareStatement(DELETE_PRODUCT);)
        {
            statement.setInt(1, productID);
            rowDelected = statement.executeUpdate()>0;
            
        }
        return rowDelected;
    }

//view product by ID
    public Product selectProduct(int productID)
    {Product product = null;
        try 
           ( Connection con = getConnection();
            PreparedStatement preparedStatemnt = con.prepareStatement(SELECT_PRODUCTS_BY_ID);)
        {
            preparedStatemnt.setInt(1,productID);
            System.out.println(preparedStatemnt);
            ResultSet rs = preparedStatemnt.executeQuery();
            
            while(rs.next())
            {
                String productName = rs.getString("productName");
                float productPrice = rs.getFloat("productPrice");
                String productImage = rs.getString("productImage");
                int categoryID =rs.getInt("categoryID");
                int sellerID = rs.getInt("sellerID");
                
                product = new Product(productID,productName,productPrice,productImage,categoryID,sellerID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
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
                                int productID = rs.getInt("productID");
                                String productName = rs.getString("productName");
                                float productPrice = rs.getFloat("productPrice");
                                String productImage = rs.getString("productImage");
                                int categoryID =rs.getInt("categoryID");
                                int sellerID = rs.getInt("sellerID");				
				products.add(new Product(productID, productName,productPrice,productImage,categoryID,sellerID));
			}
		} 
		return products;       
   }
    
//update product 
    public boolean updateProduct(Product product) throws SQLException
    {
        boolean rowUpdated;
        try(Connection con = getConnection(); 
                PreparedStatement statement = con.prepareStatement(UPDATE_PRODUCT);)
        {
         statement.setString(1, product.getProductName());
         statement.setFloat(2, product.getProductPrice());
         statement.setInt(3, product.getCategoryID());
         statement.setInt(4, product.getSellerID());
         statement.setString(5, product.getProductImage());
         statement.setInt(6, product.getProductID());
         
         rowUpdated = statement.executeUpdate() >0 ;
        }
        return rowUpdated;
    }
}

