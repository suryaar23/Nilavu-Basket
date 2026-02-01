package com.nilavu.servlet.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.nilavu.dao.CartDAO;
import com.nilavu.dao.CartItemDAO;
import com.nilavu.dao.ProductDAO;
import com.nilavu.daoImplements.CartDAOImpl;
import com.nilavu.daoImplements.CartItemDAOImpl;
import com.nilavu.daoImplements.ProductDAOImpl;
import com.nilavu.model.User;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO cartDAO = new CartDAOImpl();
    private CartItemDAO cartItemDAO = new CartItemDAOImpl();
    private ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        if (user == null) {
            response.sendRedirect("auth/login.jsp");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int cartId = cartDAO.getOrCreateCart(user.getUserId());

        int stock = productDAO.getStockByProductId(productId);
        int alreadyInCart = cartItemDAO.getQuantityInCart(cartId, productId);

        // 🔒 Block if exceeds stock
        if (alreadyInCart >= stock) {
            response.sendRedirect("products?error=limitreached");
            return;
        }

        cartItemDAO.addToCart(cartId, productId);

        response.sendRedirect("products");
    }
}

