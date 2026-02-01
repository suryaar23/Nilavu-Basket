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
    <h2>Welcome to Nilavu Basket</h2>

    <% if (user != null) { %>
        <p style="text-align:center; margin-top:10px;">
            Hello, <strong><%= user.getName() %></strong> 👋  
            <br>Welcome to your grocery shopping dashboard.
        </p>
    <% } %>

    <div class="card-grid" style="margin-top:20px;">

        <div class="card">
            <a href="<%=request.getContextPath()%>/products">View Products</a>
        </div>

        <div class="card">
            <a href="<%=request.getContextPath()%>/viewCart">My Cart</a>
        </div>

        <div class="card">
            <a href="<%=request.getContextPath()%>/orderHistory">My Orders</a>
        </div>

        <div class="card">
            <a href="<%=request.getContextPath()%>/address">My Address</a>
        </div>

    </div>
</div>

</body>
</html>


