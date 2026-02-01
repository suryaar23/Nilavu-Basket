package com.nilavu.daoImplements;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

import com.nilavu.dao.OrderDAO;
import com.nilavu.model.Order;
import com.nilavu.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int createOrder(int userId, double totalAmount) {
        int orderId = -1;
        String sql = "INSERT INTO orders(user_id, order_date, total_amount) VALUES(?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, userId);
            ps.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
            ps.setDouble(3, totalAmount);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {
        List<Order> list = new ArrayList<>();

        String sql = """
            SELECT o.order_id, o.order_date, o.status, o.total_amount,
                   u.name AS user_name
            FROM orders o
            JOIN users u ON o.user_id = u.user_id
            WHERE o.user_id = ?
            ORDER BY o.order_date DESC
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setUserName(rs.getString("user_name"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();

        String sql = """
            SELECT o.order_id, o.order_date, o.status, o.total_amount,
                   u.name AS user_name
            FROM orders o
            JOIN users u ON o.user_id = u.user_id
            ORDER BY o.order_date DESC
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setUserName(rs.getString("user_name"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Order getOrderById(int orderId) {
        Order o = null;

        String sql = """
            SELECT order_id, order_date, status, total_amount
            FROM orders
            WHERE order_id = ?
        """;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                o = new Order();
                o.setOrderId(rs.getInt("order_id"));
                o.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                o.setStatus(rs.getString("status"));
                o.setTotalAmount(rs.getDouble("total_amount"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return o;
    }
}

