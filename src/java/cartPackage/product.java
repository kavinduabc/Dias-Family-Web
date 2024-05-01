/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cartPackage;

public class product {
    private int product_id;
    private String product_name;
    private double product_price;
    private String product_image;
    private int category_id;
    private int seller_id;
    
    public product(){
        
    }
    
    public product(int product_id, String product_name, double product_price, String product_image, int category_id, int seller_id) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_image = product_image;
        this.category_id = category_id;
        this.seller_id = seller_id;
       
    }
    
    public int getId(){
        return product_id;
    }
    
    public void setId(int product_id){
        this.product_id=product_id;
    }
    
    public String getName(){
        return product_name;
    }
    
    public void setName(String product_name){
        this.product_name=product_name;
    }
    
    public double getPrice(){
        return product_price;
    }
    
    public void setPrice(double product_price){
        this.product_price=product_price;
    }
    
    public String getImage(){
        return product_image;
    }
    
    public void setImage(String product_image){
        this.product_image = product_image;
    }
    
    public int getCategoryId(){
        return category_id;
    }
    
    public void setCategoryId(int category_id){
        this.category_id = category_id;
    }
    
    public int getSellerId(){
        return seller_id;
    }
    
    public void setSellerId(int seller_id){
        this.seller_id = seller_id;
    }

}
