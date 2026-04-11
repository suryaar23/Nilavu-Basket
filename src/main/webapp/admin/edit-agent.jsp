<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.Agent" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Agent - Nilavu Basket</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<%
Agent a = (Agent) request.getAttribute("agent");
if (a == null) {
    response.sendRedirect(request.getContextPath() + "/admin/manage-agents");
    return;
}
%>

<div class="container">

    <h2 style="text-align:center;">Edit Agent</h2>

    <div class="form-box" style="max-width:400px; margin:auto;">

        <form action="<%=request.getContextPath()%>/admin/edit-agent" method="post">

            <input type="hidden" name="id" value="<%=a.getAgent_id()%>">

            <label>Name</label>
            <input type="text" name="name" value="<%=a.getName()%>" required>

            <label>Phone</label>
            <input type="tel" name="phone" value="<%=a.getPhone()%>" pattern="[0-9]{10}" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Update</button>
            </div>

        </form>

    </div>
</div>

</body>
</html>