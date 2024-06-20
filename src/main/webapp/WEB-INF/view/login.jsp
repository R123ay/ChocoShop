<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登入系統</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <style>
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-form {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="login-form">
            <a href="${pageContext.request.contextPath}/" class="btn btn-link mb-3">回到官網</a>
            <h1 class="mb-4 text-center">登入系統</h1>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">帳號</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">密碼</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <c:if test="${not empty success}">
                    <div class="alert alert-success">${success}</div>
                </c:if>
                <button type="submit" class="btn btn-primary w-100">登入</button>
                <div class="mt-2 d-flex justify-content-between">
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-link">註冊</a>
                    <a href="${pageContext.request.contextPath}/forgot-password" class="btn btn-link">忘記密碼</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
