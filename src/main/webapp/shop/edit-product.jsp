<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ page import="com.nilavu.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product - Nilavu Basket</title>
</head>
<body>
<%
Product p = (Product) request.getAttribute("product");
%>

<h2>Edit Product</h2>
<form action="<%=request.getContextPath()%>/shop/update-product" method="post">

    <input type="hidden" name="productId" value="<%=p.getProductId()%>">

    Name: <input type="text" name="productName" value="<%=p.getProductName()%>"><br>
    Price: <input type="number" name="price" value="<%=p.getPrice()%>"><br>
    Stock: <input type="number" name="stock" value="<%=p.getStock()%>"><br>
    Description: <input type="text" name="description" value="<%=p.getDescription()%>"><br>

    <button type="submit">Update</button>
</form>
</body>
</html>