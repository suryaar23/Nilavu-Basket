<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Error</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

    <div class="form-box">
        <h2>Something went wrong</h2>
        <p>Please try again later.</p>
        <a href="<%= request.getContextPath() %>/index.jsp">
            <button>Go Home</button>
        </a>
    </div>

</body>
</html>

