package model;

import java.io.Serializable;

public class OrderDetailsBean implements Serializable {
    private int orderId;
    private ProductBean productBean;
    private int Quantity;
    private double Price;

    public OrderDetailsBean() {
    }

    public OrderDetailsBean(int orderId, ProductBean productBean, int quantity, double price) {
        this.orderId = orderId;
        this.productBean = productBean;
        this.Quantity = quantity;
        this.Price = price;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public ProductBean getProductBean() {
        return productBean;
    }

    public void setProductBean(ProductBean productBean) {
        this.productBean = productBean;
    }

    public int getQuantity() {
        return Quantity;
    }

    public double getPrice(){
        return Price;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public void setPrice(double price) {
        this.Price = price;
    }

    @Override
    public String toString() {
        return "OrderDetailsBean{" +
                "orderId=" + orderId +
                ", productBean=" + productBean +
                ", Quantity=" + Quantity +
                '}';
    }
}
