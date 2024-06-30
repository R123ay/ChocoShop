<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ruby Choco</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    <style>
        #sec3 .col-12,
        #sec3 .col-12 img {
            transition: .5s;
        }
        .scaleS {
            transform: scale(.8);
            opacity: .3;
        }
        .scaleB {
            transform: scale(1.07);
        }
        .scaleB img {
            box-shadow: 0 -5px 10px var(--c-nav-05);
        }
    </style>
</head>
<body data-bs-spy="scroll" data-bs-target="#navbarMenu" data-bs-offset="200">
    <header class="bg-dark.text-white.text-center.py-3">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center justify-content-center" href="#">
                <img src="${pageContext.request.contextPath}/static/img/logo1.png" alt="品牌圖示">
            </a>
        </div>
    </header>
    <!-- #刪除: 刪除導航部分 -->
    <!-- <nav>
        <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
            <button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button" role="tab" aria-controls="p1" aria-selected="true">精品系列</button>
            <button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button" role="tab" aria-controls="p2" aria-selected="false">送禮首選</button>
            <button class="nav-link" id="p3-tab" data-bs-toggle="tab" data-bs-target="#p3" type="button" role="tab" aria-controls="p3" aria-selected="false">季節限定</button>
            <button class="nav-link" id="p4-tab" data-bs-toggle="tab" data-bs-target="#p4" type="button" role="tab" aria-controls="p4" aria-selected="false">健康享受</button>
        </div>
    </nav> -->

    <section id="sec1" class="pt-5">
        <div id="topSlider" class="carousel slide" data-bs-ride="carousel">
            <div class="400-indicators">
                <button type="button" data-bs-target="#topSlider" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#topSlider" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#topSlider" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <picture>
                        <source media="(min-width: 768px)" srcset="${pageContext.request.contextPath}/static/img/banner1.jpg">
                        <source media="(min-width: 576px)" srcset="${pageContext.request.contextPath}/static/img/banner1.jpg">
                        <img src="${pageContext.request.contextPath}/static/img/banner1.jpg" alt="First slide">
                    </picture>
                </div>
                <div class="carousel-item">
                    <picture>
                        <source media="(min-width: 768px)" srcset="${pageContext.request.contextPath}/static/img/banner2.jpg">
                        <source media="(min-width: 576px)" srcset="${pageContext.request.contextPath}/static/img/banner2.jpg">
                        <img src="${pageContext.request.contextPath}/static/img/banner2.jpg" alt="Second slide">
                    </picture>
                </div>
                <div class="carousel-item">
                    <picture>
                        <source media="(min-width: 768px)" srcset="${pageContext.request.contextPath}/static/img/banner3.png">
                        <source media="(min-width: 576px)" srcset="${pageContext.request.contextPath}/static/img/banner3.png">
                        <img src="${pageContext.request.contextPath}/static/img/banner3.png" alt="Third slide">
                    </picture>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#topSlider" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">上一張</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#topSlider" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">下一張</span>
            </button>
        </div>
    </section>

    <section id="sec2">
        <h2>商品介紹</h2>
        <!-- #新增: 直接展示商品 -->
<div class="container-xl">
    <div class="row">
        <c:forEach var="product" items="${products}">
            <div class="col-12 col-sm-6 col-md-3 p-4" data-no="${product.productId}">
                <img src="${pageContext.request.contextPath}${product.imageUrl}" class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal" data-bs-target="#prodModal" alt="${product.name}">
                <p class="text-center">${product.name}</p>
            </div>
        </c:forEach>
    </div>
</div>

    </section>

    <footer id="contact">
        <h2>Contact Us</h2>
        <p>No. 67, Sec. 3, Minquan E. Rd., Zhongshan Dist., Taipei City</p>
        <p>02-1234-5678</p>
        <p>Ruby.choco@world.com</p>
        <p>Office Hours: Monday to Friday 9:00 am to 6:00 pm, Saturday 9:00 am to 12:00 noon</p>
        <p>© 2024 Ruby Choco | 建議使用 Chrome 瀏覽器 | Maintain by Ruby</p>
    </footer>

<div class="modal fade" id="prodModal" tabindex="-1" aria-labelledby="showProdLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="showProdLabel">商品詳細</h3> <!-- #修改 -->
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 col-sm-6">
                        <img src="" class="d-block mw-100 mx-auto prod-img" alt="">
                    </div>
                    <div class="col-12 col-sm-6">
                        <h3 class="mb-3 mb-sm prod-title">商品名稱</h3>
                        <form>
                            <div class="mb-3">
                                <label for="prodName" class="form-label">品名</label>
                                <input type="text" class="form-control" id="prodName" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="prodCategory" class="form-label">類別</label>
                                <input type="text" class="form-control" id="prodCategory" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="prodPrice" class="form-label">價格</label>
                                <input type="text" class="form-control" id="prodPrice" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="prodDesc" class="form-label">商品描述</label>
                                <textarea class="form-control" id="prodDesc" rows="3" readonly></textarea>
                            </div>
                            <button type="button" class="btn btn-primary" onclick="window.location.href='http://localhost:8080/cart'">購買</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        
	    $('body').on('click', '[data-bs-toggle="modal"]', function () {
	        var productId = $(this).closest('[data-no]').data('no'); // 獲取產品ID
	        $.ajax({
	            url: '${pageContext.request.contextPath}/admin/products/product/' + productId, // 修改URL
	            method: 'GET',
	            success: function (product) {
	                $('#prodModal .prod-title').text(product.name);
	                $('#prodModal #prodName').val(product.name);
	                $('#prodModal #prodCategory').val(product.category);
	                $('#prodModal #prodPrice').val('$' + product.price);
	                $('#prodModal .prod-img').attr('src', '${pageContext.request.contextPath}' + product.imageUrl);
	                $('#prodModal #prodDesc').val(product.description);
	                $('#prodModal').modal('show');
	            }
	        });
	    });


        $('#sec3 .col-12').on('click', function () {
            let no = $(this).attr('data-no');
            $.ajax({
                url: './product/' + no, // 假設有這個端點
                dataType: 'json',
                success: function (product) {
                    $('#prodModal .prod-title').text(product.name);
                    $('#prodModal #prodName').val(product.name);
                    $('#prodModal #prodCategory').val(product.category);
                    $('#prodModal #prodPrice').val('$' + product.price);
                    $('#prodModal .prod-img').attr('src', '${pageContext.request.contextPath}' + product.imageUrl);
                    $('#prodModal #prodDesc').val(product.description);
                    $('#prodModal').modal('show');
                },
            });
        });

    </script>
</body>
</html>
