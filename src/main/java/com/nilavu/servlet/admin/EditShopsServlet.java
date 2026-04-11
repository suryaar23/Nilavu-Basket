package com.nilavu.servlet.admin;

import java.io.IOException;

import com.nilavu.dao.ShopDAO;
import com.nilavu.daoImplements.ShopDAOImpl;
import com.nilavu.model.Shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/edit-shop")
public class EditShopsServlet extends HttpServlet{
	
	ShopDAO shopDAO = new ShopDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Shop shop = shopDAO.getShopById(id);
			
			request.setAttribute("shop", shop);
			
			request.getRequestDispatcher("/admin/edit-shops.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException{
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Shop s = new Shop();
			
			s.setId(id);
			s.setName(request.getParameter("name"));
			s.setPhone(request.getParameter("phone"));
			s.setAddress(request.getParameter("address"));
			
			shopDAO.updateShop(s);
			
			response.sendRedirect(request.getContextPath() + "/admin/manage-shops");
	}

}
