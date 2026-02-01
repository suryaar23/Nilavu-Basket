package com.nilavu.dao;

import java.util.List;
import com.nilavu.model.CartItem;
import com.nilavu.model.OrderItem;

public interface OrderItemDAO {
    void addOrderItems(int orderId, List<CartItem> cartItems);
    List<OrderItem> getOrderItems(int orderId);
}
