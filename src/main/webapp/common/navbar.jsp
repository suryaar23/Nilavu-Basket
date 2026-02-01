<%@ page import="com.nilavu.model.User" %>

<div class="navbar">
    <div class="brand">
        <%
            User user = (User) session.getAttribute("loggedUser");
            String homeLink = request.getContextPath() + "/";

            if (user != null) {
                if ("ADMIN".equals(user.getRole())) {
                    homeLink = request.getContextPath() + "/admin/dashboard";
                } else {
                    homeLink = request.getContextPath() + "/user/home.jsp";
                }
            }
        %>

        <a href="<%= homeLink %>" class="brand-link">
            Nilavu Basket
        </a>
    </div>

    <div class="nav-links">
        <% if (user == null) { %>
            <a href="<%=request.getContextPath()%>/auth/login.jsp">Login</a>
            <a href="<%=request.getContextPath()%>/auth/register.jsp">Register</a>

        <% } else if ("ADMIN".equals(user.getRole())) { %>
            <a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>
            <a href="<%=request.getContextPath()%>/admin/products">Manage Products</a>
            <a href="<%=request.getContextPath()%>/admin/viewUsers">Users</a>
            <a href="<%=request.getContextPath()%>/admin/viewOrders">Orders</a>
            <a href="<%=request.getContextPath()%>/logout">Logout</a>

        <% } else { %>
            <a href="<%=request.getContextPath()%>/user/home.jsp">Home</a>
            <a href="<%=request.getContextPath()%>/products">Products</a>
            <a href="<%=request.getContextPath()%>/viewCart">Cart</a>
            <a href="<%=request.getContextPath()%>/orderHistory">My Orders</a>
            <a href="<%=request.getContextPath()%>/logout">Logout</a>
        <% } %>
    </div>
</div>
