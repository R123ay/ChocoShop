<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單詳細資訊</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orderdetail.css' />">
</head>
<body>
    <header class="main-header">
        <h1 class="band-name band-name-large">訂單詳細資訊</h1>
    </header>
    <section class="container content-section">
        <h2 class="section-header">訂單編號: ${order.orderId}</h2>
        <div>
            <strong>顧客姓名:</strong> ${order.name}
        </div>
        <div>
            <strong>電話:</strong> ${order.phone}
        </div>
        <div>
            <strong>電子信箱:</strong> ${order.email}
        </div>
        <div>
            <strong>付款方式:</strong> ${order.paymentMethod}
        </div>
        <div>
            <strong>預定到貨日期:</strong> ${order.deliveryDate}
        </div>
        <div>
            <strong>購買日期:</strong> ${order.purchaseDate}
        </div>
        <h2 class="section-header">購買品項</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>品名</th>
                    <th>數量</th>
                    <th>單價</th>
                    <th>總價</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${orderItems}">
                    <tr>
                        <td>${item.productId}</td> <!-- 這裡你可以根據 productId 獲取產品名稱 -->
                        <td>${item.quantity}</td>
                        <td>${item.totalPrice / item.quantity}</td>
                        <td>${item.totalPrice}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="cart-total">
            <strong class="cart-total-title">總計</strong>
            <span class="cart-total-price">$<c:out value="${order.totalPrice}" /></span>
        </div>
        <button class="btn btn-primary" onclick="window.location.href='/admin/orders'">返回訂單列表</button>
    </section>
</body>
</html>
