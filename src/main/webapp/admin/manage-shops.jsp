<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.nilavu.model.Shop" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Shops - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Manage Shops</h2>

    <div style="text-align:right; margin-bottom:15px;">
        <a class="btn" href="<%=request.getContextPath()%>/admin/add-shops.jsp">
            Add New Shop
        </a>
    </div>

    <div class="form-box" style="max-width:1100px;">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Owner</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Status</th>
            </tr>

        <%
            List<Shop> shop = (List<Shop>) request.getAttribute("shops");

            if (shop != null && !shop.isEmpty()) {
                for (Shop s : shop) {
        %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
                <td><%= s.getOwner_name() %></td>
                <td><%= s.getPhone() %></td>
                <td><%= s.getAddress() %></td>
                <td><%= s.getStatus() %></td>


                <%-- Editing --%>
                
                <td>
                    <a class="btn" href="<%=request.getContextPath()%>/admin/edit-shop?id=<%=s.getId()%>">
                        Edit
                    </a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="8" style="text-align:center;">No Shops found.</td>
            </tr>
        <%
            }
        %>

        </table>
    </div>
</div>

</body>
</html>

