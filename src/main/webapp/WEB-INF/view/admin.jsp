<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminstyle.css">
</head>
<body>
    <h1>管理儀表板</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/products">產品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/customers">顧客管理</a></li>
            <li><a href="${pageContext.request.contextPath}/orders">訂單管理</a></li>
        </ul>
    </nav>
</body>
</html>
