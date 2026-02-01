<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="form-box">
    <h2>Login</h2>

    <!-- Added: name and onsubmit for JS validation -->
    <form name="loginForm"
          action="<%=request.getContextPath()%>/login"
          method="post"
          onsubmit="return validateLogin()">

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>
    </form>

    <p style="color:red; margin-top:10px;">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </p>

    <p style="margin-top:15px;">
        Don’t have an account?
        <a href="<%=request.getContextPath()%>/auth/register.jsp">Register here</a>
    </p>
</div>

</body>
</html>
