package com.nilavu.daoImplements;

import java.sql.*;
import java.util.*;
import com.nilavu.dao.OrderItemDAO;
import com.nilavu.model.CartItem;
import com.nilavu.model.OrderItem;
import com.nilavu.util.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    @Override
    public void addOrderItems(int orderId, List<CartItem> cartItems) {
        String sql = "INSERT INTO order_items(order_id,product_id,quantity,price) VALUES(?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            for (CartItem ci : cartItems) {
                ps.setInt(1, orderId);
                ps.setInt(2, ci.getProductId());
                ps.setInt(3, ci.getQuantity());
                ps.setDouble(4, ci.getPrice()); // ✅ REAL PRICE
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ JOIN to get names
    @Override
    public List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> list = new ArrayList<>();

        String sql = """
            SELECT oi.order_item_id, oi.order_id, oi.quantity, oi.price,
                   p.product_name, c.category_name
            FROM order_items oi
            JOIN products p ON oi.product_id = p.product_id
            JOIN categories c ON p.category_id = c.category_id
            WHERE oi.order_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderItem oi = new OrderItem();
                oi.setOrderItemId(rs.getInt("order_item_id"));
                oi.setOrderId(rs.getInt("order_id"));
                oi.setQuantity(rs.getInt("quantity"));
                oi.setPrice(rs.getDouble("price"));
                oi.setProductName(rs.getString("product_name"));
                oi.setCategoryName(rs.getString("category_name"));
                list.add(oi);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
