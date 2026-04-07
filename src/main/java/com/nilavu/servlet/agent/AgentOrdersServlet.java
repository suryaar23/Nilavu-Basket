package com.nilavu.servlet.agent;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.AgentDAO;
import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.AgentDAOImpl;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.model.Order;
import com.nilavu.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/agent/orders")
public class AgentOrdersServlet extends HttpServlet{
	
	private AgentDAO agentDAO = new AgentDAOImpl();
	private OrderDAO orderDAO = new OrderDAOImpl();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("loggedUser");
			
			if(u == null || !"AGENT".equals(u.getRole())) {
				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
				return;
			}
			
			int agentId = 1; //TODO : Replace with proper agent_id
			
			List<Order> o = orderDAO.getOrdersByAgentId(agentId);
			
			request.setAttribute("orders", o);
			request.getRequestDispatcher("/agent/orders.jsp").forward(request, response);
	}
}
