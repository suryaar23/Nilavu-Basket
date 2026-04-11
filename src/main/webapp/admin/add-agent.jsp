<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Agent - Nilavu Basket</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">

    <h2 style="text-align:center;">Add Agent</h2>

    <div class="form-box" style="max-width:400px; margin:auto;">

        <form action="<%=request.getContextPath()%>/admin/add-agent" method="post">

            <label>Name</label>
            <input type="text" name="name" placeholder="Enter agent name" required>

            <label>Phone</label>
            <input type="tel" name="phone" placeholder="Enter phone number" pattern="[0-9]{10}" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Add Agent</button>
            </div>

        </form>

    </div>
</div>

</body>
</html>