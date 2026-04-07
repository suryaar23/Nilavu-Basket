package com.nilavu.servlet.user;

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

@WebServlet("/shops")
public class ViewShopsServlet extends HttpServlet{
	
	private ShopDAO shopDAO = new ShopDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		List<Shop> shops = shopDAO.getAllShops();
		
		request.setAttribute("shops", shops);
		request.getRequestDispatcher("user/shops.jsp").forward(request, response);
	}
}
