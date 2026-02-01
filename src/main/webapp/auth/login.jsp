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

<div class="container">
    <h2 style="text-align:center;">Login</h2>

    <div class="form-box" style="max-width:400px;">

        <form name="loginForm"
              action="<%=request.getContextPath()%>/login"
              method="post"
              onsubmit="return validateLogin()">

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Login</button>
            </div>
        </form>

        <p style="color:red; text-align:center; margin-top:10px;">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </p>

        <p style="margin-top:15px; text-align:center;">
            Don’t have an account?
            <a href="<%=request.getContextPath()%>/auth/register.jsp">Register here</a>
        </p>
    </div>
</div>

</body>
</html>

