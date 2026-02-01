package com.nilavu.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.ProductDAOImpl;

@WebServlet("/admin/addStock")
public class AddStockServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (quantity > 0) {
            productDAO.addStock(productId, quantity);
        }

        // ✅ Redirect to AdminProductsServlet
        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}
