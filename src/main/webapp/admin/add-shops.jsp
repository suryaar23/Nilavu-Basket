<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Shop - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">

    <h2 style="text-align:center;">Add New Shop</h2>

    <div class="form-box" style="max-width:500px; margin:auto;">

        <form action="<%=request.getContextPath()%>/admin/add-shop" method="post">

            <label>Shop Name</label>
            <input type="text" name="name" placeholder="Enter shop name" required>

            <label>Owner Name</label>
            <input type="text" name="owner" placeholder="Enter owner name" required>

            <label>Phone</label>
            <input type="text" name="phone" placeholder="Enter phone number" required>

            <label>Address</label>
            <input type="text" name="address" placeholder="Enter address" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Add Shop</button>
            </div>

        </form>

    </div>
</div>

</body>
</html>