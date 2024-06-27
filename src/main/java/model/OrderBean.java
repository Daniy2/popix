package model;

import java.io.Serializable;
import java.sql.Date;

public class OrderBean implements Serializable {
    private int idOrd;
    private Date orderDate;
    private double subtotal;
    private String status;
    private String customer;

    public OrderBean() {
    }

    public OrderBean(int idOrd, Date orderDate, double subtotal, String status, String customer) {
        this.idOrd = idOrd;
        this.orderDate = orderDate;
        this.subtotal = subtotal;
        this.status = status;
        this.customer = customer;
    }

    public int getIdOrd() {
        return idOrd;
    }

    public void setIdOrd(int idOrd) {
        this.idOrd = idOrd;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "OrderBean{" +
                "idOrd=" + idOrd +
                ", orderDate=" + orderDate +
                ", subtotal=" + subtotal +
                ", status='" + status + '\'' +
                ", customer='" + customer + '\'' +
                '}';
    }
}
