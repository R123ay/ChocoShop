<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/order.css' />">
</head>
<body>
    <header class="main-header">
        <h1 class="band-name band-name-large">訂單列表</h1>
    </header>
    <section class="container content-section">
        <h2 class="section-header">所有訂單</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>訂單編號</th>
                    <th>顧客姓名</th>
                    <th>電話</th>
                    <th>電子信箱</th>
                    <th>付款方式</th>
                    <th>總金額</th>
                    <th>購買日期</th>
                    <th>預定到貨日期</th>
                    <th>詳細資訊</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.name}</td>
                        <td>${order.phone}</td>
                        <td>${order.email}</td>
                        <td>${order.paymentMethod}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.purchaseDate}</td>
                        <td>${order.deliveryDate}</td>
                        <td><a href="<c:url value='/admin/orders/${order.orderId}' />">查看</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</body>
</html>
