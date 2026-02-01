<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.User, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Admin Dashboard</h2>

<h3>Admin Actions</h3>
<ul>
	<li><a href="<%=request.getContextPath()%>/admin/products">Manage Products</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/add-product.jsp">Add Product</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/add-category.jsp">Add Category</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/viewOrders">View All Orders</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/viewUsers">View All Users</a></li>
</ul>

<hr>

</body>
</html>
