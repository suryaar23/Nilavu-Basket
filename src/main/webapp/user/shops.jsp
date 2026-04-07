x<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.nilavu.model.Shop" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Shops - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<%
	List<Shop> shops = (List<Shop>) request.getAttribute("shops");

	for (Shop s : shops) {
%>
    <a href="<%=request.getContextPath()%>/products?shopId=<%=s.getId()%>">
        <%= s.getName() %>
    </a><br>
<%
}
%>
</body>
</html>