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

@WebServlet("/shop/shop-dashboard")
public class ShopDashboardServlet extends HttpServlet{
	
	private OrderDAO orderDAO = new OrderDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,IOException{
			
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("loggedUser");
			
			if(u == null || !"SHOP".equals(u.getRole())) {
				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
				return;
			}
			
			int shopId = u.getShop_id();
			
			List<Order> ao = orderDAO.getActiveOrdersByShopId(shopId);
			List<Order> co = orderDAO.getCompletedOrdersByShopId(shopId);
			
			request.setAttribute("activeOrders", ao);
			request.setAttribute("completedOrders", co);
			
			request.getRequestDispatcher("/shop/shop-dashboard.jsp").forward(request, response);
	}
}
