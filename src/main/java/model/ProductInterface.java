package model;

import java.util.ArrayList;

public interface ProductInterface {
    void doSave(ProductBean productBean);
    ProductBean retrieveProduct(String productId);
    ArrayList<ProductBean> retrieveAllProducts();
    ArrayList<ProductBean> retrieveAllProductsByBrand(String brand);
    ArrayList<ProductBean> retrieveAllProductsByFigure(String figure);
    ArrayList<ProductBean> retrieveAllProductsByPrice();
    ArrayList<ProductBean> retrieveAllProductsByPriceDec();



}
