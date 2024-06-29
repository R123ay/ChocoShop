<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="zh-TW">

            <head>
                <meta charset="UTF-8" />
                <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>登入系統</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;700&family=Noto+Sans+TC:wght@400;500;600;700&display=swap"
                    rel="stylesheet">
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

                    .login-container {
                        background-color: #fff;
                        padding: 2rem;
                        border-radius: 10px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        max-width: 400px;
                        width: 100%;
                    }

                    .login-title {
                        font-weight: 700;
                        margin-bottom: 1.5rem;
                        text-align: center;
                    }

                    .form-label {
                        font-weight: 500;
                    }

                    .btn-primary {
                        width: 100%;
                        padding: 0.75rem;
                        font-weight: 600;
                    }

                    .link-container {
                        margin-top: 1rem;
                        text-align: center;
                    }
                </style>
            </head>

            <body>
                <div class="login-container">
                    <h1 class="login-title">登入系統</h1>
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
                        <button type="submit" class="btn btn-primary">登入</button>
                        <div class="link-container">
                            <a href="${pageContext.request.contextPath}/register" class="btn btn-link">註冊</a>
                            <a href="${pageContext.request.contextPath}/forgot-password" class="btn btn-link">忘記密碼</a>
                        </div>
                        <div class="link-container">
                            <a href="${pageContext.request.contextPath}/" class="btn btn-link">回到官網</a>
                        </div>
                    </form>
                </div>
            </body>

            </html>