<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Category - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="form-box">
    <h2>Add New Category</h2>

    <form action="<%=request.getContextPath()%>/admin/addCategory" method="post">
        <label>Category Name</label>
        <input type="text" name="categoryName" required>

        <button type="submit">Add Category</button>
    </form>

    <div style="margin-top:15px;">
        <a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>
    </div>
</div>

</body>
</html>

