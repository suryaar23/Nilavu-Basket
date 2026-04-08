package com.nilavu.servlet.shop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.Product;
import com.nilavu.model.User;

@WebServlet("/shop/add-stock")
public class AddStockServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	User u = (User) session.getAttribute("loggedUser");
    	
    	if(u == null || !"SHOP".equals(u.getRole())) {
    		response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
    		return;
    	}

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
       
        
        Product product = productDAO.getProductById(productId);
        
        if(product.getShop_id() != u.getShop_id()) {
        	response.sendRedirect("unauthorized.jsp");
        	return;
        }

        if (quantity > 0) {
            productDAO.addStock(productId, quantity);
        }

        
        response.sendRedirect(request.getContextPath() + "/shop/products");
    }
}
