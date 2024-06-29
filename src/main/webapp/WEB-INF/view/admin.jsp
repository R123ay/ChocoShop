<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="zh-TW">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>商品管理系統</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    </head>

    <body data-bs-spy="scroll" data-bs-target="#navbarMenu" data-bs-offset="200">
        <!--頁首header============================================= -->
        <header class="bg-dark.text-white.text-center.py-3">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center justify-content-center" href="#">
                    <img src="${pageContext.request.contextPath}/static/img/logo1.png" alt="品牌圖示">
                </a>
            </div>
        </header>

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
                            <a class="nav-link active" aria-current="page"
                                href="<c:url value='/admin/orders' />">訂單管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/admin/products' />">上架商品管理</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/' />">首頁官網</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/cart' />">顧客購物車</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <body>
            <div class="container admin-container">
                <h1 class="admin-title">商家後台管理系統</h1>
                <nav class="nav justify-content-center">
                </nav>
                <div class="content mt-4">
                    <!-- 在這裡顯示具體的管理內容，例如商品列表、顧客資料、訂單等 -->
                </div>
            </div>
        </body>

    </html>