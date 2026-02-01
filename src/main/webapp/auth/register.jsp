<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Register</h2>

    <div class="form-box" style="max-width:450px;">

        <form name="registerForm"
              action="<%=request.getContextPath()%>/register"
              method="post"
              onsubmit="return validateRegister()">

            <label>Name</label>
            <input type="text" name="name" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <label>Phone</label>
            <input type="text" name="phone" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Register</button>
            </div>
        </form>

        <p style="color:red; text-align:center; margin-top:10px;">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </p>

        <p style="margin-top:15px; text-align:center;">
            Already have an account?
            <a href="<%=request.getContextPath()%>/auth/login.jsp">Login here</a>
        </p>
    </div>
</div>

</body>
</html>
