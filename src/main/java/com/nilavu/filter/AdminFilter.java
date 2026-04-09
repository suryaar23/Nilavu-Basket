package com.nilavu.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.nilavu.model.User;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        // Not logged in
        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            return;
        }

        // Not admin
        if (!"ADMIN".equals(user.getRole())) {
            res.sendRedirect(req.getContextPath() + "/user/home");
            return;
        }

        // Allowed
        chain.doFilter(request, response);
    }
}