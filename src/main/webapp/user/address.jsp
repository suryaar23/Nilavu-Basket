<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.Address" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Address - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Delivery Address</h2>

<%
    Address address = (Address) request.getAttribute("address");
%>

<form action="<%=request.getContextPath()%>/address" method="post">
    <label>Street:</label><br>
    <input type="text" name="street"
           value="<%= address != null ? address.getStreet() : "" %>" required><br><br>

    <label>City:</label><br>
    <input type="text" name="city"
           value="<%= address != null ? address.getCity() : "" %>" required><br><br>

    <label>State:</label><br>
    <input type="text" name="state"
           value="<%= address != null ? address.getState() : "" %>" required><br><br>

    <label>Pincode:</label><br>
    <input type="text" name="pincode"
           value="<%= address != null ? address.getPincode() : "" %>" required><br><br>

    <button type="submit">Save Address</button>
</form>

</body>
</html>
