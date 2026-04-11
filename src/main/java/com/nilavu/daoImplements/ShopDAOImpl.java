package com.nilavu.daoImplements;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.nilavu.dao.ShopDAO;
import com.nilavu.model.Shop;
import com.nilavu.util.DBConnection;

public class ShopDAOImpl implements ShopDAO{
	
	public Boolean addShop(Shop shop) {
		String sql = "INSERT INTO shops(shop_name, owner_name, phone, address) VALUES(?, ?, ?, ?)";
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
					
					ps.setString(1, shop.getName());
					ps.setString(2, shop.getOwner_name());
					ps.setString(4, shop.getPhone());
					ps.setString(3, shop.getAddress());
					
					return ps.executeUpdate() > 0;
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
			
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
	
	public Shop getShopById(int id) {
		
		Shop s = null;
		String sql = "SELECT * FROM shops WHERE shop_id = ?";
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
			
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				s = new Shop();
				s.setId(rs.getInt("shop_id"));
				s.setName(rs.getString("shop_name"));
				s.setOwner_name(rs.getString("owner_name"));
				s.setPhone(rs.getString("phone"));
				s.setAddress(rs.getString("address"));
				s.setStatus(rs.getString("status"));
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return s;
	}
	
	public Boolean updateShop(Shop shop) {
			String sql = "UPDATE shops SET name=?, owner_name=?, phone=?, address=? WHERE shop_id=?";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql)){
				
				 ps.setString(1, shop.getName());
			     ps.setString(2, shop.getOwner_name());
			     ps.setString(3, shop.getPhone());
			     ps.setString(4, shop.getAddress());
			     ps.setInt(5, shop.getId());

			     return ps.executeUpdate() > 0;
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return false;
	}
}
