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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById("deliveryDate").setAttribute("min", today);
        });

        function showConfirmPurchase() {
            $('#confirmPurchaseModal').modal('show');
        }

        function confirmPurchase() {
            document.getElementById("confirmPurchaseForm").submit();
        }
    </script>
</head>
<body>
    <header class="main-header">
        <nav class="main-nav nav">
            <ul>
                <li><a href="<c:url value='/' />">官網</a></li>
                <li><a href="<c:url value='/cart' />">購物車</a></li>
            </ul>
        </nav>
        <h1 class="band-name band-name-large">購物車系統</h1>
    </header>
    <section class="container content-section">
        <h2 class="section-header">商品列表</h2>
        <div class="shop-items" id="shop-items">
            <c:forEach var="product" items="${products}">
                <div class="shop-item">
                    <span class="shop-item-title">${product.name}</span>
                    <img class="shop-item-image" src="${product.imageUrl}">
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
                    <span class="cart-price cart-column">$${cartItem.price}</span>
                    <span class="cart-quantity cart-column">${cartItem.quantity}</span>
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
            <span class="cart-total-price">$<c:out value="${totalAmount}" /></span>
        </div>
        <button class="btn btn-primary btn-purchase" onclick="showConfirmPurchase()">結帳</button>
    </section>

    <!-- Confirm Purchase Modal -->
    <div class="modal fade" id="confirmPurchaseModal" tabindex="-1" aria-labelledby="confirmPurchaseModalLabel" aria-hidden="true">
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
                                <span class="cart-price cart-column">$${cartItem.price}</span>
                                <div class="cart-quantity cart-column">
                                    <span class="cart-quantity">${cartItem.quantity}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="cart-total">
                        <strong class="cart-total-title">總計</strong>
                        <span class="cart-total-price">$<c:out value="${totalAmount}" /></span>
                    </div>
                    <h2 class="section-header">購買訊息</h2>
                    <form id="confirmPurchaseForm" action="<c:url value='/cart/confirm' />" method="post">
                        <div>
                            <label for="name">姓名:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div>
                            <label for="phone">手機:</label>
                            <input type="text" id="phone" name="phone" required>
                        </div>
                        <div>
                            <label for="email">電子信箱:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div>
                            <label for="paymentMethod">付款方式:</label>
                            <select id="paymentMethod" name="paymentMethod">
                                <option value="貨到付款">貨到付款</option>
                                <option value="ATM轉帳">ATM轉帳</option>
                            </select>
                        </div>
                        <div>
                            <label for="deliveryDate">預定到貨日期:</label>
                            <input type="date" id="deliveryDate" name="deliveryDate" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
                    <button type="button" class="btn btn-primary" onclick="confirmPurchase()">確認購買</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
