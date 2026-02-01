<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error - Nilavu Basket</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<jsp:include page="common/navbar.jsp" />
<jsp:include page="common/header.jsp" />

<div class="container">
    <div class="form-box" style="max-width:450px; text-align:center;">
        <h2>Something went wrong</h2>
        <p style="margin-top:10px;">
            Please try again later or go back to the home page.
        </p>

        <div style="margin-top:20px;">
            <a class="btn" href="<%= request.getContextPath() %>/index.jsp">
                Go Home
            </a>
        </div>
    </div>
</div>

</body>
</html>
