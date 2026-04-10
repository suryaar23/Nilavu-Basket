<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.User" %>

<nav class="navbar">
    <div class="navbar-container">
        <%
            User user = (User) session.getAttribute("loggedUser");
            String homeLink = request.getContextPath() + "/";

            if (user != null) {
                if ("ADMIN".equals(user.getRole())) {
                    homeLink = request.getContextPath() + "admin/admin-dashboard";
                } 
                else if("SHOP".equals(user.getRole())){
                	homeLink = request.getContextPath() + "shop/shop-dashboard";
                }
                
                else if("AGENT".equals(user.getRole())){
                	homeLink = request.getContextPath() + "agent/agent-dashboard";
                }
                else {
                    homeLink = request.getContextPath() + "user/home";
                }
            }
        %>

        <!-- LEFT: BRAND -->
        <div class="navbar-brand">
            <a href="<%= homeLink %>">🛒 Nilavu Basket</a>
        </div>

        <!-- RIGHT: LINKS -->
        <div class="navbar-links">
            <% if (user == null) { %>
                <a href="<%=request.getContextPath()%>/auth/login.jsp">Login</a>
                <a class="btn-nav" href="<%=request.getContextPath()%>/auth/register.jsp">Register</a>

            <% } else if ("ADMIN".equals(user.getRole())) { %>
                <a href="<%=request.getContextPath()%>/admin/admin-dashboard">Dashboard</a>
                <a href="<%=request.getContextPath()%>/admin/products">Products</a>
                <a href="<%=request.getContextPath()%>/admin/viewUsers">Users</a>
                <a href="<%=request.getContextPath()%>/admin/viewOrders">Orders</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>
                
             <% } else if ("SHOP".equals(user.getRole())) { %>
                <a href="<%=request.getContextPath()%>/shop/shop-dashboard">Dashboard</a>
                <a href="<%=request.getContextPath()%>/shop/products">Products</a>
                <a href="<%=request.getContextPath()%>/shop/orders?filter=completed">Orders</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>
                
                
			<% } else if ("AGENT".equals(user.getRole())) { %>
                <a href="<%=request.getContextPath()%>/agent/agent-dashboard.jsp">Dashboard</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>
                
                
            <% } else { %>
                <a href="<%=request.getContextPath()%>/user/home.jsp">Home</a>
                <a href="<%=request.getContextPath()%>/products">Products</a>
                <a href="<%=request.getContextPath()%>/viewCart">Cart</a>
                <a href="<%=request.getContextPath()%>/orderHistory">Orders</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>
            <% } %>
        </div>
    </div>
</nav>
