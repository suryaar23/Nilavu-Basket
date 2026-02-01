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
    <h2 style="text-align:center;">All Orders</h2>
    <p style="text-align:center; margin-top:5px;">
        View and monitor all customer orders.
    </p>

    <div class="form-box" style="max-width:1000px;">

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
                <td>₹ <%= o.getTotalAmount() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" style="text-align:center;">No orders found.</td>
            </tr>
        <%
            }
        %>

        </table>

        <div style="text-align:center; margin-top:15px;">
            <a class="btn" href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>
        </div>
    </div>
</div>

</body>
</html>

