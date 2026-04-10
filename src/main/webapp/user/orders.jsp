<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Orders - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Order History</h2>

    <div class="form-box" style="max-width:900px; margin:auto;">

        <table>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Total Amount (₹)</th>
                <th>Action</th> <!-- ✅ added -->
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
                <td>₹ <%= o.getTotalAmount() %></td>

                <!-- ✅ FIXED -->
                <td style="text-align:center;">
                    <a class="btn"
                       href="<%=request.getContextPath()%>/common/order-details?orderId=<%=o.getOrderId()%>">
                        View Details
                    </a>
                </td>
            </tr>

        <%
                }
            } else {
        %>

            <tr>
                <td colspan="5" style="text-align:center;"> <!-- ✅ fixed -->
                    No orders found.
                </td>
            </tr>

        <%
            }
        %>

        </table>
    </div>
</div>

</body>
</html>
