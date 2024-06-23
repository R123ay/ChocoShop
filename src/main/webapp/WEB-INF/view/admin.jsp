<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            background-color: #343a40;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #ffffff;
        }
        .navbar {
            display: flex;
        }
        .navbar .nav-link {
            color: #ffffff;
            margin-left: 20px;
            font-weight: 600;
        }
        .navbar .nav-link:hover {
            text-decoration: underline;
        }
        .container.admin-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            margin-top: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .admin-title {
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="admin-title">商家後台管理系統</div>
        <nav class="navbar">
            <a class="nav-link" href="<c:url value='/admin/products' />">上架商品管理</a>
            <a class="nav-link" href="<c:url value='/admin/orders' />">訂單管理</a>
            <a class="nav-link" href="<c:url value='/' />">首頁官網</a>
            <a class="nav-link" href="<c:url value='/cart' />">顧客購物車</a>
        </nav>
    </div>
    <div class="container admin-container">
        <!-- 其他管理內容可以在這裡顯示 -->
    </div>
</body>
</html>
