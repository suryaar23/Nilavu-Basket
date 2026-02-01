package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.model.Order;
import com.nilavu.model.User;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        List<Order> orders = orderDAO.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("user/orders.jsp").forward(request, response);
    }
}
