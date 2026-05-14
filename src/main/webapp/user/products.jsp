<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nilavu.model.Product, com.nilavu.model.Category" %>

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
    <title>Products - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>

<jsp:include page="../common/navbar.jsp" />
<jsp:include page="../common/header.jsp" />

<div class="container">

    <!--  Dynamic Heading -->
    <%
        String shopId = request.getParameter("shopId");
        String keyword = request.getParameter("keyword");
    %>

    <h2 style="text-align:center;">
        <%
            if (keyword != null && !keyword.isEmpty()) {
        %>
            <%= bundle.getString("search_results") %>
        <%
            } else if (shopId != null && !shopId.isEmpty()) {	
        %>
            <%= bundle.getString("shop_products") %>
        <%
            } else {
        %>
            <%= bundle.getString("all_products") %>
        <%
            }
        %>
    </h2>

    <!--  ERROR MESSAGE -->
    <%
        String error = request.getParameter("error");
        if ("limitreached".equals(error)) {
    %>
        <div style="color:red; text-align:center; font-weight:bold; margin:15px 0;">
            <%= bundle.getString("stock_limit") %>
        </div>
    <%
        }
    %>

    <!--  SEARCH-->
    <form method="get" action="<%=request.getContextPath()%>/products"
          style="display:flex; gap:10px; justify-content:center; margin-bottom:20px;">

        <input type="text" name="keyword"
               placeholder="<%= bundle.getString("search_products") %>"
               value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">

        <select name="categoryId">
            <option value=""><%= bundle.getString("all_categories") %></option>

            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");

                if (categories != null) {
                    for (Category c : categories) {
            %>

            <option value="<%=c.getCategoryId()%>"
                <%= String.valueOf(c.getCategoryId())
                    .equals(request.getParameter("categoryId")) ? "selected" : "" %>>

                <%=c.getCategoryName()%>

            </option>

            <%
                    }
                }
            %>
        </select>

        <button class="btn" type="submit"><%= bundle.getString("search") %></button>
    </form>

    <!--  PRODUCTS -->
    <div class="card-grid" style="margin-top:20px;">

    <%
        List<Product> products = (List<Product>) request.getAttribute("products");

        if (products != null && !products.isEmpty()) {
            for (Product p : products) {
    %>

        <div class="card" style="text-align:center; padding:15px;">

            <!-- IMAGE -->
            <img src="<%= request.getContextPath() + "/" + p.getImageUrl() %>"
                 width="140" height="140"
                 style="object-fit:cover; margin-bottom:10px;">

            <!-- NAME -->
            <h3><%= p.getProductName() %></h3>

            <!-- PRICE -->
            <p style="font-weight:bold; color:#2563eb; margin-top:5px;">
                ₹ <%= p.getPrice() %>
            </p>

            <!-- DESCRIPTION -->
            <p style="margin-top:5px; font-size:14px;">
                <%= p.getDescription() %>
            </p>

            <!-- STOCK -->
            <p style="margin-top:5px; color:<%= p.getStock() > 5 ? "green" : "orange" %>;">
                <%= bundle.getString("stock") %>: <b><%= p.getStock() %></b>
            </p>

            <!-- ACTION -->
             <% if (p.getStock() > 0) { %>
                <a class="btn"
   				   href="<%=request.getContextPath()%>/addToCart?productId=<%=p.getProductId()%>&keyword=<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>&categoryId=<%=request.getParameter("categoryId") != null ? request.getParameter("categoryId") : ""%>&shopId=<%=request.getParameter("shopId") != null ? request.getParameter("shopId") : ""%>">
    				<%= bundle.getString("add_to_cart") %>
				</a>
            <% } else { %>

                <p style="color:red; font-weight:bold; margin-top:8px;">
                    <%= bundle.getString("out_of_stock") %>
                </p>

                <button class="btn" disabled>
                    <%= bundle.getString("unavailable") %>
                </button>

            <% } %>

        </div>

    <%
            }
        } else {
    %>

        <p style="text-align:center; margin-top:20px;">
            <%= bundle.getString("no_products") %>
        </p>

    <%
        }
    %>

    </div>
</div>

</body>
</html>
