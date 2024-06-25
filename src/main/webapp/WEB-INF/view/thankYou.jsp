<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>感謝您的購買</title>
    <link rel="stylesheet" href="<c:url value='/static/css/cart.css' />">
    <link rel="shortcut icon" href="#" />
    <script>
        setTimeout(function() {
            window.location.href = '<c:url value="/" />';
        }, 10000);
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
        <h1 class="band-name band-name-large">感謝您的購買</h1>
    </header>
    <section class="container content-section">
        <h2 class="section-header">您的購買資訊</h2>
        <div>
            <strong>姓名:</strong> ${name}
        </div>
        <div>
            <strong>手機:</strong> ${phone}
        </div>
        <div>
            <strong>電子信箱:</strong> ${email}
        </div>
        <div>
            <strong>付款方式:</strong> ${paymentMethod}
        </div>
        <div>
            <strong>預定到貨日期:</strong> ${deliveryDate}
        </div>
        <div>
            <strong>購買日期時間:</strong> ${purchaseDateTime}
        </div>
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
            <span class="cart-total-price">$<c:out value="${totalAmount}" /></span>
        </div>
        <div class="text-center mt-5">
            <button class="btn btn-primary" onclick="window.location.href='<c:url value="/cart" />'">再次購買</button>
        </div>
    </section>
</body>
</html>
