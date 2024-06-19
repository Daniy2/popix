package model;

public interface ShippingInfoInterface {
    void doSave(ShippingInfoBean shippingInfoBean, String email);
    ShippingInfoBean retrieveShippingInfo(String email);
}
