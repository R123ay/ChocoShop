<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單詳情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orderDetail.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-4">訂單詳情</h1>
        <div class="order-details">
            <h2>訂單 ID: ${order.orderId}</h2>
            <p>總價: ${order.totalPrice}</p>
            <p>建立時間: ${order.createdAt}</p>
            <p>更新時間: ${order.updatedAt}</p>
        </div>
        <h3>訂單項目</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>商品名稱</th>
                    <th>單價</th>
                    <th>數量</th>
                    <th>總價</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${orderItems}">
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.price}</td>
                        <td>${item.quantity}</td>
                        <td>${item.price * item.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/orders" class="btn btn-secondary">返回訂單列表</a>
    </div>
</body>
</html>
