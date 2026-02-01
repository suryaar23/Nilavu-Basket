package com.nilavu.daoImplements;

import java.sql.*;
import com.nilavu.dao.PaymentDAO;
import com.nilavu.model.Payment;
import com.nilavu.util.DBConnection;

public class PaymentDAOImpl implements PaymentDAO {

    @Override
    public void savePayment(Payment payment) {
        String sql = "INSERT INTO payment(order_id,payment_mode,payment_status) VALUES(?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, payment.getOrderId());
            ps.setString(2, payment.getPaymentMode());
            ps.setString(3, payment.getPaymentStatus());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
