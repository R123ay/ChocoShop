<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productstyle.css">
</head>
<body>
    <h1>Product List</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/products/delete">
                            <input type="hidden" name="id" value="${product.id}">
                            <button type="submit">Delete</button>
                        </form>
                        <form method="post" action="${pageContext.request.contextPath}/products/update">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="text" name="name" value="${product.name}">
                            <input type="text" name="description" value="${product.description}">
                            <input type="number" name="price" value="${product.price}">
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form method="post" action="${pageContext.request.contextPath}/products/add">
        <h2>Add Product</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description">
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01">
        <button type="submit">Add Product</button>
    </form>
</body>
</html>
