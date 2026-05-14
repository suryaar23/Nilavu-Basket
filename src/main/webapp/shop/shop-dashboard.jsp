<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shop Dashboard - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Shop Dashboard</h2>
    <p style="text-align:center; margin-top:5px;">
        Manage your products and track orders from one place.
    </p>

    <h3 style="margin-top:30px; text-align:center;">Shop Actions</h3>

    <div class="card-grid" style="margin-top:20px;">

        <!--  PRODUCTS -->
        <div class="card">
            <h3>📦 My Products</h3>
            <p style="margin-top:8px;">View and manage your products.</p>
            <a class="btn" href="<%=request.getContextPath()%>/shop/products">Manage Products</a>
        </div>

        <!--  ADD PRODUCT -->
        <div class="card">
            <h3>➕ Add Product</h3>
            <p style="margin-top:8px;">Add new items to your shop.</p>
            <a class="btn" href="<%=request.getContextPath()%>/shop/add-product">Add Product</a>
        </div>

        <!--  CURRENT ORDERS -->
        <div class="card">
            <h3>🟢 Current Orders</h3>
            <p style="margin-top:8px;">View active and pending orders.</p>
            <a class="btn" href="<%=request.getContextPath()%>/shop/orders">View Orders</a>
        </div>

        <!--  ORDER HISTORY -->
        <div class="card">
            <h3>🟡 Order History</h3>
            <p style="margin-top:8px;">View completed deliveries.</p>
            <a class="btn" href="<%=request.getContextPath()%>/shop/orders?filter=completed">View History</a>
        </div>

    </div>
</div>

</body>
</html>