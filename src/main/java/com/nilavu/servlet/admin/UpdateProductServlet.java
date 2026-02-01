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

@WebServlet("/admin/updateProduct")
public class UpdateProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pid = request.getParameter("productId");
        String priceStr = request.getParameter("price");
        String stockStr = request.getParameter("stock");
        String catStr = request.getParameter("categoryId");

        if (pid == null || pid.isEmpty()
         || priceStr == null || priceStr.isEmpty()
         || stockStr == null || stockStr.isEmpty()
         || catStr == null || catStr.isEmpty()) {

            response.sendRedirect(request.getContextPath()+"/admin/products?error=invalid");
            return;
        }

        int productId = Integer.parseInt(pid);
        double price = Double.parseDouble(priceStr);
        int stock = Integer.parseInt(stockStr);
        int categoryId = Integer.parseInt(catStr);

        Product p = new Product();
        p.setProductId(productId);
        p.setProductName(request.getParameter("productName"));
        p.setDescription(request.getParameter("description"));
        p.setImageUrl(request.getParameter("imageUrl"));
        p.setPrice(price);
        p.setStock(stock);
        p.setCategoryId(categoryId);

        productDAO.updateProduct(p);

        response.sendRedirect(request.getContextPath()+"/admin/products");
    }
}
