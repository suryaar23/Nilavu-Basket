package com.nilavu.servlet.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.OrderDAO;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.model.Order;

@WebServlet("/admin/viewOrders")
public class ViewOrdersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/view-orders.jsp")
               .forward(request, response);
    }
}
