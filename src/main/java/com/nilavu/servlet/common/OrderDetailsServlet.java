package com.nilavu.servlet.common;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.OrderItemDAO;
import com.nilavu.daoImplements.OrderItemDAOImpl;
import com.nilavu.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/common/order-details")
public class OrderDetailsServlet extends HttpServlet{

		private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
		
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				
				List<OrderItem> items = orderItemDAO.getOrderItems(orderId);
				
				request.setAttribute("items", items);
				
				request.getRequestDispatcher("/common/order-details.jsp").forward(request, response);
		}
}
