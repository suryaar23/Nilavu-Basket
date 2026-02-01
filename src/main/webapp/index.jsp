<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nilavu Basket</title>
</head>
<body>

<%
    // Redirect to login page when app loads
    response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
%>

</body>
</html>
