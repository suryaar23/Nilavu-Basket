<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Orders - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>All Orders</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>User</th>
            <th>Order Date</th>
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
            <td><%= o.getUserName() %></td>
            <td><%= o.getOrderDate() %></td>
            <td><%= o.getStatus() %></td>
            <td><%= o.getTotalAmount() %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="5">No orders found.</td>
        </tr>
    <%
        }
    %>

    </table>

    <div style="margin-top:15px;">
        <a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>
    </div>
</div>

</body>
</html>


