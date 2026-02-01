<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Category - Nilavu Basket</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Add New Category</h2>

<form action="<%=request.getContextPath()%>/admin/addCategory" method="post">
    <label>Category Name:</label><br>
    <input type="text" name="categoryName" required><br><br>

    <button type="submit">Add Category</button>
</form>

<br>
<a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>

</body>
</html>
