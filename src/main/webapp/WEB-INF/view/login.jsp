<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
        <!-- 假設你有一個 styles.css 來處理樣式 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>
        <!--導航nav============================================= -->
        <nav class="navbar navbar-expand-md navbar-dark bg-custom-dark fixed-top">
            <div class="container-xl">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
                    aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarMenu">
                    <ul class="navbar-nav ms-auto mb-2 mb-md-0 ps-5 ps-md-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#sec1">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#sec2">商品訂購</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#sec3">購物車</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#sec4">聯絡我們</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5 pt-5">
            <h2>Login</h2>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
                <c:if test="${param.error != null}">
                    <p class="text-danger">Invalid username or password.</p>
                </c:if>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    </body>

    </html>