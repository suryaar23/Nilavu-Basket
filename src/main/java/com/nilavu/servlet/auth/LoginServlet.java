package com.nilavu.servlet.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.nilavu.dao.UserDAO;
import com.nilavu.daoImplements.UserDAOImpl;
import com.nilavu.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
               request.setAttribute("error", "Invalid credentials");
               request.getRequestDispatcher("/auth/login.jsp").forward(request, response);
               return;
        }
        
        User user = userDAO.login(email, password);

        if (user != null) {
            
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedUser", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-dashboard");
            }
            
            else if("SHOP".equalsIgnoreCase(user.getRole())){
                response.sendRedirect(request.getContextPath() + "/shop/shop-dashboard");
            }
            
            else if("AGENT".equalsIgnoreCase(user.getRole())) {
            	response.sendRedirect(request.getContextPath() + "/agent/agent-dashboard");
            }
            
            else {
            	response.sendRedirect(request.getContextPath() + "/user/home");
            }
            
            
        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("auth/login.jsp").forward(request, response);
        }
    }
}
