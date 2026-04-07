package com.nilavu.servlet.admin;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.ShopDAO;
import com.nilavu.daoImplements.ShopDAOImpl;
import com.nilavu.model.Shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/manage-shops")
public class ManageShopServlet extends HttpServlet{
	
	private ShopDAO shopDAO = new ShopDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		List<Shop> shop = shopDAO.getAllShops();
		request.setAttribute("shops", shop);
		request.getRequestDispatcher("/admin/manage-shops.jsp").forward(request, response);
		
	}
}
