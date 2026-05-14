<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
        Manage users, shops, agents, and orders.
    </p>

    <h3 style="margin-top:30px; text-align:center;">Admin Actions</h3>

    <div class="card-grid" style="margin-top:20px;">

        <!-- USERS -->
        <div class="card">
            <h3>👥 Users</h3>
            <p>View all registered users.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/viewUsers">View Users</a>
        </div>

        <!-- ORDERS -->
        <div class="card">
            <h3>🧾 Orders</h3>
            <p>View all customer orders.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/viewOrders">View Orders</a>
        </div>

        <!-- SHOPS -->
        <div class="card">
            <h3>🏪 Shops</h3>
            <p>View all registered shops.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/manage-shops">View Shops</a>
        </div>

        <!-- AGENTS -->
        <div class="card">
            <h3>🚚 Agents</h3>
            <p>View all delivery agents.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/manage-agents">View Agents</a>
        </div>

        <!-- PRODUCTS -->
        <div class="card">
            <h3>📦 Products</h3>
            <p>View all products.</p>
            <a class="btn" href="<%=request.getContextPath()%>/admin/products">View Products</a>
        </div>

    </div>
</div>

</body>
</html>