package com.nilavu.servlet.shop;

import java.io.IOException;

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

@WebServlet("/shop/add-product")
public class AddProductServlet extends HttpServlet{
	
	private ProductDAO productDAO = new ProductDAOImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		HttpSession session  = request.getSession();
		User u = (User) session.getAttribute("loggedUser");
		
		if(u == null || !"SHOP".equals(u.getRole())) {
			response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
			return;
		}
		
		int shopId = u.getShop_id();
		
		String name = request.getParameter("productName");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        Product product = new Product();
        product.setProductName(name);
        product.setPrice(price);
        product.setStock(stock);
        product.setDescription(description);
        product.setImageUrl(imageUrl);
        product.setCategoryId(categoryId);
        product.setShop_id(shopId);
        
        productDAO.addProduct(product);
        
        response.sendRedirect(request.getContextPath() + "/shop/products");
		
	}

}
