<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.Address" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Address - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Delivery Address</h2>

    <%
        Address address = (Address) request.getAttribute("address");
    %>

    <div class="form-box" style="max-width:500px;">
        <form action="<%=request.getContextPath()%>/address" method="post">

            <label>Street</label>
            <input type="text" name="street"
                   value="<%= address != null ? address.getStreet() : "" %>" required>

            <label>City</label>
            <input type="text" name="city"
                   value="<%= address != null ? address.getCity() : "" %>" required>

            <label>State</label>
            <input type="text" name="state"
                   value="<%= address != null ? address.getState() : "" %>" required>

            <label>Pincode</label>
            <input type="text" name="pincode"
                   value="<%= address != null ? address.getPincode() : "" %>" required>

            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">Save Address</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
