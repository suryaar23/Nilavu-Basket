package com.nilavu.servlet.shop;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.model.Order;
import com.nilavu.model.User;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/shop/orders")
public class ShopOrderServlet extends HttpServlet{
	
	private OrderDAO orderDAO = new OrderDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("loggedUser");
			
			if(u == null || !u.getRole().equals("SHOP")) {											//(!"Shop".equals(u.getRole()) can also be used
				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
				return;
			}
			
			
			int shopId = u.getShop_id();
			
			String filter = request.getParameter("filter");
						
			List<Order> orders;
			
			if("completed".equals(filter)) {
				orders = orderDAO.getCompletedOrdersByShopId(shopId);
			}
			
			else {
				orders = orderDAO.getActiveOrdersByShopId(shopId);
			}
			
			request.setAttribute("orders", orders);
			
			request.getRequestDispatcher("/shop/orders.jsp").forward(request, response);
	}
}


