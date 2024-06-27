package model;

import java.util.ArrayList;

public interface OrderDetailsInterface {
    ArrayList<OrderDetailsBean> retrieveOrderDetails(String email);
    void updateOrderDetails(OrderDetailsBean orderDetails);

}
