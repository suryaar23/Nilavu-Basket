package com.nilavu.dao;

import java.util.List;

import com.nilavu.model.Agent;
import com.nilavu.model.Order;

public interface AgentDAO {
	
	Agent getAvailableAgent();
	void updateAgentStatus(int agentId, String status);
	List<Agent> getAllAgents();
}
