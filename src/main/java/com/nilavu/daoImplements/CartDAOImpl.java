package com.nilavu.daoImplements;

import java.sql.*;
import com.nilavu.dao.CartDAO;
import com.nilavu.util.DBConnection;

public class CartDAOImpl implements CartDAO {

	@Override
    public int getOrCreateCart(int userId) {
        int cartId = -1;

        String selectSql = "SELECT cart_id FROM cart WHERE user_id=?";
        String insertSql = "INSERT INTO cart(user_id) VALUES(?)";

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(selectSql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cartId = rs.getInt("cart_id");
            } else {
                PreparedStatement ps2 =
                    con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
                ps2.setInt(1, userId);
                ps2.executeUpdate();

                ResultSet keys = ps2.getGeneratedKeys();
                if (keys.next()) {
                    cartId = keys.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartId;
    }

    
    public void markCartCompleted(int cartId) {
        String sql = "UPDATE cart SET status='COMPLETED' WHERE cart_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
