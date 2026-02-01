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
import com.nilavu.dao.OrderDAO;
import com.nilavu.dao.OrderItemDAO;
import com.nilavu.dao.ProductDAO;

import com.nilavu.daoImplements.CartDAOImpl;
import com.nilavu.daoImplements.CartItemDAOImpl;
import com.nilavu.daoImplements.OrderDAOImpl;
import com.nilavu.daoImplements.OrderItemDAOImpl;
import com.nilavu.daoImplements.ProductDAOImpl;

import com.nilavu.model.CartItem;
import com.nilavu.model.User;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO = new CartDAOImpl();
    private CartItemDAO cartItemDAO = new CartItemDAOImpl();
    private OrderDAO orderDAO = new OrderDAOImpl();
    private OrderItemDAO orderItemDAO = new OrderItemDAOImpl();
    private ProductDAO productDAO = new ProductDAOImpl();

    // =========================
    // SHOW CHECKOUT PAGE
    // =========================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        int cartId = cartDAO.getOrCreateCart(user.getUserId());
        List<CartItem> cartItems = cartItemDAO.getCartItems(cartId);

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("viewCart");
            return;
        }

        // send cart items to JSP
        request.setAttribute("cartItems", cartItems);
        request.getRequestDispatcher("/user/checkout.jsp")
               .forward(request, response);
    }

    // =========================
    // PLACE ORDER
    // =========================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        int cartId = cartDAO.getOrCreateCart(user.getUserId());
        List<CartItem> cartItems = cartItemDAO.getCartItems(cartId);

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect("viewCart");
            return;
        }

        // 1. Calculate total
        double totalAmount = 0;
        for (CartItem item : cartItems) {
            totalAmount += item.getPrice() * item.getQuantity();
        }

        // 2. Create order
        int orderId = orderDAO.createOrder(user.getUserId(), totalAmount);

        if (orderId > 0) {

            // 3. Insert order items
            orderItemDAO.addOrderItems(orderId, cartItems);

            // 4. Reduce stock
            for (CartItem item : cartItems) {
                productDAO.reduceStock(item.getProductId(), item.getQuantity());
            }

            // 5. Clear cart
            cartItemDAO.clearCart(cartId);

            // 6. Mark cart completed
            cartDAO.markCartCompleted(cartId);

            // store order id for payment page
            session.setAttribute("lastOrderId", orderId);

            // redirect to payment
            response.sendRedirect("user/payment.jsp");

        } else {
            response.sendRedirect("viewCart");
        }
    }
}

