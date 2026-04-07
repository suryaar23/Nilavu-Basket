package com.nilavu.servlet.agent;

import java.io.IOException;

import com.nilavu.dao.AgentDAO;
import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.AgentDAOImpl;
import com.nilavu.daoImplements.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/agent/complete-delivery")
public class CompleteDeliveryServlet extends HttpServlet{
	
	private OrderDAO orderDAO = new OrderDAOImpl();
	private AgentDAO agentDAO = new AgentDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			
			orderDAO.updateOrderStatus(orderId, "DELIVERED");
			
			int agentId = orderDAO.getAgentIdByOrderId(orderId);
			
			if(agentId != -1) {
				
				agentDAO.updateAgentStatus(agentId, "AVAILABLE");
			}
			
			response.sendRedirect(request.getContextPath() + "/agent/orders");
	}
}
