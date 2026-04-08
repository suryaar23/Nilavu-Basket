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

@WebServlet("/shop/update-product")
public class UpdateProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("loggedUser");
        
        if(u == null || !"SHOP".equals(u.getRole())) {
        	response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        	return;
        }
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product p = productDAO.getProductById(productId);
        
        if(p.getShop_id() != u.getShop_id()) {
        	response.sendRedirect("unauthorized.jsp");
        	return;
        }
        
        
        Product product = new Product();
        
        product.setProductId(productId);
        product.setProductName(request.getParameter("productName"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setImageUrl(request.getParameter("imageUrl"));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));

        productDAO.updateProduct(product);

        response.sendRedirect(request.getContextPath()+"/shop/products");
    }
}
