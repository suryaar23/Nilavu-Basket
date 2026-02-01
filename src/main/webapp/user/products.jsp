<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Available Products</h2>
<%
    String error = request.getParameter("error");
    if ("limitreached".equals(error)) {
%>
    <div style="color:red; text-align:center; font-weight:bold; margin-bottom:10px;">
        You cannot add more of this item. Stock limit reached.
    </div>
<%
    }
%>

<table cellpadding="10">
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price (₹)</th>
        <th>Stock</th>
        <th>Description</th>
        <th>Action</th>
    </tr>

<%
    List<Product> products = (List<Product>) request.getAttribute("products");
    if (products != null) {
        for (Product p : products) {
%>
    <tr>
        <td>
            <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>"
                 width="80" height="80">
        </td>
        <td><%= p.getProductName() %></td>
        <td><%= p.getPrice() %></td>
        <td><%= p.getStock() %></td>
        <td><%= p.getDescription() %></td>
        <td>
            <% if (p.getStock() > 0) { %>
                <a class="btn"
                   href="<%=request.getContextPath()%>/addToCart?productId=<%=p.getProductId()%>">
                    Add to Cart
                </a>
            <% } else { %>
                <span style="color:red; font-weight:bold;">Out of Stock</span><br>
                <button class="btn" disabled style="background:#9ca3af;">
                    Unavailable
                </button>
            <% } %>
        </td>
    </tr>
<%
        }
    }
%>

</table>

</body>
</html>

