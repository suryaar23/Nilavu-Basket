package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.nilavu.dao.CartItemDAO;
import com.nilavu.daoImplements.CartItemDAOImpl;

@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CartItemDAO cartItemDAO = new CartItemDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

        cartItemDAO.removeItem(cartItemId);

        response.sendRedirect("viewCart");
    }
}
