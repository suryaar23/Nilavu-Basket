<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>Manage Products</h2>

    <a class="btn" href="<%=request.getContextPath()%>/admin/add-product.jsp">
        ➕ Add New Product
    </a>

    <table>
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Price (₹)</th>
            <th>Stock</th>
            <th>Description</th>
            <th>Add Stock</th>
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
                <img src="<%=request.getContextPath()+"/"+p.getImageUrl()%>" width="60">
            </td>

            <td><%= p.getProductName() %></td>
            <td><%= p.getPrice() %></td>
            <td><%= p.getStock() %></td>
            <td><%= p.getDescription() %></td>

            <!-- ADD STOCK -->
            <td>
                <form action="<%=request.getContextPath()%>/admin/addStock" method="post">
                    <input type="hidden" name="productId" value="<%=p.getProductId()%>">
                    <input type="number" name="quantity" min="1" required>
                    <button class="btn" type="submit">Add</button>
                </form>
            </td>

            <!-- ACTION -->
            <td>
                <a class="btn" href="<%=request.getContextPath()%>/admin/editProduct?id=<%=p.getProductId()%>">
                    Edit
                </a>
            </td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="8">No products found.</td>
        </tr>
    <%
        }
    %>

    </table>
</div>

</body>
</html>

