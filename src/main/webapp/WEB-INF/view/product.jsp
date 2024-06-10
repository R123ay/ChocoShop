<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/productstyle.css"> <!-- 引入 CSS 樣式表 -->
</head>
<body>
    <h1>Product Management</h1>
    
    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}"> <!-- 迭代產品列表 -->
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/api/products/delete">
                            <input type="hidden" name="id" value="${product.id}">
                            <button type="submit">Delete</button> <!-- 刪除按鈕 -->
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <form method="post" action="${pageContext.request.contextPath}/api/products/add">
        <h2>Add Product</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description">
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01">
        <button type="submit">Add Product</button> <!-- 新增產品按鈕 -->
    </form>
    
    <form method="post" action="${pageContext.request.contextPath}/api/products/update">
        <h2>Update Product</h2>
        <label for="id">Product ID:</label>
        <input type="number" id="id" name="id">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description">
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" step="0.01">
        <button type="submit">Update Product</button> <!-- 更新產品按鈕 -->
    </form>
</body>
</html>
