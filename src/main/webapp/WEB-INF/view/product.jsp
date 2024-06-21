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
            width: 80px;
        }
        .hidden-form {
            display: inline;
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

        <div class="d-flex mb-4 align-items-center">
            <form action="${pageContext.request.contextPath}/products/search" method="get" class="form-inline mr-2 d-flex ml-auto">
                <div class="input-group">
                    <input type="text" name="keyword" class="form-control" placeholder="輸入品名或類別搜尋商品">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-primary">搜尋</button>
                    </div>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-success ml-2" data-toggle="modal" data-target="#addProductModal">新增</button>
                    </div>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-info ml-2" onclick="downloadTableAsCSV('productTable')">下載 CSV</button>
                    </div>
                </div>
            </form>
        </div>

        <table class="table" id="productTable">
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
                        <td>${product.productId}</td>
                        <td><a href="${pageContext.request.contextPath}/products/${product.productId}">${product.name}</a></td>
                        <td>${product.category}</td>
                        <td>${product.price}</td>
                        <td>
                            <a href="javascript:void(0);" onclick="showImageModal('${pageContext.request.contextPath}${product.imageUrl}')">
                                <img src="${pageContext.request.contextPath}${product.imageUrl}" alt="${product.name}" width="100" height="100">
                            </a>
                        </td>
                        <td>${product.createdAt}</td>
                        <td>${product.updatedAt}</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-custom" onclick="showEditModal(${product.productId}, '${product.name}', '${product.category}', ${product.price}, '${product.imageUrl}')">編輯</button>
                            <a href="${pageContext.request.contextPath}/products/delete/${product.productId}" class="btn btn-danger btn-custom" style="display:inline;">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

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
                            <input type="text" class="form-control" id="edit-id" name="productId" readonly>
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
        function showEditModal(productId, name, category, price, imageUrl) {
            $('#edit-id').val(productId);
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

        function downloadTableAsCSV(tableId) {
            var table = document.getElementById(tableId);
            var rows = Array.from(table.querySelectorAll('tr'));

            var excludeIndexes = [4, 7];

            var csvContent = rows.map(function(row) {
                var cols = Array.from(row.querySelectorAll('th, td'));
                return cols.filter(function(col, index) {
                    return !excludeIndexes.includes(index);
                }).map(function(col) {
                    return col.innerText.replace(/"/g, '""');
                }).join('","');
            }).join('"\n"');
            csvContent = '\uFEFF"' + csvContent + '"';

            var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            var link = document.createElement('a');
            var url = URL.createObjectURL(blob);
            link.setAttribute('href', url);
            link.setAttribute('download', 'product_table.csv');
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    </script>
</body>
</html>
