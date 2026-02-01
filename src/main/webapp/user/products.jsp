<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Available Products</h2>

    <%
        String error = request.getParameter("error");
        if ("limitreached".equals(error)) {
    %>
        <div style="color:red; text-align:center; font-weight:bold; margin:15px 0;">
            You cannot add more of this item. Stock limit reached.
        </div>
    <%
        }
    %>

    <div class="card-grid" style="margin-top:20px;">

    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (Product p : products) {
    %>
        <div class="card" style="text-align:center;">

            <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>"
                 width="140" height="140" style="object-fit:cover; margin-bottom:10px;">

            <h3><%= p.getProductName() %></h3>

            <p style="font-weight:bold; color:#2563eb; margin-top:5px;">
                ₹ <%= p.getPrice() %>
            </p>

            <p style="margin-top:5px; font-size:14px;">
                <%= p.getDescription() %>
            </p>

            <p style="margin-top:5px;">
                Stock: <b><%= p.getStock() %></b>
            </p>

            <% if (p.getStock() > 0) { %>
                <a class="btn"
                   href="<%=request.getContextPath()%>/addToCart?productId=<%=p.getProductId()%>">
                    Add to Cart
                </a>
            <% } else { %>
                <p style="color:red; font-weight:bold; margin-top:8px;">Out of Stock</p>
                <button class="btn" disabled>
                    Unavailable
                </button>
            <% } %>

        </div>
    <%
            }
        } else {
    %>
        <p style="text-align:center; margin-top:20px;">No products available.</p>
    <%
        }
    %>

    </div>
</div>

</body>
</html>

