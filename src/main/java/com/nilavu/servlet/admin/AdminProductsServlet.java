package com.nilavu.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.Product;

@WebServlet("/admin/products")
public class AdminProductsServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/admin/products.jsp")
               .forward(request, response);
    }
}
