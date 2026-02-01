<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>Checkout</h2>

    <%
        List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    %>

    <table>
        <tr>
            <th>Product ID</th>
            <th>Quantity</th>
        </tr>

    <%
        if (cartItems != null && !cartItems.isEmpty()) {
            for (CartItem ci : cartItems) {
    %>
        <tr>
            <td><%= ci.getProductId() %></td>
            <td><%= ci.getQuantity() %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="2">No items in cart.</td>
        </tr>
    <%
        }
    %>

    </table>

    <div style="text-align:center; margin-top:15px;">
        <form action="<%=request.getContextPath()%>/checkout" method="post">
            <button type="submit" class="btn">Confirm & Place Order</button>
        </form>
    </div>

    <div style="text-align:center; margin-top:10px;">
        <a href="<%=request.getContextPath()%>/viewCart">
            <button type="button" class="btn">Back to Cart</button>
        </a>
    </div>
</div>

</body>
</html>


