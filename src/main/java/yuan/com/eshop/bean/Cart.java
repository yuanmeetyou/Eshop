package yuan.com.eshop.bean;


import java.util.HashMap;
import java.util.Map;


public class Cart {
    private Map<String,CartItem> items=new HashMap<String,CartItem>();
    private double total;

    public Map<String, CartItem> getItems() {
        return items;
    }

    public void setItems(Map<String, CartItem> items) {
        this.items = items;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
