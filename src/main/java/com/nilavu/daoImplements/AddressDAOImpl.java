package com.nilavu.daoImplements;

import java.sql.*;
import com.nilavu.dao.AddressDAO;
import com.nilavu.model.Address;
import com.nilavu.util.DBConnection;

public class AddressDAOImpl implements AddressDAO {

    @Override
    public Address getAddressByUser(int userId) {
        Address address = null;
        String sql = "SELECT * FROM address WHERE user_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                address = new Address();
                address.setAddressId(rs.getInt("address_id"));
                address.setUserId(rs.getInt("user_id"));
                address.setStreet(rs.getString("street"));
                address.setCity(rs.getString("city"));
                address.setState(rs.getString("state"));
                address.setPincode(rs.getString("pincode"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return address;
    }

    @Override
    public void saveOrUpdate(Address address) {
        String checkSql = "SELECT address_id FROM address WHERE user_id=?";
        String insertSql = "INSERT INTO address(user_id,street,city,state,pincode) VALUES(?,?,?,?,?)";
        String updateSql = "UPDATE address SET street=?,city=?,state=?,pincode=? WHERE user_id=?";

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(checkSql);
            ps.setInt(1, address.getUserId());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                PreparedStatement ps2 = con.prepareStatement(updateSql);
                ps2.setString(1, address.getStreet());
                ps2.setString(2, address.getCity());
                ps2.setString(3, address.getState());
                ps2.setString(4, address.getPincode());
                ps2.setInt(5, address.getUserId());
                ps2.executeUpdate();
            } else {
                PreparedStatement ps2 = con.prepareStatement(insertSql);
                ps2.setInt(1, address.getUserId());
                ps2.setString(2, address.getStreet());
                ps2.setString(3, address.getCity());
                ps2.setString(4, address.getState());
                ps2.setString(5, address.getPincode());
                ps2.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
