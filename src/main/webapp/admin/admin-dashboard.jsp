<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.User, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Admin Dashboard</h2>
    <p style="text-align:center; margin-top:5px;">
        Manage products, categories, users, and orders from one place.
    </p>

    <h3 style="margin-top:30px; text-align:center;">Admin Actions</h3>

    <div class="card-grid" style="margin-top:20px;">

        <div class="card">
            <h3>📦 Products</h3>
            <p style="margin-top:8px;">View and manage all products.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/products">Manage Products</a>
        </div>

        <div class="card">
            <h3>➕ Add Product</h3>
            <p style="margin-top:8px;">Add new items to the catalog.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/add-product.jsp">Add Product</a>
        </div>

        <div class="card">
            <h3>🗂 Categories</h3>
            <p style="margin-top:8px;">Create and manage product categories.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/add-category.jsp">Add Category</a>
        </div>

        <div class="card">
            <h3>🧾 Orders</h3>
            <p style="margin-top:8px;">View all customer orders.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/viewOrders">View Orders</a>
        </div>

        <div class="card">
            <h3>👥 Users</h3>
            <p style="margin-top:8px;">View registered users.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/viewUsers">View Users</a>
        </div>

    </div>
</div>

</body>
</html>

