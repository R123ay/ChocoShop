<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <h1>商家後台管理系統</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/products">上架商品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/customers">顧客資料管理</a></li>
            <li><a href="${pageContext.request.contextPath}/orders">訂單管理</a></li>
        </ul>
    </nav>
</body>
</html>
