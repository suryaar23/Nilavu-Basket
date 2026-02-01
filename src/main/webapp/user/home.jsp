<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<%
    User user = (User) session.getAttribute("loggedUser");
%>

<div class="container">

    <!-- HERO SECTION -->
    <div style="background:#ffffff; padding:30px; border-radius:14px; box-shadow:0 10px 25px rgba(0,0,0,0.08); text-align:center;">
        <h2>Welcome to Nilavu Basket</h2>

        <% if (user != null) { %>
            <p style="margin-top:10px; font-size:16px;">
                Hello, <strong><%= user.getName() %></strong> 👋  
                <br>Manage your shopping from one place.
            </p>
        <% } else { %>
            <p style="margin-top:10px; font-size:16px;">
                Your one-stop grocery shopping platform.
            </p>
        <% } %>
    </div>

    <!-- QUICK ACTIONS -->
    <h3 style="margin-top:30px; text-align:center;">Quick Actions</h3>

    <div class="card-grid" style="margin-top:20px;">

        <div class="card">
            <h3>🛒 Browse Products</h3>
            <p style="margin-top:10px;">View all available grocery items.</p>
            <a class="btn" href="<%=request.getContextPath()%>/products">View Products</a>
        </div>

        <div class="card">
            <h3>🧺 My Cart</h3>
            <p style="margin-top:10px;">Review items you added to cart.</p>
            <a class="btn" href="<%=request.getContextPath()%>/viewCart">Go to Cart</a>
        </div>

        <div class="card">
            <h3>📦 My Orders</h3>
            <p style="margin-top:10px;">Track your previous orders.</p>
            <a class="btn" href="<%=request.getContextPath()%>/orderHistory">View Orders</a>
        </div>

        <div class="card">
            <h3>🏠 Address</h3>
            <p style="margin-top:10px;">Manage your delivery address.</p>
            <a class="btn" href="<%=request.getContextPath()%>/address">My Address</a>
        </div>

    </div>

</div>

</body>
</html>


