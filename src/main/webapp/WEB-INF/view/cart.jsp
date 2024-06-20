<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Noto Sans TC', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .cart-container {
            background-color: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: auto;
        }
        .cart-title {
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container cart-container">
        <h1 class="cart-title">購物車</h1>
        <c:if test="${empty cartItems}">
            <p>您的購物車是空的。</p>
        </c:if>
        <c:if test="${not empty cartItems}">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">商品名稱</th>
                        <th scope="col">價格</th>
                        <th scope="col">數量</th>
                        <th scope="col">小計</th>
                        <th scope="col">操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart/update" method="post">
                                    <input type="hidden" name="itemId" value="${item.id}">
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control">
                                    <button type="submit" class="btn btn-sm btn-primary mt-1">更新</button>
                                </form>
                            </td>
                            <td>${item.price * item.quantity}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/cart/remove" method="post">
                                    <input type="hidden" name="itemId" value="${item.id}">
                                    <button type="submit" class="btn btn-sm btn-danger">移除</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-end">
                <form action="${pageContext.request.contextPath}/orders/checkout" method="post">
                    <button type="submit" class="btn btn-success">結帳</button>
                </form>
            </div>
        </c:if>
    </div>
</body>
</html>
