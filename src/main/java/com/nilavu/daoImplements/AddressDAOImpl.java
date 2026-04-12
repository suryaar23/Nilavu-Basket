package com.nilavu.daoImplements;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.nilavu.dao.AddressDAO;
import com.nilavu.model.Address;
import com.nilavu.util.DBConnection;

public class AddressDAOImpl implements AddressDAO {

    @Override
    public List<Address> getAddressByUser(int userId) {
    	
        List<Address> list = new ArrayList<>();
        
        String sql = "SELECT * FROM address WHERE user_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Address a = new Address();
                a.setAddressId(rs.getInt("address_id"));
                a.setUserId(rs.getInt("user_id"));
                a.setStreet(rs.getString("street"));
                a.setCity(rs.getString("city"));
                a.setState(rs.getString("state"));
                a.setPincode(rs.getString("pincode"));
                
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void addAddress(Address address) {

        String sql = "INSERT INTO address(user_id, street, city, state, pincode) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, address.getUserId());
            ps.setString(2, address.getStreet());
            ps.setString(3, address.getCity());
            ps.setString(4, address.getState());
            ps.setString(5, address.getPincode());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Address getAddressById(int addressId) {
    	Address a = null;
    	String sql = "SELECT * FROM address WHERE address_id = ?";
    	
    	try(Connection con = DBConnection.getConnection();
    			PreparedStatement ps = con.prepareStatement(sql)){
    		
    		ps.setInt(1, addressId);
    		ResultSet rs = ps.executeQuery();
    		
    		while(rs.next()) {
    			
    			a = new Address();
    			a.setAddressId(rs.getInt("address_id"));
    			a.setUserId(rs.getInt("user_id"));
    			a.setStreet(rs.getString("street"));
    			a.setCity(rs.getString("city"));
    			a.setState(rs.getString("state"));
    			a.setPincode(rs.getString("pincode"));
    		}
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return a;
    }
}
