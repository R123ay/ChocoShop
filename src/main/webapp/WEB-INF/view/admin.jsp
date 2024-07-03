<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="zh-Hant">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>商品上架</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
                <style>
                    .btn-custom {
                        width: 80px;
                    }

                    .hidden-form {
                        display: inline;
                        margin: 0;
                        padding: 0;
                        border: none;
                        background: none;
                    }

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
                        max-width: 180px;
                        margin-right: 10px;
                    }

                    .admin-title {
                        font-size: 24px;
                        font-weight: 700;
                        text-align: center;
                        flex: 1;
                    }

                    .navbar {
                        display: none;
                    }

                    .navbar .nav-link {
                        color: #ffa140;
                        font-weight: bold;
                        text-decoration: none;
                        transition: color 0.3s ease;
                    }

                    .navbar .nav-link:hover {
                        color: #ffa140;
                        text-decoration: underline;
                    }

                    .navbar .nav-link:focus {
                        color: #ffc107;
                        outline: none;
                    }

                    .container.admin-container {
                        background-color: #fff;
                        padding: 2rem;
                        border-radius: 10px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        max-width: 1200px;
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

                    @media (max-width: 768px) {
                        .header {
                            justify-content: center;
                            position: relative;
                        }

                        .logo-container,
                        .admin-title {
                            margin-top: 10px;
                            text-align: center;
                        }

                        .btn-primary-nav {
                            position: absolute;
                            left: 10px;
                            top: 10px;
                            background-color: #1c0a01;
                            /* 更改按鈕背景顏色 */
                            border-color: #ffa140;
                            /* 更改按鈕邊框顏色 */
                        }

                        .btn-primary-nav:hover {
                            background-color: #ffa140;
                            /* 更改按鈕懸停時的背景顏色 */
                            border-color: #1c0a01;
                            /* 更改按鈕懸停時的邊框顏色 */
                        }

                        .navbar-toggler-icon {
                            display: inline-block;
                            width: 24px;
                            height: 24px;
                            vertical-align: middle;
                            content: "";
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%23ffa140' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        .btn-primary-nav:hover .navbar-toggler-icon {
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%231c0a01' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        .btn-primary-nav:focus,
                        .btn-primary-nav:active,
                        .btn-primary-nav:focus-visible {
                            background-color: #1c0a01;
                            border-color: #ffa140;
                            box-shadow: none;
                            /* 移除按下時的陰影效果 */
                        }

                        .btn-primary-nav:focus .navbar-toggler-icon,
                        .btn-primary-nav:active .navbar-toggler-icon,
                        .btn-primary-nav:focus-visible .navbar-toggler-icon {
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%23ffa140' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        /* 新增導覽列背景顏色和文字顏色 */
                        .navbar {
                            background-color: #1c0a01;
                            /* 修改背景顏色 */
                        }

                        .navbar .nav-link {}

                        .navbar .nav-link:hover {
                            color: #ffc107;
                            /* 修改懸停時文字顏色 */
                        }
                    }

                    .offcanvas-half-width {
                        width: 40%;
                        background-color: #1c0a01;
                        color: #ffa140;

                        /* 修改文字顏色 */
                        .navbar .nav-link:hover {
                            color: #ffc107;
                            /* 修改懸停時文字顏色 */
                        }
                    }

                    .offcanvas-half-width .nav-link {
                        color: #ffa140;
                    }

                    .navbar .nav-link:hover {
                        color: #ffa140;
                        text-decoration: underline;
                    }
                </style>
            </head>

            <body>

            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

            </html>