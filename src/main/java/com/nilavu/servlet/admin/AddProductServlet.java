package com.nilavu.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.Product;

@WebServlet("/admin/addProduct")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        productDAO.addProduct(product);

        response.sendRedirect("dashboard");
    }
}
