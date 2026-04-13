package com.nilavu.servlet.shop;

import java.io.IOException;

import com.nilavu.dao.AgentDAO;
import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.AgentDAOImpl;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.model.Agent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/shop/confirm-order")
public class ConfirmOrderServlet extends HttpServlet{

	private OrderDAO orderDAO = new OrderDAOImpl();
	private AgentDAO agentDAO = new AgentDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));

		//orderDAO.updateOrderStatus(orderId, "CONFIRMED");
		
		Agent a = agentDAO.getAvailableAgent();
		
		if(a != null) {
			orderDAO.assignAgent(orderId, a.getAgent_id());
			orderDAO.updateOrderStatus(orderId, "ASSIGNED");
			agentDAO.updateAgentStatus(a.getAgent_id(), "BUSY");
		}
		else {
			orderDAO.updateOrderStatus(orderId, "PENDING");
		}
		

		response.sendRedirect(request.getContextPath() + "/shop/orders");
	}
}
