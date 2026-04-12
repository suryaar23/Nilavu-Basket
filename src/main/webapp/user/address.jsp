<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.Address" %>

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
    <title>My Address - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;"><%= bundle.getString("delivery_address") %></h2>

    <%
        Address address = (Address) request.getAttribute("address");
    %>

    <div class="form-box" style="max-width:500px;">
        <form action="<%=request.getContextPath()%>/address" method="post">

            <label><%= bundle.getString("street") %></label>
            <input type="text" name="street"
                   value="<%= address != null ? address.getStreet() : "" %>" required>

            <label><%= bundle.getString("city") %></label>
            <input type="text" name="city"
                   value="<%= address != null ? address.getCity() : "" %>" required>

            <label><%= bundle.getString("state") %></label>
            <input type="text" name="state"
                   value="<%= address != null ? address.getState() : "" %>" required>

            <label><%= bundle.getString("pincode") %></label>
            <input type="text" name="pincode"
                   value="<%= address != null ? address.getPincode() : "" %>" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn"><%= bundle.getString("save_address") %></button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
