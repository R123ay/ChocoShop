<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="zh-TW">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>感謝您的購買</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap"
                    rel="stylesheet">
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
                        max-width: 500px;
                        /* 調整表單容器的最大寬度 */
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
                            border-color: #ffa140;
                        }

                        .btn-primary-nav:hover {
                            background-color: #ffa140;
                            border-color: #1c0a01;
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
                        }

                        .btn-primary-nav:focus .navbar-toggler-icon,
                        .btn-primary-nav:active .navbar-toggler-icon,
                        .btn-primary-nav:focus-visible .navbar-toggler-icon {
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%23ffa140' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        .navbar {
                            background-color: #1c0a01;
                        }
                    }

                    .offcanvas-half-width {
                        width: 40%;
                        background-color: #1c0a01;
                        color: #ffa140;
                    }

                    .offcanvas-half-width .nav-link {
                        color: #ffa140;
                    }

                    .navbar .nav-link:hover {
                        color: #ffc107;
                        text-decoration: underline;
                    }
                </style>
            </head>

            <body>
                <div class="header">
                    <div class="logo-container">
                        <button class="btn btn-primary-nav d-md-none" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <img src="${pageContext.request.contextPath}/static/img/logo2.png" alt="品牌圖示">
                        <div class="admin-title">感謝您的購買</div>
                    </div>
                    <nav class="navbar d-none d-md-flex">
                        <a class="nav-link" href="<c:url value='/' />">官網</a>
                    </nav>
                </div>
                <div class="offcanvas offcanvas-start offcanvas-half-width" tabindex="-1" id="offcanvasNavbar"
                    aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">導航選單</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <nav class="navbar-nav">
                            <a class="nav-link" href="<c:url value='/' />">官網</a>
                        </nav>
                    </div>
                </div>
                <div class="container admin-container">
                    <div class="content">
                        <h2 class="section-header">您的購買資訊</h2>
                        <form>
                            <div class="mb-3">
                                <label for="name" class="form-label"><strong>姓名:</strong></label>
                                <input type="text" class="form-control" id="name" value="${name}" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label"><strong>手機:</strong></label>
                                <input type="text" class="form-control" id="phone" value="${phone}" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label"><strong>電子信箱:</strong></label>
                                <input type="email" class="form-control" id="email" value="${email}" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="paymentMethod" class="form-label"><strong>付款方式:</strong></label>
                                <input type="text" class="form-control" id="paymentMethod" value="${paymentMethod}"
                                    readonly>
                            </div>
                            <div class="mb-3">
                                <label for="deliveryDate" class="form-label"><strong>預定到貨日期:</strong></label>
                                <input type="date" class="form-control" id="deliveryDate" value="${deliveryDate}"
                                    readonly>
                            </div>
                            <div class="mb-3">
                                <label for="purchaseDateTime" class="form-label"><strong>購買日期時間:</strong></label>
                                <input type="text" class="form-control" id="purchaseDateTime"
                                    value="${purchaseDateTime}" readonly>
                            </div>
                        </form>
                        <h2 class="section-header">購買品項</h2>
                        <div class="cart-row">
                            <span class="cart-item cart-header cart-column">品名</span>
                            <span class="cart-price cart-header cart-column">單價</span>
                            <span class="cart-quantity cart-header cart-column">數量</span>
                        </div>
                        <div class="cart-items">
                            <c:forEach var="cartItem" items="${cartItems}">
                                <div class="cart-row">
                                    <div class="cart-item cart-column">
                                        <span class="cart-item-title">${cartItem.productId}</span>
                                    </div>
                                    <span class="cart-price cart-column">$${cartItem.price}</span>
                                    <div class="cart-quantity cart-column">
                                        <span class="cart-quantity">${cartItem.quantity}</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="cart-total">
                            <strong class="cart-total-title">總計</strong>
                            <span class="cart-total-price">$
                                <c:out value="${totalAmount}" />
                            </span>
                        </div>
                        <div class="text-center mt-5">
                            <button class="btn btn-primary" onclick="window.location.href='<c:url value="
                                /cart/clear" />'">再次購買</button>
                        </div>
                    </div>
                </div>
                <!-- Alert Modal -->
                <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="alertModalLabel">感謝您的購買</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                20秒後將自動導向首頁畫面...
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">確定</button>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('#alertModal').modal('show');
                    setTimeout(function () {
                        window.location.href = '<c:url value="/" />';
                    }, 20000);
                });
            </script>

            </html>