package com.nilavu.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.nilavu.model.User;

@WebFilter("/*")
public class RoleBasedFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String context = req.getContextPath();
        String path = req.getRequestURI();

        //ensures no caching
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);

        //Allow public resources
        if (path.startsWith(context + "/auth") ||
        	path.equals(context + "/login") ||
        	path.equals(context + "/register") ||
        	path.equals(context + "/logout") ||
            path.startsWith(context + "/css") ||
            path.startsWith(context + "/js") ||
            path.startsWith(context + "/images")) {

            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("loggedUser") : null;

        // Not logged in
        if (user == null) {
            res.sendRedirect(context + "/auth/login.jsp");
            return;
        }

        String role = user.getRole();

        // Role-based access checks
        if (path.startsWith(context + "/admin") && !"ADMIN".equals(role)) {
            res.sendRedirect(getHomeByRole(role, context));
            return;
        }

        if (path.startsWith(context + "/user") && !"USER".equals(role)) {
            res.sendRedirect(getHomeByRole(role, context));
            return;
        }

        if (path.startsWith(context + "/shop") && !"SHOP".equals(role)) {
            res.sendRedirect(getHomeByRole(role, context));
            return;
        }

        if (path.startsWith(context + "/agent") && !"AGENT".equals(role)) {
            res.sendRedirect(getHomeByRole(role, context));
            return;
        }

        //Allowed
        chain.doFilter(request, response);
    }

    
    private String getHomeByRole(String role, String context) {
        switch (role) {
            case "ADMIN":
                return context + "/admin/admin-dashboard";
            case "SHOP":
                return context + "/shop/shop-dashboard";
            case "AGENT":
                return context + "/agent/agent-dashboard";
            default:
                return context + "/user/home";
        }
    }
}