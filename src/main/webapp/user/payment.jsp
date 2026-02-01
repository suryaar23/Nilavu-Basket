<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("loggedUser") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2>Payment</h2>

    <div class="form-box">
        <form action="<%=request.getContextPath()%>/payment" method="post">

            <!-- Hidden Order ID -->
            <input type="hidden" name="orderId"
                   value="<%= request.getParameter("orderId") != null ? request.getParameter("orderId") : "1" %>">

            <label>Select Payment Mode</label>
            <select name="paymentMode" required>
                <option value="COD">Cash on Delivery</option>
                <option value="UPI">UPI</option>
                <option value="CARD">Debit / Credit Card</option>
            </select>

            <button type="submit" class="btn">Confirm Payment</button>
        </form>
    </div>
</div>

</body>
</html>
