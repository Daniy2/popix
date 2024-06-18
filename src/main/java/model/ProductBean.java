package model;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;

public class ProductBean implements Serializable {
    private String id;
    private String name;
    private double price;
    private String description;
    private String brand;
    private String figure;
    private int quantity;
    private Blob image;


    public ProductBean() {}
    public ProductBean(String id, String name, double price, String description, String brand, int quantity, Blob image, String figure) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.brand = brand;
        this.quantity = quantity;
        this.image = image;
        this.figure=figure;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getFigure() {
        return figure;
    }

    public void setFigure(String figure) {
        this.figure = figure;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ProductBean{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", brand='" + brand + '\'' +
                ", figure='" + figure + '\'' +
                ", quantity=" + quantity +
                ", image=" + image +
                '}';
    }
}
