<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.Shop" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Shop - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<%
    Shop s = (Shop) request.getAttribute("shop");
    if (s == null) {
        response.sendRedirect(request.getContextPath() + "/admin/manage-shops");
        return;
    }
%>

<div class="container">

    <h2 style="text-align:center;">Edit Shop</h2>

    <div class="form-box" style="max-width:500px; margin:auto;">

        <form action="<%=request.getContextPath()%>/admin/edit-shop" method="post">

            <input type="hidden" name="id" value="<%=s.getId()%>">

            <label>Shop Name</label>
            <input type="text" name="name" value="<%=s.getName()%>" required>

            <label>Owner Name</label>
            <input type="text" name="owner" value="<%=s.getOwner_name()%>" required>

            <label>Phone</label>
            <input type="tel" name="phone" value="<%=s.getPhone()%>" required>

            <label>Address</label>
            <input type="text" name="address" value="<%=s.getAddress()%>" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Update</button>
            </div>

        </form>

    </div>
</div>

</body>
</html>