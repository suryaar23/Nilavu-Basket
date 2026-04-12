<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.User" %>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);

    java.util.ResourceBundle bundle =
        java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

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
        <h2><h2><%= bundle.getString("welcome_title") %></h2></h2>

        <% if (user != null) { %>
            <p style="margin-top:10px; font-size:16px;">
                Hello, <strong><%= user.getName() %></strong> 👋  
                <br><%= bundle.getString("manage_shopping") %>
            </p>
        <% } else { %>
            <p style="margin-top:10px; font-size:16px;">
                <%= bundle.getString("one_stop") %>
            </p>
        <% } %>
    </div>

    <!-- QUICK ACTIONS -->
    <h3 style="margin-top:30px; text-align:center;"><%= bundle.getString("quick_actions") %></h3>

    <div class="card-grid" style="margin-top:20px;">

        <div class="card">
            <h3>🛒 <%= bundle.getString("browse_products") %></h3>
            <p style="margin-top:10px;"><%= bundle.getString("view_all_items") %></p>
            <a class="btn" href="<%=request.getContextPath()%>/products"><%= bundle.getString("view_products") %></a>
        </div>

        <div class="card">
            <h3>🧺 <%= bundle.getString("my_cart") %></h3>
            <p style="margin-top:10px;"><%= bundle.getString("review_cart") %></p>
            <a class="btn" href="<%=request.getContextPath()%>/viewCart"><%= bundle.getString("go_to_cart") %></a>
        </div>

        <div class="card">
            <h3>📦 <%= bundle.getString("my_orders") %></h3>
            <p style="margin-top:10px;"><%= bundle.getString("track_orders") %></p>
            <a class="btn" href="<%=request.getContextPath()%>/orderHistory"><%= bundle.getString("view_orders") %></a>
        </div>

        <div class="card">
            <h3>🏠 <%= bundle.getString("address") %></h3>
            <p style="margin-top:10px;"><%= bundle.getString("manage_address") %></p>
            <a class="btn" href="<%=request.getContextPath()%>/address"><%= bundle.getString("my_address") %></a>
        </div>
		
		<div class="card">
    		<h3>🏪 <%= bundle.getString("browse_shops") %></h3>
    		<p style="margin-top:10px;"><%= bundle.getString("explore_shopwise") %></p>
    		<a class="btn" href="<%=request.getContextPath()%>/shops"><%= bundle.getString("view_shops") %></a>
		</div>
    </div>

</div>

</body>
</html>


