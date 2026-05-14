<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);

    java.util.ResourceBundle bundle =
        java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

<%
    // Session validation
    if (session == null || session.getAttribute("loggedUser") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }

    // Order ID validation
    Object orderIdObj = session.getAttribute("lastOrderId");
    if (orderIdObj == null) {
        response.sendRedirect(request.getContextPath() + "/user/orders");
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

<div class="container">

    <h2 style="text-align:center;"><%= bundle.getString("payment") %></h2>

    <div class="form-box" style="max-width:500px; margin:auto;">

        <form action="<%=request.getContextPath()%>/payment" method="post">

            
            <input type="hidden" name="orderId" value="<%= orderIdObj %>">

            
            <label><%= bundle.getString("select_payment") %></label>

            <select name="paymentMode" required>
                <option value="COD"><%= bundle.getString("cod") %></option>
            </select>

            
            <div style="text-align:center; margin-top:15px;">
                <button type="submit" class="btn">
                    <%= bundle.getString("confirm_payment") %>
                </button>
            </div>

        </form>

    </div>
</div>

</body>
</html>