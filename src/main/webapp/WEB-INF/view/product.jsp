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
                        <td><input type="text" name="name" value="${product.name}" class="form-control" onchange="changeProductName(this)" readonly></td>
                        <td><input type="text" name="category" value="${product.category}" class="form-control" readonly></td>
                        <td><input type="number" name="price" value="${product.price}" class="form-control" readonly></td>
                        <td>
                            <img src="${pageContext.request.contextPath}${product.imageUrl}" alt="${product.name}" width="100" height="100" onclick="showImageModal('${pageContext.request.contextPath}${product.imageUrl}')">
                            <form action="${pageContext.request.contextPath}/products/update/${product.id}" method="post" enctype="multipart/form-data" class="hidden-form">
                                <input type="file" name="file" style="display: none;" onchange="changeProductImage(${product.id}, this)">
                            </form>
                        </td>
                        <td>${product.createdAt}</td>
                        <td>${product.updatedAt}</td>
                        <td>
                            <button type="button" class="btn btn-primary btn-custom" onclick="enableEditing(this)">編輯</button>
                            <form id="editForm" action="${pageContext.request.contextPath}/products/update/${product.id}" method="post" enctype="multipart/form-data" class="hidden-form">
                                <input type="hidden" name="name" value="${product.name}" class="form-control" readonly>
                                <input type="hidden" name="category" value="${product.category}" class="form-control" readonly>
                                <input type="hidden" name="price" value="${product.price}" class="form-control" readonly>
                                <input type="file" name="file" id="${product.id}">
                                <button type="submit" class="btn btn-success btn-custom" style="display: none;">保存</button>
                            </form>
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
        function enableEditing(button) {
            var row = button.closest('tr');
            var inputs = row.querySelectorAll('input');
            inputs.forEach(input => input.removeAttribute('readonly'));
            row.querySelector('input[type="file"]').style.display = 'block';
            button.style.display = 'none';
            row.querySelector('.btn-success').style.display = 'inline-block';
        }

        function showImageModal(imageUrl) {
            var modal = $('#imageModal');
            var image = modal.find('#previewImage');
            image.attr('src', imageUrl);
            modal.modal('show');
        }
        
        function changeProductName(e) {        	
        	$('#editForm input[name="name"]').val($(e).val());
        	console.log($('#editForm input[name="name"]').val());
        }
        
        function changeProductImage(id, e) {
        	console.log(e.files);
            // Extract the file name
            let fileName = e.files.length > 0 ? e.files[0].name : '';
            
            // Set the value of the input field to the file name
            $('#editForm input[name="file"]').val(fileName);

        	$('#editForm input[name="file"]').val(e.files);
        }
    </script>
</body>
</html>
