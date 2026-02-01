<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Add New Product</h2>

<form action="<%=request.getContextPath()%>/admin/addProduct" method="post">
    <label>Product Name:</label><br>
    <input type="text" name="productName" required><br><br>

    <label>Price:</label><br>
    <input type="text" name="price" required><br><br>

    <label>Stock:</label><br>
    <input type="text" name="stock" required><br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="3" cols="30"></textarea><br><br>

    <label>Image URL:</label><br>
    <input type="text" name="imageUrl"><br><br>

    <label>Category ID:</label><br>
    <input type="text" name="categoryId" required><br><br>

    <button type="submit">Add Product</button>
</form>

<br>
<a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>

</body>
</html>
