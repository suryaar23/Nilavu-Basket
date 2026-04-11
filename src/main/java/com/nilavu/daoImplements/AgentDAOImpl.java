package com.nilavu.daoImplements;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nilavu.dao.AgentDAO;
import com.nilavu.model.Agent;
import com.nilavu.model.Order;
import com.nilavu.util.DBConnection;

public class AgentDAOImpl implements AgentDAO{
	
		public Agent getAvailableAgent() {
			
			Agent a = null;
			
			String sql = "SELECT * FROM agents WHERE status = 'AVAILABLE' LIMIT 1";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery()){
				
				while(rs.next()) {
					
					a = new Agent();
					
					a.setAgent_id(rs.getInt("agent_id"));
					a.setName(rs.getString("name"));
					a.setPhone(rs.getString("phone"));
					a.setStatus(rs.getString("status"));
				}
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return a;
		}
		
		public void updateAgentStatus(int agentId, String status) {
			
			String sql = "UPDATE agents SET status = ? WHERE agent_id = ?";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql)){
				
				ps.setString(1, status);
				ps.setInt(2, agentId);
				
				ps.executeUpdate();
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		public List<Agent> getAllAgents(){
			
			List<Agent> list = new ArrayList<>();
			String sql = "SELECT * FROM agents";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery()){
				
				while(rs.next()) {
					Agent a = new Agent();
					
					a.setAgent_id(rs.getInt("agent_id"));
					a.setName(rs.getString("name"));
					a.setPhone(rs.getString("phone"));
					a.setStatus(rs.getString("status"));
				
					list.add(a);
				}
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}

		@Override
		public Boolean updateAgent(Agent agent) {
			
			String sql = "UPDATE agents SET name=?, phone=? WHERE agent_id=?";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql)){
				
				ps.setString(1, agent.getName());
				ps.setString(2, agent.getPhone());
				ps.setInt(3, agent.getAgent_id());
				
				return ps.executeUpdate() > 0;
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return false;
			
		}

		@Override
		public Boolean addAgent(Agent agent) {
			String sql = "INSERT INTO agents(name, phone) VALUES(?,?)";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql)){
				
				ps.setString(1, agent.getName());
				ps.setString(2, agent.getPhone());
				
				return ps.executeUpdate() > 0;
			}
			
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return false;
		}

		@Override
		public Agent getAgentById(int id) {
			
			Agent a = null;
			String sql = "SELECT * FROM agents WHERE agent_id = ?";
			
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(sql)){
				
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					
					a = new Agent();
					
					a.setAgent_id(rs.getInt("agent_id"));
					a.setName(rs.getString("name"));
					a.setPhone(rs.getString("phone"));
					a.setStatus(rs.getString("status"));
				}
			}
			
			catch(Exception e){
				e.printStackTrace();
			}
			
			return a;
		}
		
}
