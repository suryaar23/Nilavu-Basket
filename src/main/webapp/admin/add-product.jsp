<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="form-box">
    <h2>Add New Product</h2>

    <form action="<%=request.getContextPath()%>/admin/addProduct" method="post">
        <label>Product Name</label>
        <input type="text" name="productName" required>

        <label>Price</label>
        <input type="text" name="price" required>

        <label>Stock</label>
        <input type="text" name="stock" required>

        <label>Description</label>
        <textarea name="description" rows="3"></textarea>

        <label>Image URL</label>
        <input type="text" name="imageUrl">

        <label>Category ID</label>
        <input type="text" name="categoryId" required>

        <button type="submit">Add Product</button>
    </form>

    <div style="margin-top:15px;">
        <a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
