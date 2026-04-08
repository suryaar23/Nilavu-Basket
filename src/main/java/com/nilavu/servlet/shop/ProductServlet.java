package com.nilavu.servlet.shop;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.Product;
import com.nilavu.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/shop/products")
public class ProductServlet extends HttpServlet{
	
	private ProductDAO productDAO = new ProductDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
			HttpSession session  = request.getSession();
			User u = (User) session.getAttribute("loggedUser");
			
			if(u == null || !"SHOP".equals(u.getRole())) {
				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
				return;
			}
			
			int shopId = u.getShop_id();
			
			List<Product> products = productDAO.getProductsByShopId(shopId);
			
			request.setAttribute("products", products);
			
			request.getRequestDispatcher("/shop/products.jsp").forward(request,response);
	}
}
