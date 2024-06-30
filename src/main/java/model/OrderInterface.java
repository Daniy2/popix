package model;

import java.sql.Date;
import java.util.ArrayList;

public interface OrderInterface {
    void doSave(OrderBean order);
    ArrayList<OrderBean> getOrders();
    ArrayList<OrderBean> getOrdersSorted(Date from, Date to);
    int getOrderId();

}
