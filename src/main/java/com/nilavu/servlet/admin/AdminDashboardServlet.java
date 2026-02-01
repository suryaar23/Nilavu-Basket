package com.nilavu.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.OrderDAO;
import com.nilavu.dao.UserDAO;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.daoImplements.UserDAOImpl;
import com.nilavu.model.Order;
import com.nilavu.model.User;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAOImpl();
    private OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userDAO.getAllUsers();
        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("users", users);
        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/admin/admin-dashboard.jsp")
               .forward(request, response);
    }
}
