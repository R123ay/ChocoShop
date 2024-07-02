<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車</title>
    <link rel="stylesheet" href="<c:url value='/static/css/cart.css' />">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="shortcut icon" href="#" />
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

            .navbar .nav-link:hover {
                color: #ffc107;
            }
        }

        .offcanvas-half-width {
            width: 40%;
            background-color: #1c0a01;
            color: #ffa140;
        }

        .navbar .nav-link:hover {
            color: #ffa140;
            text-decoration: underline;
        }

        .cart-header {
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .cart-row {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }

        .cart-column {
            flex: 1;
            text-align: center;
        }

        .cart-item-title {
            margin-left: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .cart-price,
        .cart-quantity {
            font-size: 18px;
        }

        .cart-total {
            display: flex;
            justify-content: flex-end;
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
        }

        .cart-total-title {
            margin-right: 20px;
        }

        .btn-purchase {
            display: block;
            margin: 20px auto;
            font-size: 20px;
        }

        .shop-items {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .shop-item {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            width: calc(33.333% - 20px);
            box-sizing: border-box;
        }

        .shop-item-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .shop-item-image {
            width: 100%;
            height: auto;
            cursor: pointer;
        }

        .shop-item-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .shop-item-price {
            font-size: 18px;
            font-weight: bold;
        }

        .shop-item-quantity {
            width: 60px;
        }

        #productDialog {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        #dialogContent {
            position: relative;
        }

        #closeDialog {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
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
            <div class="admin-title">Ruby Choco 商品列表</div>
        </div>
        <nav class="navbar d-none d-md-flex">
            <a class="nav-link" href="<c:url value='/' />">官網</a>
        </nav>
    </div>
    <div class="offcanvas offcanvas-start offcanvas-half-width" tabindex="-1" id="offcanvasNavbar"
        aria-labelledby="offcanvasNavbarLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">導航選單</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <nav class="navbar-nav">
                <a class="nav-link" href="<c:url value='/' />">官網</a>
            </nav>
        </div>
    </div>
    <div class="container admin-container">
        <div class="content">
            <header class="main-header">
                <h1 class="band-name band-name-large">購物車系統</h1>
            </header>
            <section class="container content-section">
                <h2 class="section-header">購物車</h2>
                <div class="cart-row">
                    <span class="cart-item cart-header cart-column">品名</span>
                    <span class="cart-price cart-header cart-column">單價</span>
                    <span class="cart-quantity cart-header cart-column">數量</span>
                    <span class="cart-edit cart-header cart-column">編輯</span>
                </div>
                <div class="cart-items" id="cart-items">
                    <c:forEach var="cartItem" items="${cartItems}">
                        <div class="cart-row">
                            <div class="cart-item cart-column">
                                <span class="cart-item-title">
                                    <c:out value="${cartItem.productName}" />
                                </span>
                            </div>
                            <span class="cart-price cart-column">$<fmt:formatNumber value="${cartItem.price}" type="number" maxFractionDigits="0" /></span>
                            <span class="cart-quantity cart-column"><fmt:formatNumber value="${cartItem.quantity}" type="number" maxFractionDigits="0" /></span>
                            <div class="cart-edit cart-column">
                                <form action="<c:url value='/cart/remove' />" method="post" style="display:inline;">
                                    <input type="hidden" name="productId" value="${cartItem.productId}">
                                    <button class="btn btn-danger" type="submit">移除</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="cart-total">
                    <strong class="cart-total-title">總計</strong>
					<span class="cart-total-price">$<fmt:formatNumber value="${totalAmount}" type="number" maxFractionDigits="0" /></span>
                    </span>
                </div>
                <button class="btn btn-primary btn-purchase" onclick="showConfirmPurchase()">結帳</button>
            </section>
            <section class="container content-section">
                <h2 class="section-header">商品列表</h2>
                <div class="shop-items" id="shop-items">
                    <c:forEach var="product" items="${products}">
                        <div class="shop-item">
                            <span class="shop-item-title">${product.name}</span>
                            <img class="shop-item-image product-image" data-id="${product.productId}" src="${product.imageUrl}">
                            <div class="shop-item-details">
                                <span class="shop-item-price">$${product.price}</span>
                                <form action="<c:url value='/cart/add' />" method="post">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <input type="hidden" name="price" value="${product.price}">
                                    <input class="shop-item-quantity" type="number" name="quantity" value="1" min="1">
                                    <button class="btn btn-primary" type="submit">加入購物車</button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
            <!-- 商品詳細資訊對話框 -->
            <div id="productDialog">
                <div id="dialogContent">
                    <span id="closeDialog" style="float:right; cursor:pointer;">&times;</span>
                    <h2 id="productName"></h2>
                    <p id="productDescription"></p>
                    <p id="productPrice"></p>
                    <p id="productCategory"></p>
                </div>
            </div>
            <!-- Confirm Purchase Modal -->
            <div class="modal fade" id="confirmPurchaseModal" tabindex="-1"
                aria-labelledby="confirmPurchaseModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmPurchaseModalLabel">確認購買</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h2 class="section-header">確認購買品項</h2>
                            <div class="cart-row">
                                <span class="cart-item cart-header cart-column">品名</span>
                                <span class="cart-price cart-header cart-column">單價</span>
                                <span class="cart-quantity cart-header cart-column">數量</span>
                            </div>
                            <div class="cart-items">
                                <c:forEach var="cartItem" items="${cartItems}">
                                    <div class="cart-row">
                                        <div class="cart-item cart-column">
                                            <span class="cart-item-title">${cartItem.productName}</span>
                                        </div>
                                        <span class="cart-price cart-column">$<fmt:formatNumber value="${cartItem.price}" type="number" maxFractionDigits="0" /></span>
                                        <div class="cart-quantity cart-column">
                                            <span class="cart-quantity">${cartItem.quantity}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="cart-total">
                                <strong class="cart-total-title">總計</strong>
								<span class="cart-total-price">$<fmt:formatNumber value="${totalAmount}" type="number" maxFractionDigits="0" /></span>
                                </span>
                            </div>
                            <h2 class="section-header">購買訊息</h2>
                            <form id="confirmPurchaseForm" action="<c:url value='/cart/confirm' />" method="post">
                                <div>
                                    <label for="name">姓名:</label>
                                    <input type="text" id="name" name="name" required>
                                </div>
                                <div>
                                    <label for="phone">手機:</label>
                                    <input type="text" id="phone" name="phone" onblur="validatePhoneNumber()" required>
                                    <span id="phoneError" style="color: red;"></span>
                                </div>
                                <div>
                                    <label for="email">電子信箱:</label>
                                    <input type="email" id="email" name="email" onblur="validateEmail()" required>
                                    <span id="emailError" style="color: red;"></span>
                                </div>
                                <div>
                                    <label for="paymentMethod">付款方式:</label>
                                    <select id="paymentMethod" name="paymentMethod">
                                        <option value="貨到付款">貨到付款</option>
                                        <option value="ATM轉帳">ATM轉帳</option>
                                    </select>
                                </div>
<!-- 
                                <div>
                                    <label for="deliveryDate">預定到貨日期:</label>
                                    <input type="date" id="deliveryDate" name="deliveryDate" required>
                                </div>
 -->                                
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
                            <button type="button" class="btn btn-primary" onclick="confirmPurchase()">確認購買</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Alert Modal -->
            <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="alertModalLabel">提醒</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            提醒您，記得加入商品到購物車中喔
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">確定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
<!--
    document.addEventListener("DOMContentLoaded", function () {
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("deliveryDate").setAttribute("min", today);
    });
-->
    function showConfirmPurchase() {
        var cartItems = document.getElementById("cart-items").children.length;
        if (cartItems === 0) {
            $('#alertModal').modal('show');
        } else {
            $('#confirmPurchaseModal').modal('show');
        }
    }

    function validatePhoneNumber() {
        var phone = document.getElementById("phone").value;
        var phoneError = document.getElementById("phoneError");
        if (phone.length !== 10 || !/^\d+$/.test(phone)) {
            phoneError.textContent = '需輸入10位數字';
            return false;
        } else {
            phoneError.textContent = '';
            return true;
        }
    }

    function validateEmail() {
        var email = document.getElementById("email").value;
        var emailError = document.getElementById("emailError");
        if (!email.includes("@")) {
            emailError.textContent = '請確認email是否正確';
            return false;
        } else {
            emailError.textContent = '';
            return true;
        }
    }

    function confirmPurchase() {
        if (!validatePhoneNumber()) {
            return;
        }
        document.getElementById("confirmPurchaseForm").submit();
    }

    // 點擊圖片顯示商品詳細資訊
    $(document).on("click", ".product-image", function () {
        var productId = $(this).data("id");
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/products/product/' + productId,
            method: 'GET',
            success: function (product) {
                $("#productName").text(product.name);
                $("#productDescription").text(product.description);
                $("#productPrice").text("價格: $" + product.price);
                $("#productCategory").text("類別: " + product.category);
                $("#productDialog").show();
            }
        });
    });

    // 關閉對話框
    $("#closeDialog").click(function () {
        $("#productDialog").hide();
    });
</script>
</html>
