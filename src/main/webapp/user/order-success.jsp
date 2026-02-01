<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Order, com.nilavu.model.OrderItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Order Placed Successfully</h2>

    <div class="form-box" style="max-width:750px;">
        <p><b>Order ID:</b> ${order.orderId}</p>
        <p><b>Order Date:</b> ${order.orderDate}</p>
        <p><b>Status:</b> ${order.status}</p>
        <p><b>Total Amount:</b> ₹ ${order.totalAmount}</p>

        <h3 style="margin-top:20px;">Order Items</h3>

        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price (₹)</th>
            </tr>

        <%
            List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");
            if (items != null && !items.isEmpty()) {
                for (OrderItem i : items) {
        %>
            <tr>
                <td><%= i.getProductName() %></td>
                <td><%= i.getQuantity() %></td>
                <td>₹ <%= i.getPrice() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3" style="text-align:center;">No items found.</td>
            </tr>
        <%
            }
        %>
        </table>
    </div>

    <div style="text-align:center; margin-top:25px;">
        <a class="btn" href="<%=request.getContextPath()%>/products">Continue Shopping</a>
        <a class="btn" href="<%=request.getContextPath()%>/user/home.jsp">Go to Home</a>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>


