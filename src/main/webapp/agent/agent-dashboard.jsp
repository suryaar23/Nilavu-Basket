<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agent Dashboard - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Agent Dashboard</h2>
    <p style="text-align:center; margin-top:5px;">
        Manage your assigned deliveries and track progress.
    </p>

    <h3 style="margin-top:30px; text-align:center;">Agent Actions</h3>

    <div class="card-grid" style="margin-top:20px;">

        <!-- 📦 ASSIGNED ORDERS -->
        <div class="card">
            <h3>📦 Assigned Orders</h3>
            <p style="margin-top:8px;">View orders assigned to you.</p>
            <a class="btn" href="<%=request.getContextPath()%>/agent/orders">View Orders</a>
        </div>

        <!-- 🚚 ACTIVE DELIVERY -->
        <div class="card">
            <h3>🚚 Active Deliveries</h3>
            <p style="margin-top:8px;">Orders currently out for delivery.</p>
            <a class="btn" href="<%=request.getContextPath()%>/agent/orders?filter=active">View Active</a>
        </div>

        <!-- 📜 DELIVERY HISTORY -->
        <div class="card">
            <h3>📜 Delivery History</h3>
            <p style="margin-top:8px;">Completed deliveries.</p>
            <a class="btn" href="<%=request.getContextPath()%>/agent/orders?filter=completed">View History</a>
        </div>

    </div>
</div>

</body>
</html>