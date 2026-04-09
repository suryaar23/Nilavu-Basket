<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Products - Admin</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">All Products (Read Only)</h2>

    <div class="form-box" style="max-width:1100px;">
        <table>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Name</th>
                <th>Price (₹)</th>
                <th>Stock</th>
                <th>Description</th>
                <th>Shop ID</th>
                <th>Action</th>
            </tr>

        <%
            List<Product> products = (List<Product>) request.getAttribute("products");

            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>
            <tr>
                <td><%= p.getProductId() %></td>

                <td>
                    <img src="<%=request.getContextPath()+"/"+p.getImageUrl()%>" width="60" height="60">
                </td>

                <td><%= p.getProductName() %></td>
                <td>₹ <%= p.getPrice() %></td>
                <td><%= p.getStock() %></td>
                <td><%= p.getDescription() %></td>
                <td><%= p.getShop_id() %></td>

                <!-- ADMIN CONTROL -->
                <td>
                    <a class="btn" href="<%=request.getContextPath()%>/admin/deleteProduct?id=<%=p.getProductId()%>">
                        Remove
                    </a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="8" style="text-align:center;">No products found.</td>
            </tr>
        <%
            }
        %>

        </table>
    </div>
</div>

</body>
</html>
