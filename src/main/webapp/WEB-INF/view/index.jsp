<%@ page contentType="text/html; charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="zh-TW">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ruby Choco</title>
        <!--  --><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/index.css">
    </head>

    <body data-bs-spy="scroll" data-bs-target="#navbarMenu" data-bs-offset="200">
        <!--頁首header============================================= -->
        <header class="bg-dark.text-white.text-center.py-3">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center justify-content-center" href="#">
                    <img src="${pageContext.request.contextPath}/static/img/logo1.png" alt="品牌圖示">
                </a>
            </div>
        </header>

        <!--導航nav============================================= -->
        <nav class="navbar navbar-expand-md navbar-dark bg-custom-dark fixed-top">
            <div class="container-xl">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu"
                    aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarMenu">
                    <ul class="navbar-nav ms-auto mb-2 mb-md-0 ps-5 ps-md-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#sec1">首頁</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#sec2">商品訂購</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#sec3">購物車</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#sec4">聯絡我們</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!--sec區域============================================= -->
        <section id="sec1" class="pt-5">
            <!-- 這裡開始定義了一個名叫 sec1 的區域，並且增加了一點上邊距來讓它不會太靠上 -->

            <div id="topSlider" class="carousel slide" data-bs-ride="carousel">
                <!-- 這個部分是一個輪播，就是可以自動播放圖片的區域 -->

                <div class="carousel-indicators">
                    <!-- 這裡是用來顯示圖片切換的小圓點 -->
                    <button type="button" data-bs-target="#topSlider" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#topSlider" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#topSlider" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>

                <div class="carousel-inner">
                    <!-- 這裡包含了所有要顯示的圖片 -->

                    <div class="carousel-item active">
                        <!-- 這是一張圖片，現在正在顯示 -->
                        <picture>
                            <source media="(min-width: 768px)"
                                srcset="${pageContext.request.contextPath}/static/img/banner1.jpg">
                            <!-- 當螢幕寬度大於768像素時顯示這張圖片 -->
                            <source media="(min-width: 576px)"
                                srcset="${pageContext.request.contextPath}/static/img/banner1.jpg">
                            <!-- 當螢幕寬度大於576像素時顯示這張圖片 -->
                            <img src="${pageContext.request.contextPath}/static/img/banner1.jpg" alt="First slide">
                            <!-- 這是顯示圖片的標籤 -->
                        </picture>
                    </div>

                    <div class="carousel-item">
                        <!-- 這是另一張圖片，現在還沒顯示 -->
                        <picture>
                            <source media="(min-width: 768px)"
                                srcset="${pageContext.request.contextPath}/static/img/banner2.jpg">
                            <source media="(min-width: 576px)"
                                srcset="${pageContext.request.contextPath}/static/img/banner2.jpg">
                            <img src="${pageContext.request.contextPath}/static/img/banner2.jpg" alt="Second slide">
                        </picture>
                    </div>

                    <div class="carousel-item">
                        <!-- 這是第三張圖片 -->
                        <picture>
                            <source media="(min-width: 768px)"
                                srcset="${pageContext.request.contextPath}/static/img/banner3.png">
                            <source media="(min-width: 576px)"
                                srcset="${pageContext.request.contextPath}/static/img/banner3.png">
                            <img src="${pageContext.request.contextPath}/static/img/banner3.png" alt="Third slide">
                        </picture>
                    </div>
                </div>

                <button class="carousel-control-prev" type="button" data-bs-target="#topSlider" data-bs-slide="prev">
                    <!-- 這個按鈕用來顯示上一張圖片 -->
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">上一張</span>
                </button>

                <button class="carousel-control-next" type="button" data-bs-target="#topSlider" data-bs-slide="next">
                    <!-- 這個按鈕用來顯示下一張圖片 -->
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">下一張</span>
                </button>
            </div>
        </section>

        <!-- 5/30開始更改 -->
        <section id="sec2">
            <!-- 定義了一個 section 元素，ID 為 sec2 -->
            <h2>商品介紹</h2>
            <!-- 標題，顯示 "來點...巧克力" -->
            <nav>
                <!-- 定義了一個導航元素 -->
                <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
                    <!-- 包含導航標籤的 div 元素，設置為使用 nav-tabs 類型，並讓內容居中 -->
                    <!-- id="nav-tab"：設置元素的 ID 以便於 CSS 或 JavaScript 參照 -->
                    <!-- role="tablist"：標示這個元素是一個標籤列表 -->

                    <button class="nav-link active" id="p1-tab" data-bs-toggle="tab" data-bs-target="#p1" type="button"
                        role="tab" aria-controls="p1" aria-selected="true">精品系列</button>
                    <!-- 第一個標籤按鈕，設置為當前活躍的標籤 -->
                    <!-- class="nav-link active"：設置按鈕為導航連結並且是當前活躍狀態 -->
                    <!-- id="p1-tab"：設置按鈕的 ID -->
                    <!-- data-bs-toggle="tab"：設置按鈕點擊後觸發 tab 切換 -->
                    <!-- data-bs-target="#p1"：設置按鈕點擊後切換到的目標 tab ID -->
                    <!-- type="button"：設置按鈕類型 -->
                    <!-- role="tab"：標示這個按鈕是一個標籤 -->
                    <!-- aria-controls="p1"：設置這個標籤控制的內容 ID -->
                    <!-- aria-selected="true"：標示這個標籤是被選中的狀態 -->

                    <button class="nav-link" id="p2-tab" data-bs-toggle="tab" data-bs-target="#p2" type="button"
                        role="tab" aria-controls="p2" aria-selected="false">送禮首選</button>

                    <button class="nav-link" id="p3-tab" data-bs-toggle="tab" data-bs-target="#p3" type="button"
                        role="tab" aria-controls="p3" aria-selected="false">季節限定</button>

                    <button class="nav-link" id="p4-tab" data-bs-toggle="tab" data-bs-target="#p4" type="button"
                        role="tab" aria-controls="p4" aria-selected="false">健康享受</button>
                </div>
            </nav>

            <div class="tab-content" id="nav-tabContent">
                <!-- 定義了一個包含標籤內容的 div 元素 -->
                <!-- class="tab-content"：設置這個元素為標籤內容容器 -->
                <!-- id="nav-tabContent"：設置元素的 ID 以便於 CSS 或 JavaScript 參照 -->

                <div class="tab-pane fade show active" id="p1" role="tabpanel" aria-labelledby="p1-tab">
                    <!-- 第一個標籤內容，設置為當前顯示的內容 -->
                    <!-- class="tab-pane fade show active"：設置這個內容為標籤頁，並且為當前顯示狀態 -->
                    <!-- id="p1"：設置內容的 ID -->
                    <!-- role="tabpanel"：標示這個元素是一個標籤面板 -->
                    <!-- aria-labelledby="p1-tab"：設置這個面板由哪個標籤控制 -->

                    <div class="container-xl">
                        <div class="row">
                            <h3 class="text-center m-md-2"></h3>
                            <div class="col-12 col-sm-4 col-md-3 p-4" data-no="1">
                                <img src="${pageContext.request.contextPath}/static/img/1_boutique/1_dark_chocolate_truffle.png"
                                    class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                    data-bs-target="#prodModal" alt="">
                                <p class="text-center">黑松露巧克力</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 p-4" data-no="2">
                                <img src="${pageContext.request.contextPath}/static/img/1_boutique/2_dark chocolate_gold.png"
                                    class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                    data-bs-target="#prodModal" alt="">
                                <p class="text-center">金箔黑巧</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 p-4" data-no="3">
                                <img src="${pageContext.request.contextPath}/static/img/1_boutique/3_dark_chocolate_almond_crisps.png"
                                    class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                    data-bs-target="#prodModal" alt="">
                                <p class="text-center">黑巧克力杏仁脆片</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 p-4" data-no="4">
                                <img src="${pageContext.request.contextPath}/static/img/1_boutique/4_dark_chocolate_blackberry.png"
                                    class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                    data-bs-target="#prodModal" alt="">
                                <p class="text-center">黑莓巧克力</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <!-- 其他 tab-pane 可以在這裡定義 -->


            <!-- 以下待完成=========================  -->

            <div class="tab-pane fade" id="p2" role="tabpanel" aria-labelledby="p2-tab">
                <div class="container-xl">
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p2_1.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">牛奶巧克力榛果</p>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p2_2.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">白巧克力莓果</p>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p2_3.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">焦糖牛奶巧克力</p>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p2_4.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">抹茶白巧克力</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="p3" role="tabpanel" aria-labelledby="p3-tab">
                <div class="container-xl">
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p3_1.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">春季櫻花巧克力</p>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p3_2.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">夏季薄荷巧克力</p>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p3_3.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">秋季南瓜香料巧克力</p>
                        </div>
                        <div class="col-12 col-sm-6 col-md-3 p-4">
                            <img src="${pageContext.request.contextPath}/static/img/sec3p3_4.jpg"
                                class="d-block mw-100 mx-auto rounded mb-2" data-bs-toggle="modal"
                                data-bs-target="#prodModal" alt="">
                            <p class="text-center">冬季熱可可巧克力</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- 結束 tab-content 容器 -->

        </section>
        <!-- 結束 section 元素 -->

        <footer id="contact">
            <h2>Contact Us</h2>
            <p>No. 67, Sec. 3, Minquan E. Rd., Zhongshan Dist., Taipei City</p>
            <p>02-1234-5678</p>
            <p>Ruby.choco@world.com</p>
            <p>Office Hours: Monday to Friday 9:00 am to 6:00 pm, Saturday 9:00 am to 12:00 noon</p>
            <p>© 2024 Ruby Choco | 建議使用 Chrome 瀏覽器 | Maintain by Ruby</p>
        </footer>

        <!-- Button trigger modal -->
        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#prodModal">
