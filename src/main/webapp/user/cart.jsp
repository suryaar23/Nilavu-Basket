<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.CartItem" %>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);

    java.util.ResourceBundle bundle =
        java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

<%
    if (session == null || session.getAttribute("loggedUser") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
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
    <h2 style="text-align:center;"><%= bundle.getString("my_cart") %></h2>

    <table>
        <tr>
            <th><%= bundle.getString("product") %></th>
            <th><%= bundle.getString("price") %>(₹)</th>
            <th><%= bundle.getString("quantity") %></th>
            <th><%= bundle.getString("total") %> (₹)</th>
            <th><%= bundle.getString("action") %></th>
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
            <td>₹ <%= ci.getPrice() %></td>
            <td><%= ci.getQuantity() %></td>
            <td>₹ <%= itemTotal %></td>
            <td>
                <a class="btn btn-danger"
                   onclick="return confirmDelete('<%= bundle.getString("confirm_remove") %>')"
                   href="<%=request.getContextPath()%>/removeFromCart?cartItemId=<%=ci.getCartItemId()%>">
                   <%= bundle.getString("remove") %>
                </a>
            </td>
        </tr>
    <%
            }
    %>
        <tr>
            <td colspan="3" style="text-align:right;"><b><%= bundle.getString("grand_total") %>:</b></td>
            <td colspan="2"><b>₹ <%= grandTotal %></b></td>
        </tr>
    <%
        } else {
    %>
        <tr>
            <td colspan="5" style="text-align:center;"><%= bundle.getString("cart_empty") %></td>
        </tr>
    <%
        }
    %>

    </table>

    <% if (cartItems != null && !cartItems.isEmpty()) { %>
    <div style="text-align:right; margin-top:20px;">
        <a href="<%=request.getContextPath()%>/checkout">
            <button class="btn" type="button"><%= bundle.getString("proceed_checkout") %></button>
        </a>
    </div>
	<% } %>

	</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>

