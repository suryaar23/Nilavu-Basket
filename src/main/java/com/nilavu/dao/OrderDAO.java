package com.nilavu.dao;

import java.util.List;
import com.nilavu.model.Order;

public interface OrderDAO {

    int createOrder(int userId, double totalAmount);

    List<Order> getOrdersByUser(int userId);

    List<Order> getAllOrders();

    Order getOrderById(int orderId);   
}
