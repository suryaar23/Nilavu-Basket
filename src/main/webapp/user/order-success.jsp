<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Order, com.nilavu.model.OrderItem" %>

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
    <title>Order Success - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;"><%= bundle.getString("order_success") %></h2>

    <div class="form-box" style="max-width:750px;">
        <p><b><%= bundle.getString("date") %> :</b> ${order.orderDate}</p>
        <p><b><%= bundle.getString("status") %> :</b> ${order.status}</p>
        <p><b><%= bundle.getString("total_amount") %> :</b> ₹ ${order.totalAmount}</p>

        <h3 style="margin-top:20px;"><%= bundle.getString("order_items") %></h3>

        <table>
            <tr>
                <th><%= bundle.getString("product") %></th>
                <th><%= bundle.getString("quantity") %></th>
                <th><%= bundle.getString("price") %> (₹)</th>
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
        <a class="btn" href="<%=request.getContextPath()%>/products"><%= bundle.getString("continue_shopping") %></a>
        <a class="btn" href="<%=request.getContextPath()%>/user/home.jsp"><%= bundle.getString("go_home") %></a>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>