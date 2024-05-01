package CartModel;

public class cart //extends to the product class to get the accesss to the methods and data in that class
{
    private double quantity;
    //these are the data and methods from the/should be in the product class. if it is there, simply delete these. if not, keep these
    private int  cart_id;
    private int  user_id;
    private int product_id;
    private String category;
    private double price;
    private String product_name;
    
    public cart(int cart_id,int  user_id, double quantity, int product_id, String category, double price){
        this.quantity = quantity;
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.category = category;
        this.price = price;
        this.user_id = user_id;
    }
    
    public cart(){
        
    }
    
    public void setQuantity(double qty){
        this.quantity = qty;
    }
    public double getQuantity(){
        return quantity;
    }
    
    public void setId(int cart_id){
        this.cart_id = cart_id;
    }
    public int getId(){
        return cart_id;
    }
    
    public void setUserId(int user_id){
        this.user_id = user_id;
    }
    public int getUserId(){
        return user_id;
    }
    
    public void setProductId(int product_id){
        this.product_id = product_id;
    }
    public int getProductId(){
        return product_id;
    }
    
    public void setCategory(String category){
        this.category = category;
    }
    public String getCategory(){
        return category;
    }
    
    public void setPrice(double price){
        this.price = price;
    }
    public double getPrice(){
        return price;
    }

    public String getName(){
        return product_name;
    }
    
    public void setName(String product_name){
        this.product_name=product_name;
    
}
}
