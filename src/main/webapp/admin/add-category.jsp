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

<div class="container">
    <h2 style="text-align:center;">Add New Category</h2>

    <div class="form-box" style="max-width:400px;">
        <form action="<%=request.getContextPath()%>/admin/addCategory" method="post">
            <label>Category Name</label>
            <input type="text" name="categoryName" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Add Category</button>
            </div>
        </form>

        <div style="text-align:center; margin-top:15px;">
            <a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>
        </div>
    </div>
</div>

</body>
</html>

