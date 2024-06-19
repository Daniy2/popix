package model;

import java.io.Serializable;

public class ShippingInfoBean implements Serializable {
    private String customer;
    private String country;
    private String city;
    private String address;


    public ShippingInfoBean() {
    }

    public ShippingInfoBean(String customer, String country, String address, String city) {
        this.customer = customer;
        this.country = country;
        this.address = address;
        this.city = city;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
