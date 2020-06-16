package yuan.com.eshop.bean;

public class CartItem {
    private Productlist productlist;
    private int number;
    private double minTotal;

    public Productlist getProductlist() {
        return productlist;
    }

    public void setProductlist(Productlist productlist) {
        this.productlist = productlist;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public double getMinTotal() {
        return minTotal;
    }

    public void setMinTotal(double minTotal) {
        this.minTotal = minTotal;
    }
}
