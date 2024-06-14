<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderstyle.css">
</head>
<body>
    <h1>Order List</h1>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer ID</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.id}</td>
                    <td>${order.customerId}</td>
                    <td>${order.totalPrice}</td>
                    <td>${order.status}</td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/orders/delete/${order.id}">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form method="post" action="${pageContext.request.contextPath}/orders/add">
        <h2>Add Order</h2>
        <label for="customerId">Customer ID:</label>
        <input type="number" id="customerId" name="customerId" required>
        <label for="totalPrice">Total Price:</label>
        <input type="number" id="totalPrice" name="totalPrice" step="0.01" required>
        <label for="status">Status:</label>
        <input type="text" id="status" name="status" required>
        <button type="submit">Add Order</button>
    </form>
</body>
</html>
