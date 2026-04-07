package com.nilavu.servlet.agent;

import java.io.IOException;

import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/agent/start-delivery")
public class StartDeliveryServlet extends HttpServlet{
	
	private OrderDAO orderDAO = new OrderDAOImpl();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			
			orderDAO.updateOrderStatus(orderId , "OUT FOR DELIVERY");
			
			response.sendRedirect(request.getContextPath() + "/agent/orders");
	}
}
