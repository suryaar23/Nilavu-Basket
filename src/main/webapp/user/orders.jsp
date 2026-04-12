<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

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
    <title>My Orders - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;"><%= bundle.getString("order_history") %></h2>

    <div class="form-box" style="max-width:900px; margin:auto;">

        <table>
            <tr>
                <th><%= bundle.getString("order_id") %></th>
				<th><%= bundle.getString("date") %></th>
				<th><%= bundle.getString("status") %></th>
				<th><%= bundle.getString("total_amount") %></th>
                <th><%= bundle.getString("action") %></th> 
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

                
                <td style="text-align:center;">
                    <a class="btn"
                       href="<%=request.getContextPath()%>/common/order-details?orderId=<%=o.getOrderId()%>">
                        <%= bundle.getString("view_details") %>
                    </a>
                </td>
            </tr>

        <%
                }
            } else {
        %>

            <tr>
                <td colspan="5" style="text-align:center;">
                    <%= bundle.getString("no_orders") %>.
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
