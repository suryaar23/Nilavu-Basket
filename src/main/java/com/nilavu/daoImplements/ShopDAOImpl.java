package com.nilavu.daoImplements;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.nilavu.dao.ShopDAO;
import com.nilavu.model.Shop;
import com.nilavu.util.DBConnection;

public class ShopDAOImpl implements ShopDAO{
	
	public void addShop(Shop shop) {
		String sql = "INSERT INTO shops(shop_name, owner_name, phone, address, status) VALUES(?, ?, ?, ?, ?)";
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
					
					ps.setString(1, shop.getName());
					ps.setString(2, shop.getOwner_name());
					ps.setString(4, shop.getPhone());
					ps.setString(3, shop.getAddress());
					ps.setString(5, shop.getStatus());
					ps.executeUpdate();
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
			
	}
	
	public List<Shop> getAllShops(){
		List<Shop> shops = new ArrayList<>();
		String sql = "SELECT * FROM shops";
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()){
			
			while(rs.next()) {
				Shop s = new Shop();
				
				s.setId(rs.getInt("shop_id"));
				s.setName(rs.getString("shop_name"));
				s.setOwner_name(rs.getString("owner_name"));
				s.setPhone(rs.getString("phone"));
				s.setAddress(rs.getString("address"));
				s.setStatus(rs.getString("status"));
				shops.add(s);
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return shops;
	}
}
