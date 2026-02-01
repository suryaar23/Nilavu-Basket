<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>My Orders</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Order ID</th>
        <th>Date</th>
        <th>Status</th>
        <th>Total Amount (₹)</th>
    </tr>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    if (orders != null && !orders.isEmpty()) {
        for (Order o : orders) {
%>
    <tr>
        <td><%= o.getOrderId() %></td>
        <td><%= o.getOrderDate() %></td>
        <td><%= o.getStatus() %></td>
        <td><%= o.getTotalAmount() %></td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="4">No orders found.</td>
    </tr>
<%
    }
%>

</table>

</body>
</html>
