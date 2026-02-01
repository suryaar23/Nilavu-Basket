package com.nilavu.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.nilavu.dao.CategoryDAO;
import com.nilavu.daoImplements.CategoryDAOImpl;
import com.nilavu.model.Category;

@WebServlet("/admin/addCategory")
public class AddCategoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryName = request.getParameter("categoryName");

        Category category = new Category();
        category.setCategoryName(categoryName);

        categoryDAO.addCategory(category);

        response.sendRedirect("dashboard");
    }
}
