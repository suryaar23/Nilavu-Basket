<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.nilavu.model.Address, java.util.*"%>

<%
    String lang = (String) session.getAttribute("lang");
    if (lang == null) lang = "en";

    java.util.Locale locale = new java.util.Locale(lang);

    java.util.ResourceBundle bundle =
        java.util.ResourceBundle.getBundle("i18n.messages", locale);
%>

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


<%
    List<Address> addresses = (List<Address>) request.getAttribute("address");
%>

<div class="container">

    <h2 style="text-align:center;"><%= bundle.getString("delivery_address") %></h2>

    <!--  EXISTING ADDRESSES -->
    <div class="form-box" style="max-width:600px; margin-bottom:20px;">

        <h3>Your Addresses</h3>

        <%
            if (addresses != null && !addresses.isEmpty()) {
                for (Address a : addresses) {
        %>

        <div style="border:1px solid #ddd; padding:10px; margin:10px 0; border-radius:8px;">
            <p>
                <%= a.getStreet() %>, 
                <%= a.getCity() %>, 
                <%= a.getState() %> - 
                <%= a.getPincode() %>
            </p>
        </div>

        <%
                }
            } else {
        %>

        <p>No addresses found</p>

        <%
            }
        %>

    </div>

    <!-- ADD NEW ADDRESS -->
    <div class="form-box" style="max-width:500px;">
        <h3>Add New Address</h3>

        <form action="<%=request.getContextPath()%>/address" method="post">

            <label><%= bundle.getString("street") %></label>
            <input type="text" name="street" required>

            <label><%= bundle.getString("city") %></label>
            <input type="text" name="city" required>

            <label><%= bundle.getString("state") %></label>
            <input type="text" name="state" required>

            <label><%= bundle.getString("pincode") %></label>
            <input type="text" name="pincode" required>

            <div style="text-align:center; margin-top:15px;">
                <button class="btn">
                    <%= bundle.getString("save_address") %>
                </button>
            </div>

        </form>
    </div>

</div>

</body>
</html>
