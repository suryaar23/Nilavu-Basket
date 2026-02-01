<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.CartItem" %>

<%
    if (session == null || session.getAttribute("loggedUser") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Cart - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/js/script.js"></script>
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
<h2>My Cart</h2>

<table>
    <tr>
        <th>Product</th>
        <th>Price (₹)</th>
        <th>Quantity</th>
        <th>Total (₹)</th>
        <th>Action</th>
    </tr>

<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    double grandTotal = 0;

    if (cartItems != null && !cartItems.isEmpty()) {
        for (CartItem ci : cartItems) {
            double itemTotal = ci.getPrice() * ci.getQuantity();
            grandTotal += itemTotal;
%>
    <tr>
        <td><%= ci.getProductName() %></td>
        <td><%= ci.getPrice() %></td>
        <td><%= ci.getQuantity() %></td>
        <td><%= itemTotal %></td>
        <td>
            <a class="btn btn-danger"
               onclick="return confirmDelete('Remove this item?')"
               href="<%=request.getContextPath()%>/removeFromCart?cartItemId=<%=ci.getCartItemId()%>">
               Remove
            </a>
        </td>
    </tr>
<%
        }
%>
    <tr>
        <td colspan="3"><b>Grand Total</b></td>
        <td colspan="2"><b>₹ <%= grandTotal %></b></td>
    </tr>
<%
    } else {
%>
    <tr>
        <td colspan="5">Your cart is empty.</td>
    </tr>
<%
    }
%>

</table>

<br>

<% if (cartItems != null && !cartItems.isEmpty()) { %>
<form action="checkout" method="post">
    <button class="btn">Proceed to Checkout</button>
</form>
<% } %>

</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>

