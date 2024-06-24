<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商家後台管理</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #1c0a01;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            background-color: #1c0a01;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #ffa140;
        }
        .logo-container {
            display: flex;
            align-items: center;
        }
        .logo-container img {
            max-width: 180px; /* 設定圖片最大寬度 */
            margin-right: 10px; /* 文字和圖片之間的間距 */
        }
        .admin-title {
	        font-size: 24px; /* 修改這裡來改變標題的大小 */
	        font-weight: 700;
	        text-align: center;
	        flex: 1; /* 增加這一行，使標題在可用空間內置中 */
        }
        .navbar {
            display: flex;
        }
        .navbar .nav-link {
            color: #ffa140; /* 設置文字顏色 */
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .navbar .nav-link:hover {
            color: #ffa140; /* 設置文字顏色 */
            font-weight: bold;
            text-decoration: underline; /* 滑鼠懸浮時加底線 */
        }
        .navbar .nav-link:focus {
            color: #ffc107; /* 按鈕被選中時顏色 */
            font-weight: bold;
            outline: none; /* 移除按鈕被選中時的外框 */
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
        .content {
            margin-top: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/static/img/logo2.png" alt="品牌圖示">
            <div class="admin-title">商家後台管理系統</div>
        </div>
        <nav class="navbar">
            <a class="nav-link" href="<c:url value='/products' />">商品上架</a>
            <a class="nav-link" href="<c:url value='/admin/orders' />">客戶訂單</a>
            <a class="nav-link" href="<c:url value='/' />">首頁官網</a>
            <a class="nav-link" href="<c:url value='/cart' />">顧客端-購物車</a>
        </nav>
    </div>
    <div class="container admin-container">
        <div class="content">
            <!-- 其他管理內容可以在這裡顯示 -->
        </div>
    </div>
</body>
</html>