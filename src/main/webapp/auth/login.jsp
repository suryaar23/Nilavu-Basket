<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Nilavu Basket</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />

<h2>Login</h2>

<form action="<%=request.getContextPath()%>/login" method="post">
    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <button type="submit">Login</button>
</form>

<p style="color:red;">
    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
</p>

<p>
    Don’t have an account?
    <a href="<%=request.getContextPath()%>/auth/register.jsp" style >Register here</a>
</p>

</body>
</html>
