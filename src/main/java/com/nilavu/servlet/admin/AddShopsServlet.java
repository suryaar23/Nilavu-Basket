package com.nilavu.servlet.admin;

import java.io.IOException;

import com.nilavu.daoImplements.ShopDAOImpl;
import com.nilavu.model.Shop;
import com.nilavu.dao.ShopDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/add-shop")
public class AddShopsServlet extends HttpServlet{
	
	ShopDAO shopDAO = new ShopDAOImpl();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
			
			request.getRequestDispatcher("/admin/add-shops.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException{
			
			String name = request.getParameter("name");
			String owner = request.getParameter("owner");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			
			Shop s = new Shop();
			
			s.setName(name);
			s.setOwner_name(owner);
			s.setPhone(phone);
			s.setAddress(address);
			
			shopDAO.addShop(s);
			
			response.sendRedirect(request.getContextPath() + "/admin/manage-shops");
	}

}
