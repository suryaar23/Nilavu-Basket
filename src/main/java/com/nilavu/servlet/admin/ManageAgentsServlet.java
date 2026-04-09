package com.nilavu.servlet.admin;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.AgentDAO;
import com.nilavu.daoImplements.AgentDAOImpl;
import com.nilavu.model.Agent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/manage-agents")
public class ManageAgentsServlet extends HttpServlet{
	
	private AgentDAO agentDAO = new AgentDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		List<Agent> agents = agentDAO.getAllAgents();
		
		request.setAttribute("agents", agents);
		request.getRequestDispatcher("/admin/manage-agents.jsp").forward(request, response);
		
	}
}
