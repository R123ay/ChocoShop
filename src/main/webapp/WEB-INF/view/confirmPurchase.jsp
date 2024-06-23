<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>確認購買</title>
    <link rel="stylesheet" href="<c:url value='/static/css/cart.css' />">
    <link rel="shortcut icon" href="#" />
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var today = new Date().toISOString().split('T')[0];
            document.getElementById("deliveryDate").setAttribute("min", today);
        });
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
        <h1 class="band-name band-name-large">確認購買</h1>
    </header>
    <section class="container content-section">
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
            <span class="cart-total-price">$<c:out value="${totalAmount}" /></span>
        </div>
        <h2 class="section-header">購買訊息</h2>
        <form action="<c:url value='/cart/confirm' />" method="post">
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
                    <option value="cash_on_delivery">貨到付款</option>
                    <option value="atm_transfer">ATM轉帳</option>
                </select>
            </div>
            <div>
                <label for="deliveryDate">預定到貨日期:</label>
                <input type="date" id="deliveryDate" name="deliveryDate" required>
            </div>
            <button class="btn btn-primary" type="submit">確認購買</button>
        </form>
    </section>
</body>
</html>
