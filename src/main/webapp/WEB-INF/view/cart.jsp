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
    <script src="<c:url value='/static/js/cart.js' />" async></script>
</head>
<body>
    <header class="main-header">
        <nav class="main-nav nav">
            <ul>
                <li><a href="<c:url value='/' />">官網</a></li>
                <li><a href="<c:url value='/orders' />">購物車</a></li>
            </ul>
        </nav>
        <h1 class="band-name band-name-large">購物車系統</h1>
    </header>
    <section class="container content-section">
        <h2 class="section-header">商品列表</h2>
        <div class="shop-items">
            <c:forEach var="product" items="${products}">
                <div class="shop-item">
                    <span class="shop-item-title">${product.name}</span>
                    <img class="shop-item-image" src="${product.imageUrl}">
                    <div class="shop-item-details">
                        <span class="shop-item-price">$${product.price}</span>
                        <input class="shop-item-quantity" type="number" value="1" min="1">
                        <button class="btn btn-primary shop-item-button" type="button" data-id="${product.productId}" data-name="${product.name}" data-price="${product.price}" data-image="${product.imageUrl}">加入購物車</button>
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
        <div class="cart-items"></div>
        <div class="cart-total">
            <strong class="cart-total-title">總計</strong>
            <span class="cart-total-price">$0</span>
        </div>
        <button class="btn btn-primary btn-purchase" type="button">購買</button>
    </section>
</body>
</html>
