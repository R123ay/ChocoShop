<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="zh-Hant">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>商品上架</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@400;500;600;700&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
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

                    body {
                        font-family: 'Noto Sans TC', sans-serif;
                        background-color: #1c0a01;
                        margin: 0;
                        padding: 0;
                        height: 100vh;
                        display: flex;
                        flex-direction: column;
                    }

                    .header {
                        background-color: #1c0a01;
                        padding: 1rem;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        color: #ffa140;
                    }

                    .logo-container {
                        display: flex;
                        align-items: center;
                    }

                    .logo-container img {
                        max-width: 180px;
                        margin-right: 10px;
                    }

                    .admin-title {
                        font-size: 24px;
                        font-weight: 700;
                        text-align: center;
                        flex: 1;
                    }

                    .navbar {
                        display: none;
                    }

                    .navbar .nav-link {
                        color: #ffa140;
                        font-weight: bold;
                        text-decoration: none;
                        transition: color 0.3s ease;
                    }

                    .navbar .nav-link:hover {
                        color: #ffa140;
                        text-decoration: underline;
                    }

                    .navbar .nav-link:focus {
                        color: #ffc107;
                        outline: none;
                    }

                    .container.admin-container {
                        background-color: #fff;
                        padding: 2rem;
                        border-radius: 10px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        max-width: 1200px;
                        width: 100%;
                        margin-top: 20px;
                        flex: 1;
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                    }

                    .content {
                        margin-top: 1.5rem;
                    }

                    @media (max-width: 768px) {
                        .header {
                            justify-content: center;
                            position: relative;
                        }

                        .logo-container,
                        .admin-title {
                            margin-top: 10px;
                            text-align: center;
                        }

                        .btn-primary-nav {
                            position: absolute;
                            left: 10px;
                            top: 10px;
                            background-color: #1c0a01;
                            /* 更改按鈕背景顏色 */
                            border-color: #ffa140;
                            /* 更改按鈕邊框顏色 */
                        }

                        .btn-primary-nav:hover {
                            background-color: #ffa140;
                            /* 更改按鈕懸停時的背景顏色 */
                            border-color: #1c0a01;
                            /* 更改按鈕懸停時的邊框顏色 */
                        }

                        .navbar-toggler-icon {
                            display: inline-block;
                            width: 24px;
                            height: 24px;
                            vertical-align: middle;
                            content: "";
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%23ffa140' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        .btn-primary-nav:hover .navbar-toggler-icon {
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%231c0a01' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        .btn-primary-nav:focus,
                        .btn-primary-nav:active,
                        .btn-primary-nav:focus-visible {
                            background-color: #1c0a01;
                            border-color: #ffa140;
                            box-shadow: none;
                            /* 移除按下時的陰影效果 */
                        }

                        .btn-primary-nav:focus .navbar-toggler-icon,
                        .btn-primary-nav:active .navbar-toggler-icon,
                        .btn-primary-nav:focus-visible .navbar-toggler-icon {
                            background: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='%23ffa140' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E") center/cover no-repeat;
                        }

                        /* 新增導覽列背景顏色和文字顏色 */
                        .navbar {
                            background-color: #1c0a01;
                            /* 修改背景顏色 */
                        }

                        .navbar .nav-link {}

                        .navbar .nav-link:hover {
                            color: #ffc107;
                            /* 修改懸停時文字顏色 */
                        }
                    }

                    .offcanvas-half-width {
                        width: 40%;
                        background-color: #1c0a01;
                        color: #ffa140;

                        /* 修改文字顏色 */
                        .navbar .nav-link:hover {
                            color: #ffc107;
                            /* 修改懸停時文字顏色 */
                        }
                    }

                    .offcanvas-half-width .nav-link {
                        color: #ffa140;
                    }

                    .navbar .nav-link:hover {
                        color: #ffa140;
                        text-decoration: underline;
                    }
                </style>
            </head>

            <body>
                <div class="header">
                    <div class="logo-container">
                        <button class="btn btn-primary-nav d-md-none" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <img src="${pageContext.request.contextPath}/static/img/logo2.png" alt="品牌圖示">
                        <div class="admin-title">後台管理-商品上架</div>
                    </div>
                    <nav class="navbar d-none d-md-flex">
                        <a class="nav-link" href="<c:url value='/admin/products' />">商品上架</a>
                        <a class="nav-link" href="<c:url value='/admin/orders' />">客戶訂單</a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/" target="_blank">首頁官網</a>
                        <a class="nav-link" href="<c:url value='/cart' />" target="_blank">顧客購買</a>
                    </nav>
                </div>
                <div class="offcanvas offcanvas-start offcanvas-half-width" tabindex="-1" id="offcanvasNavbar"
                    aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">導航選單</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                            aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <nav class="navbar-nav">
                            <a class="nav-link" href="<c:url value='/admin/products' />">商品上架</a>
                            <a class="nav-link" href="<c:url value='/admin/orders' />">客戶訂單</a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/" target="_blank">首頁官網</a>
                            <a class="nav-link" href="<c:url value='/cart' />" target="_blank">顧客購買</a>
                        </nav>
                    </div>
                </div>
                <div class="container admin-container">
                    <!-- <h1 class="mt-4">產品管理</h1> -->

                    <div class="d-flex mb-4 align-items-center">
                        <form action="${pageContext.request.contextPath}/admin/products/search" method="get"
                            class="form-inline mr-2 d-flex ml-auto">
                            <div class="input-group">
                                <input type="text" name="keyword" class="form-control" placeholder="輸入品名或類別搜尋商品">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary">搜尋</button>
                                </div>
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-success ml-2" data-toggle="modal"
                                        data-target="#addProductModal">新增</button>
                                </div>
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-info ml-2"
                                        onclick="downloadTableAsCSV('productTable')">下載 CSV</button>
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
    <td>${product.name}</td>
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
        <button type="button" class="btn btn-primary btn-custom" onclick="showEditModal(${product.productId}, '${product.name}', '${product.category}', ${product.price}, '${product.imageUrl}', '${product.description}')">編輯</button>
        <a href="${pageContext.request.contextPath}/admin/products/delete/${product.productId}" class="btn btn-danger btn-custom" style="display:inline;">刪除</a>
    </td>
</tr>
</c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog"
                    aria-labelledby="addProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProductModalLabel">新增商品</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="${pageContext.request.contextPath}/admin/products/add" method="post"
                                    enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="add-name">品名</label>
                                        <input type="text" class="form-control" id="add-name" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="add-category">類別</label>
                                        <input type="text" class="form-control" id="add-category" name="category"
                                            required>
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

                <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog"
                    aria-labelledby="editProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProductModalLabel">編輯商品</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="editProductForm"
                                    action="${pageContext.request.contextPath}/admin/products/update" method="post"
                                    enctype="multipart/form-data">
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
                                        <input type="text" class="form-control" id="edit-category" name="category"
                                            required>
                                    </div>
                                    <div class="form-group">
                                        <label for="edit-price">價格</label>
                                        <input type="number" class="form-control" id="edit-price" name="price" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="edit-imageUrl">商品照片</label>
                                        <input type="file" class="form-control" id="edit-imageUrl" name="file">
                                    </div>
				                    <div class="form-group">
				                        <label for="edit-description">描述</label>
				                        <textarea class="form-control" id="edit-description" name="description" rows="3" required></textarea>
				                    </div>                                    
                                    <button type="submit" class="btn btn-success">保存</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel"
                    aria-hidden="true">
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
            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script>
	            function showEditModal(productId, name, category, price, imageUrl, description) {
	                $('#edit-id').val(productId);
	                $('#edit-name').val(name);
	                $('#edit-category').val(category);
	                $('#edit-price').val(price);
	                $('#edit-description').val(description); // 新增
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

                    var csvContent = rows.map(function (row) {
                        var cols = Array.from(row.querySelectorAll('th, td'));
                        return cols.filter(function (col, index) {
                            return !excludeIndexes.includes(index);
                        }).map(function (col) {
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

            </html>