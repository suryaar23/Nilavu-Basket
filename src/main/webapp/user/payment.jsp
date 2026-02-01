<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("loggedUser") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<h2>Payment</h2>

<form action="<%=request.getContextPath()%>/payment" method="post">
    <!-- For now, we assume last order id is passed via session or query.
         You can improve this later by storing orderId in session -->
    <input type="hidden" name="orderId" value="<%= request.getParameter("orderId") != null ? request.getParameter("orderId") : "1" %>">

    <label>Select Payment Mode:</label><br><br>
    <select name="paymentMode" required>
        <option value="COD">Cash on Delivery</option>
        <option value="UPI">UPI</option>
        <option value="CARD">Debit / Credit Card</option>
    </select>
    <br><br>

    <button type="submit">Confirm Payment</button>
</form>

</body>
</html>
