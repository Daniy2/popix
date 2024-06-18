package model;

import java.util.ArrayList;

public interface ProductInterface {
    void doSave(ProductBean productBean);
    ProductBean retrieveProduct(String productId);
    ArrayList<ProductBean> retrieveAllProducts();

}
