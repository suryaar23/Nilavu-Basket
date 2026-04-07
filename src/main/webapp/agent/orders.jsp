<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Order" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agent - Delivery</title>
</head>

<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">
    <h2 style="text-align:center;">Assigned Orders</h2>

    <div class="form-box" style="max-width:900px;">
        <table border="1" width="100%" cellpadding="10">
            
            <!-- TABLE HEADER -->
            <tr>
                <th>Order ID</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <%
                List<Order> orders = (List<Order>) request.getAttribute("orders");

                if (orders != null && !orders.isEmpty()) {
                    for (Order o : orders) {
            %>

            <tr>
                <td><%= o.getOrderId() %></td>
                <td><%= o.getStatus() %></td>

                <td>
                    <% if ("ASSIGNED".equals(o.getStatus())) { %>
                        <a href="<%=request.getContextPath()%>/agent/start-delivery?orderId=<%=o.getOrderId()%>">
                            Start Delivery
                        </a>
                    <% } else if ("OUT FOR DELIVERY".equals(o.getStatus())) { %>
                        <a href="<%=request.getContextPath()%>/agent/complete-delivery?orderId=<%=o.getOrderId()%>">
                            Delivered
                        </a>
                    <% } else { %>
                        -
                    <% } %>
                </td>
            </tr>

            <%
                    }
                } else {
            %>

            <tr>
                <td colspan="3" style="text-align:center;">No orders assigned</td>
            </tr>

            <%
                }
            %>

        </table>
    </div>
</div>

</body>
</html>