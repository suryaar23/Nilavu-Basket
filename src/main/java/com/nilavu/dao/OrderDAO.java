package com.nilavu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.nilavu.model.Order;
import com.nilavu.util.DBConnection;

public interface OrderDAO {

    int createOrder(int userId, double totalAmount,int shop_id);

    List<Order> getOrdersByUser(int userId);

    List<Order> getAllOrders();

    Order getOrderById(int orderId);   
    
    List<Order> getOrdersByShopId (int shop_id);

    void updateOrderStatus(int orderId, String status);
    
    void assignAgent(int orderId, int agent_id);
    
    public List<Order> getOrdersByAgentId(int agentId);
    
    int getAgentIdByOrderId(int orderId);
}
