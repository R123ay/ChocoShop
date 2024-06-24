<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/order.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <script>
        function downloadTableAsCSV(tableId) {
            var table = document.getElementById(tableId);
            var rows = Array.from(table.querySelectorAll('tr'));

            var csvContent = rows.map(function(row) {
                var cols = Array.from(row.querySelectorAll('th, td'));
                return cols.map(function(col) {
                    return '"' + col.innerText.replace(/"/g, '""') + '"';
                }).join(',');
            }).join('\n');
            csvContent = '\uFEFF' + csvContent;

            var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
            var link = document.createElement('a');
            var url = URL.createObjectURL(blob);
            link.setAttribute('href', url);
            link.setAttribute('download', 'orders.csv');
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        function showOrderDetails(orderId) {
            $.get("${pageContext.request.contextPath}/admin/orders/" + orderId, function(data) {
                $('#orderDetailsModal .modal-body').html(data);
                $('#orderDetailsModal').modal('show');
            });
        }
    </script>
</head>
<body>
    <header class="main-header">
        <h1 class="band-name band-name-large">訂單列表</h1>
    </header>
    <section class="container content-section">
        <form action="${pageContext.request.contextPath}/admin/orders" method="get">
            <input type="text" name="keyword" placeholder="搜尋電話或信箱">
            <button type="submit">搜尋</button>
        </form>
        <button onclick="downloadTableAsCSV('orderTable')">下載CSV</button>
        <table id="orderTable" class="table table-striped">
            <thead>
                <tr>
                    <th>訂單編號</th>
                    <th>顧客姓名</th>
                    <th>電話</th>
                    <th>電子信箱</th>
                    <th>付款方式</th>
                    <th>總金額</th>
                    <th>購買日期</th>
                    <th>預定到貨日期</th>
                    <th>詳細資訊</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderId}</td>
                        <td>${order.name}</td>
                        <td>${order.phone}</td>
                        <td>${order.email}</td>
                        <td>${order.paymentMethod}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.purchaseDate}</td>
                        <td>${order.deliveryDate}</td>
                        <td><a href="javascript:void(0);" onclick="showOrderDetails(${order.orderId})">查看</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- Modal -->
    <div class="modal fade" id="orderDetailsModal" tabindex="-1" aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailsModalLabel">訂單詳細資訊</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 訂單詳細資訊內容會被動態加載進來 -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
