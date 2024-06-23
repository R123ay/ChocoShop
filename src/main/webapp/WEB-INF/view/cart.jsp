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
    <!-- <script src="<c:url value='/static/cartjs.js' />" async></script> --> <!-- 註解掉這行 -->
    <link rel="shortcut icon" href="#" />
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
        </div>
        <div class="cart-items" id="cart-items">
            <c:forEach var="cartItem" items="${cartItems}">
                <div class="cart-row">
                    <div class="cart-item cart-column">
                        <span class="cart-item-title">${cartItem.productId}</span>
                    </div>
                    <span class="cart-price cart-column">$${cartItem.price}</span>
                    <div class="cart-quantity cart-column">
                        <span class="cart-quantity">${cartItem.quantity}</span>
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
        <form action="<c:url value='/cart/checkout' />" method="post">
            <button class="btn btn-primary btn-purchase" type="submit">結帳</button>
        </form>
    </section>
</body>
</html>
