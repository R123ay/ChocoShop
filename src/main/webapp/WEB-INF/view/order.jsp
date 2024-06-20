<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/orders.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-4">訂單管理</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>總價</th>
                    <th>建立時間</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.createdAt}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/orders/${order.id}" class="btn btn-primary">詳細</a>
                            <a href="${pageContext.request.contextPath}/orders/delete/${order.id}" class="btn btn-danger">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
