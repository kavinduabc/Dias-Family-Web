package CartModel;

public class cart {

    private double quantity;
    private int cart_id;
    private int user_id;
    private int product_id;
    private String category;
    private double price;
    private String product_name;
    private String product_image;

    public cart(int cart_id, int user_id, double quantity, int product_id, String category, double price, String product_image) {
        this.quantity = quantity;
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.category = category;
        this.price = price;
        this.user_id = user_id;
        this.product_image = product_image;
    }

    public cart() {

    }

    public void setQuantity(double qty) {
        this.quantity = qty;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setId(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getId() {
        return cart_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public int getUserId() {
        return user_id;
    }

    public void setProductId(int product_id) {
        this.product_id = product_id;
    }

    public int getProductId() {
        return product_id;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public String getName() {
        return product_name;
    }

    public void setName(String product_name) {
        this.product_name = product_name;

    }

    public String getImage() {
        return product_image;
    }

    public void setImage(String product_image) {
        this.product_image = product_image;

    }
}
