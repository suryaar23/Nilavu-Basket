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
import com.nilavu.dao.OrderItemDAO;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.daoImplements.OrderItemDAOImpl;
import com.nilavu.model.Order;
import com.nilavu.model.OrderItem;
import com.nilavu.model.User;

@WebServlet("/orderSuccess")
public class OrderSuccessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO = new OrderDAOImpl();
    private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        Integer orderId = (Integer) session.getAttribute("lastOrderId");

        if (orderId == null) {
            response.sendRedirect("orderHistory");
            return;
        }

        Order order = orderDAO.getOrderById(orderId);
        List<OrderItem> items = orderItemDAO.getOrderItems(orderId);

        request.setAttribute("order", order);
        request.setAttribute("items", items);

        request.getRequestDispatcher("user/order-success.jsp")
               .forward(request, response);
    }
}
