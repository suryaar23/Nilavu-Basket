package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.nilavu.dao.CartDAO;
import com.nilavu.dao.CartItemDAO;
import com.nilavu.daoImplements.CartDAOImpl;
import com.nilavu.daoImplements.CartItemDAOImpl;
import com.nilavu.model.CartItem;
import com.nilavu.model.User;

@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO = new CartDAOImpl();
    private CartItemDAO cartItemDAO = new CartItemDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Force UTF-8 (fixes ₹ symbol issue)
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // ✅ Prevent browser caching (fix back button issue)
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }

        int cartId = cartDAO.getOrCreateCart(user.getUserId());
        List<CartItem> cartItems = cartItemDAO.getCartItems(cartId);

        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("/user/cart.jsp").forward(request, response);
    }
}
