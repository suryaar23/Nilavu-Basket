package com.nilavu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.nilavu.model.Order;
import com.nilavu.util.DBConnection;

public interface OrderDAO {

	int createOrder(int userId, double totalAmount, int shop_id,int addressId,String street, String city, String state, String pincode);
	
    List<Order> getOrdersByUser(int userId);

    List<Order> getAllOrders();

    Order getOrderById(int orderId);   
    
    List<Order> getOrdersByShopId (int shop_id);

    void updateOrderStatus(int orderId, String status);
    
    void assignAgent(int orderId, int agent_id);
    
    public List<Order> getOrdersByAgentId(int agentId);
    
    int getAgentIdByOrderId(int orderId);
    
    List<Order> getActiveOrdersByShopId(int shopId);
    
    List<Order> getCompletedOrdersByShopId(int shopId);
    
    List<Order> getCompletedOrdersByAgentId(int agentId);
    
    List<Order> getActiveOrdersByAgentId(int agentId);
}
