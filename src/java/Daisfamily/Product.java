/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daisfamily;

/**
 *
 * @author User
 */
public class Product {
    
    private int productID;
    private String productName;     
    private float productPrice;
    private String productImage;
    private int categoryID;
    private int sellerID;

    public Product(int productID, String productName, float productPrice, String productImage, int categoryID, int sellerID) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImage = productImage;
        this.categoryID = categoryID;
        this.sellerID = sellerID;
    }

    public Product(String productName, float productPrice, String productImage, int categoryID, int sellerID) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImage = productImage;
        this.categoryID = categoryID;
        this.sellerID = sellerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }


    
    
}
