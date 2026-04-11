package com.nilavu.daoImplements;

import com.nilavu.util.PasswordUtil;

import java.sql.*;
import java.util.*;
import com.nilavu.dao.UserDAO;
import com.nilavu.model.User;
import com.nilavu.util.DBConnection;
import com.nilavu.util.PasswordUtil;

public class UserDAOImpl implements UserDAO {

    @Override
    public User login(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE email=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password");
                if(PasswordUtil.checkPassword(password, storedHash)) {
                	user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                    user.setPhone(rs.getString("phone"));
                    user.setShop_id(rs.getInt("shop_id"));
                    user.setAgent_id(rs.getInt("agent_id"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean register(User user) {
        String sql = "INSERT INTO users(name,email,password,role,phone) VALUES(?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            
            String hashedPassword = PasswordUtil.hashPassword(user.getPassword());
            ps.setString(3, hashedPassword);
            
            ps.setString(4, "USER");
            ps.setString(5, user.getPhone());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();

        String sql = "SELECT * FROM users WHERE role = 'USER'";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setPhone(rs.getString("phone"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
