<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.User" %>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);

    java.util.ResourceBundle bundle =
        java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

<nav class="navbar">
    <div class="navbar-container">

        <%
            User user = (User) session.getAttribute("loggedUser");
            String homeLink = request.getContextPath() + "/";

            if (user != null) {
                String role = user.getRole();

                if ("ADMIN".equalsIgnoreCase(role)) {
                    homeLink = request.getContextPath() + "admin/admin-dashboard";
                } 
                else if ("SHOP".equalsIgnoreCase(role)) {
                    homeLink = request.getContextPath() + "shop/shop-dashboard";
                }
                else if ("AGENT".equalsIgnoreCase(role)) {
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

        <!-- CENTER: LANGUAGE SWITCH -->
        <div class="navbar-lang" style="margin-left:auto;">
            <form action="<%=request.getContextPath()%>/change-language"
                  method="get"
                  style="display:inline;">

                <select name="lang" onchange="this.form.submit()">

                    <option value="en" <%= "en".equals(lang) ? "selected" : "" %>>
                        English
                    </option>

                    <option value="ml" <%= "ml".equals(lang) ? "selected" : "" %>>
                        Malayalam
                    </option>

                    <option value="ta" <%= "ta".equals(lang) ? "selected" : "" %>>
                        Tamil
                    </option>

                </select>
            </form>
        </div>

        <!-- RIGHT: NAV LINKS -->
        <div class="navbar-links">

            <% if (user == null) { %>

                <a href="<%=request.getContextPath()%>/auth/login.jsp"><%= bundle.getString("login") %></a>
                <a class="btn-nav" href="<%=request.getContextPath()%>/auth/register.jsp"><%= bundle.getString("register") %></a>

            <% } else if ("ADMIN".equalsIgnoreCase(user.getRole())) { %>

                <a href="<%=request.getContextPath()%>/admin/admin-dashboard">Dashboard</a>
                <a href="<%=request.getContextPath()%>/admin/products">Products</a>
                <a href="<%=request.getContextPath()%>/admin/viewUsers">Users</a>
                <a href="<%=request.getContextPath()%>/admin/viewOrders">Orders</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>

            <% } else if ("SHOP".equalsIgnoreCase(user.getRole())) { %>

                <a href="<%=request.getContextPath()%>/shop/shop-dashboard">Dashboard</a>
                <a href="<%=request.getContextPath()%>/shop/products">Products</a>
                <a href="<%=request.getContextPath()%>/shop/orders?filter=completed">Orders</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>

            <% } else if ("AGENT".equalsIgnoreCase(user.getRole())) { %>

                <a href="<%=request.getContextPath()%>/agent/agent-dashboard">Dashboard</a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout">Logout</a>

            <% } else { %>

                <a href="<%=request.getContextPath()%>/user/home"><%= bundle.getString("home") %></a>
                <a href="<%=request.getContextPath()%>/products"><%= bundle.getString("products") %></a>
                <a href="<%=request.getContextPath()%>/viewCart"><%= bundle.getString("cart") %></a>
                <a href="<%=request.getContextPath()%>/orderHistory"><%= bundle.getString("orders") %></a>
                <a class="btn-nav danger" href="<%=request.getContextPath()%>/logout"><%= bundle.getString("logout") %></a>

            <% } %>

        </div>
    </div>
</nav>
