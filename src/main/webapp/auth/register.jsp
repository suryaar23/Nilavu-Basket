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

<div class="form-box">
    <h2>Register</h2>

    <!-- Added: name and onsubmit for JS validation -->
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

        <button type="submit">Register</button>
    </form>

    <p style="color:red; margin-top:10px;">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </p>

    <p style="margin-top:15px;">
        Already have an account?
        <a href="<%=request.getContextPath()%>/auth/login.jsp">Login here</a>
    </p>
</div>

</body>
</html>
