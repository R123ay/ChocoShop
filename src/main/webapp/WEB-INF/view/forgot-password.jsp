<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>忘記密碼</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <style>
        .forgot-password-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .forgot-password-form {
            width: 100%;
            max-width: 500px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        function redirectToLogin() {
            setTimeout(function() {
                window.location.href = "${pageContext.request.contextPath}/login";
            }, 5000);
        }
    </script>
</head>
<body>
    <div class="container forgot-password-container">
        <div class="forgot-password-form">
            <h1 class="mb-4 text-center">忘記密碼</h1>
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
                <script>
                    redirectToLogin();
                </script>
            </c:if>
            <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">帳號</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">手機號碼</label>
                    <input type="text" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">電子郵件</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="newPassword" class="form-label">新密碼</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <button type="submit" class="btn btn-primary w-100">重設密碼</button>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-link mt-3 w-100 text-center">回到登入頁</a>
            </form>
        </div>
    </div>
</body>
</html>
