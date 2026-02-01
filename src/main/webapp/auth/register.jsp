<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />

<h2>Register</h2>

<form action="<%=request.getContextPath()%>/register" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <label>Phone:</label><br>
    <input type="text" name="phone" required><br><br>

    <button type="submit">Register</button>
</form>

<p style="color:red;">
    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>

<p>
    Already have an account?
    <a href="<%=request.getContextPath()%>/auth/login.jsp">Login here</a>
</p>

</body>
</html>
