<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Agent" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agents - Admin</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Delivery Agents</h2>

    <div class="form-box" style="max-width:900px;">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

        <%
            List<Agent> agents = (List<Agent>) request.getAttribute("agents");

            if (agents != null && !agents.isEmpty()) {
                for (Agent a : agents) {
        %>

            <tr>
                <td><%= a.getAgent_id() %></td>
                <td><%= a.getName() %></td>
                <td><%= a.getPhone() %></td>
                <td><%= a.getStatus() %></td>

                <!-- ADMIN CONTROL -->
                <td>
                    <a class="btn" href="<%=request.getContextPath()%>/admin/delete-agent?id=<%=a.getAgent_id()%>">
                        Remove
                    </a>
                </td>
            </tr>

        <%
                }
            } else {
        %>

            <tr>
                <td colspan="5" style="text-align:center;">No agents found.</td>
            </tr>

        <%
            }
        %>

        </table>
    </div>

    <div style="text-align:center; margin-top:15px;">
        <a href="<%=request.getContextPath()%>/admin/admin-dashboard">Back to Dashboard</a>
    </div>

</div>

</body>
</html>