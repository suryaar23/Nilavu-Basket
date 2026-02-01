<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.User" %>

<!DOCTYPE html>
<html>
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

<h2>Welcome to Nilavu Basket</h2>

<% if (user != null) { %>
    <p style="text-align:center;">
        Hello, <strong><%= user.getName() %></strong> 👋  
        <br>Welcome to your grocery shopping dashboard.
    </p>
<% } %>

<div style="text-align:center; margin-top:20px;">
    <a href="<%=request.getContextPath()%>/products">
        <button>View Products</button>
    </a>

    <a href="<%=request.getContextPath()%>/viewCart">
        <button>My Cart</button>
    </a>

    <a href="<%=request.getContextPath()%>/orderHistory">
        <button>My Orders</button>
    </a>

    <a href="<%=request.getContextPath()%>/address">
        <button>My Address</button>
    </a>
</div>

</body>
</html>
