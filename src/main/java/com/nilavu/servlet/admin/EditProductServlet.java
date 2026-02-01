package com.nilavu.servlet.admin;

import java.io.IOException;

import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/editProduct")
public class EditProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId = Integer.parseInt(request.getParameter("id"));

        Product product = productDAO.getProductById(productId);

        request.setAttribute("product", product);
        request.getRequestDispatcher("/admin/update-product.jsp")
               .forward(request, response);
    }
}
