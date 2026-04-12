<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.OrderItem" %>

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
    <title>Order Details - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">

    <h2 style="text-align:center;"><%= bundle.getString("order_details") %></h2>

    <!-- ✅ Same wrapper as order history -->
    <div class="form-box" style="max-width:900px; margin:auto;">

        <table>
            <tr>
                <th><%= bundle.getString("product") %></th>
                <th><%= bundle.getString("quantity") %></th>
                <th><%= bundle.getString("price") %> (₹)</th>
                <th><%= bundle.getString("total") %> (₹)</th>
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
                <td>₹ <%= i.getPrice() * i.getQuantity() %></td>
            </tr>

        <%
                }
            } else {
        %>

            <tr>
                <td colspan="4" style="text-align:center;">
                    No items found.
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