<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Users - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>All Users</h2>

    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>

    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
            for (User u : users) {
    %>
        <tr>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getPhone() %></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="3">No users found.</td>
        </tr>
    <%
        }
    %>

    </table>

    <div style="margin-top:15px;">
        <a href="<%=request.getContextPath()%>/admin/dashboard">Back to Dashboard</a>
    </div>
</div>

</body>
</html>


