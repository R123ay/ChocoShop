<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>產品管理</title>
    <link rel="stylesheet" type="text/css" href="product.css"> <!-- 連結到CSS檔案 -->
</head>
<body>
    <h1>產品管理</h1> <!-- 標題 -->
    <form action="/products" method="post">
        <!-- 新增產品表單 -->
        <label for="name">品名:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="category">類別:</label>
        <input type="text" id="category" name="category" required><br><br>

        <label for="price">價格:</label>
        <input type="number" id="price" name="price" required><br><br>

        <label for="imageUrl">商品照片URL:</label>
        <input type="text" id="imageUrl" name="imageUrl"><br><br>

        <button type="submit">新增產品</button> <!-- 新增產品按鈕 -->
    </form>

    <hr>

    <h2>現有產品</h2> <!-- 現有產品列表標題 -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>品名</th>
                <th>類別</th>
                <th>價格</th>
                <th>商品照片</th>
                <th>上架時間</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <!-- 從後端傳來的產品列表 -->
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.category}</td>
                    <td>${product.price}</td>
                    <td><img src="${product.imageUrl}" alt="${product.name}" width="100"></td> <!-- 顯示產品照片 -->
                    <td>${product.createdAt}</td>
                    <td>
                        <!-- 編輯產品表單 -->
                        <form action="/products/${product.id}" method="post" style="display:inline;">
                            <input type="hidden" name="_method" value="put">
                            <button type="submit">編輯</button>
                        </form>
                        <!-- 刪除產品表單 -->
                        <form action="/products/delete/${product.id}" method="post" style="display:inline;">
                            <input type="hidden" name="_method" value="delete">
                            <button type="submit">刪除</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
