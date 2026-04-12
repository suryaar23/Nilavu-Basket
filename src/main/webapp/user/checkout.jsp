<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.CartItem, com.nilavu.model.Address" %>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);
    java.util.ResourceBundle bundle = java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

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
    <h2 style="text-align:center;"><%= bundle.getString("order_summary") %></h2>

    <%
        List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    %>

    <div class="form-box" style="max-width:600px;">
        <table>
            <tr>
                <th><%= bundle.getString("product_name") %></th>
                <th><%= bundle.getString("quantity") %></th>
            </tr>

        <%
            if (cartItems != null && !cartItems.isEmpty()) {
                for (CartItem ci : cartItems) {
        %>
            <tr>
                <td><%= ci.getProductName() %></td>
                <td><%= ci.getQuantity() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <%= bundle.getString("no_items_cart") %>
                </td>
            </tr>
        <%
            }
        %>
        </table>

        <div style="text-align:center; margin-top:20px;">
            <form action="<%=request.getContextPath()%>/checkout" method="post">

                <!--ADDRESS DROPDOWN -->
                <label><%= bundle.getString("delivery_address") %></label>

                <select name="addressId" required style="width:100%; margin:10px 0; padding:8px;">
                <%
                    List<Address> addresses = (List<Address>) request.getAttribute("address");

                    if (addresses != null && !addresses.isEmpty()) {
                        for (Address a : addresses) {
                %>
                    <option value="<%=a.getAddressId()%>">
                        <%= a.getStreet() %>, <%= a.getCity() %> - <%= a.getPincode() %>
                    </option>
                <%
                        }
                    } else {
                %>
                    <option disabled>No address available</option>
                <%
                    }
                %>
                </select>

                <!-- ✅ SUBMIT -->
                <button type="submit" class="btn">
                    <%= bundle.getString("confirm_place_order") %>
                </button>

            </form>
        </div>

        <div style="text-align:center; margin-top:10px;">
            <a href="<%=request.getContextPath()%>/viewCart">
                <button type="button" class="btn">
                    <%= bundle.getString("back_to_cart") %>
                </button>
            </a>
        </div>

    </div>
</div>

</body>
</html>