Launch demo modal
</button> -->
        <!-- 按鈕觸發模態框（已註釋掉） -->

        <!-- Modal -->
        <div class="modal fade" id="prodModal" tabindex="-1" aria-labelledby="showProdLabel" aria-hidden="true">
            <!-- 定義模態框 -->
            <!-- class="modal fade"：模態框，使用淡入效果 -->
            <!-- id="prodModal"：設置模態框的 ID -->
            <!-- tabindex="-1"：模態框不在 tabindex 順序中 -->
            <!-- aria-labelledby="showProdLabel"：設置模態框標題的 ID -->
            <!-- aria-hidden="true"：設置模態框初始隱藏 -->

            <div class="modal-dialog modal-xl">
                <!-- 模態框對話框，使用超大尺寸 -->
                <div class="modal-content">
                    <!-- 模態框內容 -->

                    <div class="modal-header">
                        <!-- 模態框頭部 -->
                        <h3 class="modal-title" id="showProdLabel">系列名稱</h3>
                        <!-- 模態框標題 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <!-- 關閉模態框按鈕 -->
                    </div>

                    <div class="modal-body">
                        <!-- 模態框主體 -->

                        <div class="row">
                            <!-- 行 -->
                            <div class="col-12 col-sm-6">
                                <!-- 列，佔據一半寬度在小螢幕以上 -->
                                <img src="" class="d-block mw-100 mx-auto prod-img" alt="">
                                <!-- 商品圖片 -->
                                <!-- class="d-block mw-100 mx-auto prod-img"：顯示為塊級元素，最大寬度 100%，自動居中，商品圖片類 -->
                            </div>
                            <div class="col-12 col-sm-6">
                                <!-- 列，佔據一半寬度在小螢幕以上 -->
                                <h3 class="mb-3 mb-sm prod-title">商品名稱</h3>
                                <!-- 商品標題 -->
                                <div class="prod-desc"></div>
                                <!-- 商品描述 -->
                            </div>
                        </div>

                        <button type="button" class="btn-close float-end p-4 p-lg-3" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                        <!-- 模態框內的關閉按鈕 -->

                        <div class="prod-desc"></div>
                        <!-- 商品描述 -->
                    </div>
                </div>

                <button type="button" class="btn-close float-end p-4 p-lg-3" data-bs-dismiss="modal"
                    aria-label="Close"></button>
                <!-- 模態框內的關閉按鈕 -->
            </div>
        </div>
        </div>

        <style>
            #sec3 .col-12,
            #sec3 .col-12 img {
                transition: .5s;
                /* 圖片和容器的過渡效果為 0.5 秒 */
            }

            .scaleS {
                transform: scale(.8);
                /* 縮小效果 */
                opacity: .3;
                /* 不透明度降低 */
            }

            .scaleB {
                transform: scale(1.07);
                /* 放大效果 */
            }

            .scaleB img {
                box-shadow: 0 -5px 10px var(--c-nav-05);
                /* 放大圖片時的陰影效果 */
            }
        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- 引入 Bootstrap 的 JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
        <!-- 引入 jQuery -->

        <script>
            // header ===========================================
            // 當是桌機版時.....進行以下工作
            if ($('.navbar-toggler').is(':hidden')) {
                // 當 window 視窗 scroll 捲動時
                $(window).on('scroll', function () {
                    // if 判斷捲出的範圍是否已大於 header 的高度
                    if ($('html').scrollTop() > $('header').innerHeight()) {
                        // 如果是, 則 header 應該 addClass('fixed')
                        $('header').addClass('fixed');
                    }
                    if ($('html').scrollTop() == 0) {
                        // 當滾動到頂部時，移除 fixed 類
                        $('header').removeClass('fixed');
                    }
                });
            }

            if ($('.navbar-toggler').is(':visible')) {
                // 當 navbar-toggler 可見時（移動端）
                $('.navbar-collapse .nav-link').on('click', function () {
                    // 原來的滑動效果依舊, 再執行 .ctr-collapse 自動觸發 click
                    $('.ctr-collapse').trigger('click');
                });

                $('.offcanvas .nav-link').on('click', function () {
                    // 原來的滑動效果依舊, 再執行 .ctr-offcanvas 自動觸發 click
                    $('.ctr-offcanvas').trigger('click');
                });
            }

            // #sec3 ===========================================
            $('#sec3 .col-12').on('mouseenter', function () {
                // 當滑鼠進入 .col-12 時
                $(this).addClass('scaleB');
                // 添加 scaleB 類
                $(this).siblings().addClass('scaleS');
                // 其兄弟元素添加 scaleS 類
            });

            $('#sec3 .col-12').on('mouseleave', function () {
                // 當滑鼠離開 .col-12 時
                $(this).removeClass('scaleB');
                // 移除 scaleB 類
                $(this).siblings().removeClass('scaleS');
                // 其兄弟元素移除 scaleS 類
            });

            // 載入外部 JSON 資料檔案
            let prod_class_array = [];
            let prod_name_array = [];
            let prod_img_array = [];
            let prod_desc_array = [];

            $.ajax({
                url: './Timothy_product.json',
                // 資料來源的 URL
                dataType: 'json',
                // 資料格式為 JSON
                success: function (data) {
                    // 成功載入資料後執行
                    console.log(data);

                    $.each(data, function (i, prodArray) {
                        // 遍歷每個商品數組
                        $.each(prodArray, function (label, value) {
                            // 根據標籤分類資料
                            switch (label) {
                                case 'prod_class': prod_class_array.push(value); break;
                                case 'prod_name': prod_name_array.push(value); break;
                                case 'prod_img': prod_img_array.push(value); break;
                                case 'prod_desc': prod_desc_array.push(value); break;
                            }
                        });
                    });

                    console.log(prod_desc_array);
                },
                // error: function () {
                //   // 載入資料失敗時執行
                //   alert('404....error......');
                // }
            });

            $('#sec3 .col-12').on('click', function () {
                // 當 .col-12 被點擊時
                let no = $(this).attr('data-no') - 1;
                // 獲取 data-no 屬性並減去 1
                $('#prodModal .modal-title').text(prod_class_array[no]);
                // 設置模態框標題
                $('#prodModal .prod-title').text(prod_name_array[no]);
                // 設置模態框商品名稱
                $('#prodModal .prod-img').attr('src', '${pageContext.request.contextPath}/static/img/care_prod_b/' + prod_img_array[no]);
                // 設置模態框商品圖片
                $('#prodModal .prod-desc').html(prod_desc_array[no]);
                // 設置模態框商品描述
            });
        </script>
    </body>

    </html>