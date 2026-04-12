<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Shop" %>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);

    java.util.ResourceBundle bundle =
        java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shops - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">

    <h2 style="text-align:center;"><%= bundle.getString("browse_shops") %></h2>

    <div class="card-grid" style="margin-top:20px;">

    <%
        List<Shop> shops = (List<Shop>) request.getAttribute("shops");

        if (shops != null && !shops.isEmpty()) {
            for (Shop s : shops) {
    %>

        <div class="card">
            <h3><%= s.getName() %></h3>

            <a class="btn"
               href="<%=request.getContextPath()%>/products?shopId=<%=s.getId()%>">
                <%= bundle.getString("view_products") %>
            </a>
        </div>

    <%
            }
        } else {
    %>

        <p style="text-align:center;"><%= bundle.getString("no_shops") %></p>

    <%
        }
    %>

    </div>

</div>

</body>
</html>