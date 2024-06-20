<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .admin-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }
        .admin-title {
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .nav-link {
            font-weight: 600;
            color: #007bff;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container admin-container">
        <h1 class="admin-title">商家後台管理系統</h1>
        <nav class="nav justify-content-center">
            <a class="nav-link" href="${pageContext.request.contextPath}/products">上架商品管理</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/customers">顧客資料管理</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/orders">訂單管理</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/">首頁</a>
			<a class="nav-link" href="${pageContext.request.contextPath}/cart">顧客購物車</a>
        </nav>
        <div class="content mt-4">
            <!-- 在這裡顯示具體的管理內容，例如商品列表、顧客資料、訂單等 -->
        </div>
    </div>
</body>
</html>
