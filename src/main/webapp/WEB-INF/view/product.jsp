<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>產品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/product.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .btn-custom {
            width: 80px; /* 調整按鈕寬度 */
        }
        .hidden-form {
            display: inline; /* 隱藏表單邊框 */
            margin: 0;
            padding: 0;
            border: none;
            background: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">產品管理</h1>
        
        <!-- 商品搜索框 -->
        <form action="${pageContext.request.contextPath}/products/search" method="get" class="mb-4">
            <input type="text" name="keyword" placeholder="Search by name or category">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
        
        <button type="button" class="btn btn-success float-right mb-4" data-toggle="modal" data-target="#addProductModal">新增商品</button>
        
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>品名</th>
                    <th>類別</th>
                    <th>價格</th>
                    <th>商品照片</th>
                    <th>上架時間</th>
                    <th>最新修改時間</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.id}</td>
                        <td><a href="${pageContext.request.contextPath}/products/${product.id}">${product.name}</a></td>
                        <td>${product.category}</td>
                        <td>${product.price}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/products/${product.id}">
                                <img src="${pageContext.request.contextPath}${product.imageUrl}" alt="${product.name}" width="100" height="100">
                            </a>
                        </td>
                        <td>${product.createdAt}</td>
                        <td>${product.updatedAt}</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-custom" onclick="showEditModal(${product.id}, '${product.name}', '${product.category}', ${product.price}, '${product.imageUrl}')">編輯</button>
                            <a href="${pageContext.request.contextPath}/products/delete/${product.id}" class="btn btn-danger btn-custom" style="display:inline;">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 新增商品的模態框 -->
    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">新增商品</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/products/add" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="add-name">品名</label>
                            <input type="text" class="form-control" id="add-name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="add-category">類別</label>
                            <input type="text" class="form-control" id="add-category" name="category" required>
                        </div>
                        <div class="form-group">
                            <label for="add-price">價格</label>
                            <input type="number" class="form-control" id="add-price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="add-imageUrl">商品照片</label>
                            <input type="file" class="form-control" id="add-imageUrl" name="file" required>
                        </div>
                        <button type="submit" class="btn btn-success btn-custom">新增</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 編輯商品的模態框 -->
    <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductModalLabel">編輯商品</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editProductForm" action="${pageContext.request.contextPath}/products/update" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="edit-id">ID</label>
                            <input type="text" class="form-control" id="edit-id" name="id" readonly>
                        </div>
                        <div class="form-group">
                            <label for="edit-name">品名</label>
                            <input type="text" class="form-control" id="edit-name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-category">類別</label>
                            <input type="text" class="form-control" id="edit-category" name="category" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-price">價格</label>
                            <input type="number" class="form-control" id="edit-price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="edit-imageUrl">商品照片</label>
                            <input type="file" class="form-control" id="edit-imageUrl" name="file">
                        </div>
                        <button type="submit" class="btn btn-success">保存</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 照片預覽模態框 -->
    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">照片預覽</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <img id="previewImage" src="" alt="產品照片" class="img-fluid">
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        function showEditModal(id, name, category, price, imageUrl) {
            $('#edit-id').val(id);
            $('#edit-name').val(name);
            $('#edit-category').val(category);
            $('#edit-price').val(price);
            $('#editProductModal').modal('show');
        }

        function showImageModal(imageUrl) {
            var modal = $('#imageModal');
            var image = modal.find('#previewImage');
            image.attr('src', imageUrl);
            modal.modal('show');
        }
    </script>
</body>
</html>
