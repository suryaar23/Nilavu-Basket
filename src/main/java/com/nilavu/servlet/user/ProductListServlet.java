package com.nilavu.servlet.user;

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

@WebServlet("/products")
public class ProductListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = productDAO.getAllProducts();

        request.setAttribute("products", productList);
        request.getRequestDispatcher("user/products.jsp").forward(request, response);
    }
}
