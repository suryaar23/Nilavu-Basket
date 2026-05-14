<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agent Orders - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">
        <%= request.getAttribute("heading") %>
    </h2>

```
<div class="form-box" style="max-width:1100px; margin:auto;">

    <table>
        <tr>
            <th>Order ID</th>
            <th>Date</th>
            <th>Status</th>
            <th>Total Amount (₹)</th>
            <th>Details</th>
            <th>Action</th>
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

            <!-- PICKUP + DELIVERY -->
            <td>
                <% if ("ASSIGNED".equals(o.getStatus()) || "OUT FOR DELIVERY".equals(o.getStatus())) { %>

                    <b>Pickup:</b><br>
                    <%= o.getShopName() %><br>
                    <%= o.getShopAddress() %>

                    <br><br>

                    <b>Delivery:</b><br>
                    <%= o.getStreet() %>,
                    <%= o.getCity() %>,
                    <%= o.getState() %> -
                    <%= o.getPincode() %>

                <% } else { %>

                    <%= o.getStreet() %>,
                    <%= o.getCity() %>,
                    <%= o.getState() %> -
                    <%= o.getPincode() %>

                <% } %>
            </td>

            <td style="text-align:center;">

                <% if ("ASSIGNED".equals(o.getStatus())) { %>
                    <a class="btn"
                       href="<%=request.getContextPath()%>/agent/start-delivery?orderId=<%=o.getOrderId()%>">
                        Start Delivery
                    </a>

                <% } else if ("OUT FOR DELIVERY".equals(o.getStatus())) { %>
                    <a class="btn"
                       href="<%=request.getContextPath()%>/agent/complete-delivery?orderId=<%=o.getOrderId()%>">
                        Mark Delivered
                    </a>

                <% } else { %>
                    <span style="color:gray;">Completed</span>
                <% } %>

                <br><br>

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
            <td colspan="6" style="text-align:center;">
                <%
                    String heading = (String) request.getAttribute("heading");

                    if (heading != null && heading.contains("active")) {
                %>
                    No active orders
                <%
                    } else if (heading != null && heading.contains("completed")) {
                %>
                    No completed orders
                <%
                    } else {
                %>
                    No orders assigned
                <%
                    }
                %>
            </td>
        </tr>

        <%
            }
        %>

    </table>
</div>
```

</div>

</body>
</html>

