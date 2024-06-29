<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="zh-TW">

            <head>
                <meta charset="UTF-8" />
                <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>忘記密碼</title>
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

                    .forgot-password-container {
                        background-color: #fff;
                        padding: 2rem;
                        border-radius: 10px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        max-width: 500px;
                        width: 100%;
                    }

                    .forgot-password-title {
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
                <script>
                    function redirectToLogin() {
                        setTimeout(function () {
                            window.location.href = "${pageContext.request.contextPath}/login";
                        }, 5000);
                    }
                </script>
            </head>

            <body>
                <div class="forgot-password-container">
                    <h1 class="forgot-password-title">忘記密碼</h1>
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
                            <div class="form-text">密碼必須至少包含 6 位數字或字母</div>
                        </div>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        <button type="submit" class="btn btn-primary">重設密碼</button>
                        <div class="link-container">
                            <a href="${pageContext.request.contextPath}/login" class="btn btn-link">回到登入頁</a>
                        </div>
                    </form>
                </div>
            </body>

            </html>