<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.nilavu.model.Product" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Update Product</h2>

<%
    Product product = (Product) request.getAttribute("product");
%>

<form action="<%=request.getContextPath()%>/admin/updateProduct" method="post" class="form-box">

    <!-- Hidden Product ID -->
    <input type="hidden" name="productId"
           value="<%= product != null ? product.getProductId() : "" %>">

    <label>Product Name:</label>
    <input type="text" name="productName"
           value="<%= product != null ? product.getProductName() : "" %>" required>

    <label>Price:</label>
    <input type="number" step="0.01" name="price"
           value="<%= product != null ? product.getPrice() : "" %>" required>

    <label>Stock:</label>
    <input type="number" name="stock"
           value="<%= product != null ? product.getStock() : "" %>" required>

    <label>Description:</label>
    <textarea name="description" rows="3"><%= product != null ? product.getDescription() : "" %></textarea>

    <label>Image URL:</label>
    <input type="text" name="imageUrl"
           value="<%= product != null ? product.getImageUrl() : "" %>">

    <label>Category ID:</label>
    <input type="number" name="categoryId"
           value="<%= product != null ? product.getCategoryId() : "" %>" required>

    <button type="submit" class="btn">Update Product</button>
</form>

<br>
<a href="<%=request.getContextPath()%>/admin/products">⬅ Back to Products</a>

<jsp:include page="../common/footer.jsp" />

</body>
</html>

