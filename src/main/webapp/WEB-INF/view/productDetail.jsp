<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>商品詳情</title>
</head>
<body>
    <h1>${product.name}</h1>
    <p>類別: ${product.category}</p>
    <p>價格: ${product.price}</p>
    <p>描述: ${product.description}</p>
    <img src="${pageContext.request.contextPath}${product.imageUrl}" alt="${product.name}">
    <p>上架時間: ${product.createdAt}</p>
    <p>最新修改時間: ${product.updatedAt}</p>
    <a href="${pageContext.request.contextPath}/products">返回商品列表</a>
</body>
</html>
