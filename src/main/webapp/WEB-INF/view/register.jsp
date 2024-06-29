<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html lang="zh-TW">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>註冊</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
                <style>
                    body {
                        font-family: 'Noto Sans TC', sans-serif;
                        background-color: #f8f9fa;
                        display: flex;
                        justify-content: center;
                        align-items: flex-start;
                        height: 100vh;
                        padding-top: 20px;
                        /* 確保上方有空白距離 */
                    }

                    .register-container {
                        background-color: #fff;
                        padding: 2rem;
                        border-radius: 10px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        max-width: 500px;
                        width: 100%;
                    }

                    .register-title {
                        font-weight: 700;
                        margin-bottom: 1.5rem;
                        text-align: center;
                    }

                    .form-label {
                        font-weight: 500;
                    }

                    .form-text {
                        color: red;
                        display: none;
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
                    function validateForm() {
                        var password = document.getElementById("password").value;
                        var phone = document.getElementById("phone").value;
                        var error = "";

                        if (password.length < 6) {
                            error = "密碼必須至少包含 6 位數字或字母";
                            document.getElementById("passwordHelp").style.display = 'block';
                        } else {
                            document.getElementById("passwordHelp").style.display = 'none';
                        }

                        if (phone.length !== 10) {
                            error = "電話號碼必須為 10 位";
                            document.getElementById("phoneHelp").style.display = 'block';
                        } else {
                            document.getElementById("phoneHelp").style.display = 'none';
                        }

                        if (error) {
                            return false;
                        }
                        return true;
                    }

                    function checkPassword() {
                        var password = document.getElementById("password").value;
                        if (password.length < 6) {
                            document.getElementById("passwordHelp").style.display = 'block';
                        } else {
                            document.getElementById("passwordHelp").style.display = 'none';
                        }
                    }

                    function checkPhone() {
                        var phone = document.getElementById("phone").value;
                        if (phone.length !== 10) {
                            document.getElementById("phoneHelp").style.display = 'block';
                        } else {
                            document.getElementById("phoneHelp").style.display = 'none';
                        }
                    }

                    function redirectToLogin() {
                        setTimeout(function () {
                            window.location.href = "${pageContext.request.contextPath}/login";
                        }, 5000);
                    }
                </script>
            </head>

            <body>
                <div class="container register-container">
                    <div class="register-form">
                        <h1 class="register-title">註冊</h1>
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">${success}</div>
                            <script>
                                redirectToLogin();
                            </script>
                        </c:if>
                        <form action="${pageContext.request.contextPath}/register" method="post"
                            onsubmit="return validateForm()">
                            <div class="mb-3">
                                <label for="username" class="form-label">帳號</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">密碼</label>
                                <input type="password" class="form-control" id="password" name="password" required
                                    oninput="checkPassword()">
                                <div id="passwordHelp" class="form-text">密碼必須至少包含 6 位數字或字母</div>
                            </div>
                            <div class="mb-3">
                                <label for="name" class="form-label">姓名</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">電子郵件</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">手機號碼</label>
                                <input type="text" class="form-control" id="phone" name="phone" required
                                    oninput="checkPhone()">
                                <div id="phoneHelp" class="form-text">電話號碼必須為 10 位</div>
                            </div>
                            <div class="mb-3">
                                <label for="birthday" class="form-label">生日</label>
                                <input type="date" class="form-control" id="birthday" name="birthday" required>
                            </div>
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger">${error}</div>
                            </c:if>
                            <button type="submit" class="btn btn-primary">註冊</button>
                            <div class="link-container">
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-link">已經有帳號？立即登入</a>
                            </div>
                        </form>
                    </div>
                </div>
            </body>

            </html>