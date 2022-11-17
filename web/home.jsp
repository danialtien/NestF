<%-- 
    Document   : newjsp1
    Created on : Sep 20, 2022, 3:59:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ</title>
        <link rel="stylesheet" href="css/styleproduct.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>
    <body>
        <section>
            <div id="navbar" class="sticky-top">
                <nav class="navbar-expand bg-white navbar-light text-center">
                    <ul class="navbar">
                        <li class="nav-item col-2 d-inline-block">
                            <a href="home"><img src="img/logo.png" id="logo" class="col-3"></a>
                        </li>
                        <li class="nav-item col-1 d-inline-block">
                            <a href="shop" class="nav-link">Sản phẩm</a>
                        </li>
                        <li class="nav-item col-1 d-inline-block">
                            <a href="handbook" class="nav-link">Cẩm nang</a>
                        </li>
                        <li class="nav-item col-1 d-inline-block">
                            <a href="about" class="nav-link">Về chúng tôi</a>
                        </li>
                        <li class="nav-item col-3 d-inline-block text-center">
                            <form action="searchAction" method="get" id="search-form">
                                <button type="submit"><i class="fas fa-search    "></i></button>
                                <input type="text" class="text-center" placeholder="Tìm kiếm" name="txtSearch" value="">
                            </form>
                        </li>
                        <li class="nav-item col-2 d-inline-block text-center">                      
                            <c:if test="${not empty sessionScope.USER}">
                                <div id="dropDownMenu" class="d-inline-block position-relative">
                                    <i class="fas fa-user me-2"></i>${sessionScope.USER.name}
                                    <div id="dropDownContent" class="d-none bg-white text-start position-absolute shadow">
                                        <c:if test="${not empty sessionScope.USER}"> 
                                            <a href="account" class="nav-link mb-2 text-decoration-none p-2" id="item">Cài đặt tài khoản</a>
                                        </c:if>
                                        <c:if test="${sessionScope.USER.role eq 'SE'}">
                                            <a href="sellerPage" class="nav-link mb-2 text-decoration-none p-2" id="item">Quản lý đơn hàng</a>
                                        </c:if>
                                        <c:if test="${sessionScope.USER.role eq 'AD'}">
                                            <a href="dashboard" class="nav-link mb-2 text-decoration-none p-2" id="item">Quản lý cửa hàng</a>
                                        </c:if>
                                        <a href="logOut" class="nav-link text-decoration-none p-2" id="item">Đăng xuất</a>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${empty sessionScope.USER}"><div><a href="login" class="nav-link"><i class="fas fa-user    "></i>Đăng nhập</a></div>
                            </c:if>
                        </li>
                        <li class="nav-item col-1 d-inline-block text-center">
                            <div> 
                                <c:if test="${not empty sessionScope.USER}">
                                    <a href="cart" class="nav-link text-center"><i class="fa-solid fa-cart-shopping position-relative">
                                            <span id = "redpoint" class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" style="${empty sessionScope.CART ? 'display: none' : ''}">
                                                <span class="visually-hidden">New alerts</span>
                                            </span>
                                        </i>
                                    </a>
                                </c:if> 
                            </div>                                                    
                        </li>
                        <li class="nav-item col-1 d-inline-block text-center">
                            <div>
                                <c:if test="${not empty sessionScope.USER}">
                                    <jsp:useBean id="formatPrinter" class="com.nestf.util.FormatPrinter"/>
                                    <a href="voucher" class="nav-link text-center">${formatPrinter.noFraction(sessionScope.USER.point)} CP</a>
                                </c:if>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="container">
                <div id="carousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active position-relative">
                            <div id="banner-text" class="position-absolute">
                                <h3>Nest-F</h3>
                                <ul>
                                    <li class="text-start ">• Sử dụng 100% yến sào thiên nhiên</li>
                                    <li>• Không sử dụng hoá chất trong quá trình chế biến </li>
                                    <li>• Sản phẩm được chọn lọc kỹ lưỡng</li>
                                </ul>
                            </div>
                            <img src="img/banner1.jpg"
                                 class="d-block w-100" alt="..."
                                 >
                        </div>
                        <div class="carousel-item">
                            <img src="img/banner2.jpg"
                                 class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <div id="banner-text" class="position-absolute banner3">
                                <h3>Nest-F</h3>
                                <ul>
                                    <li class="text-start ">• Sử dụng 100% yến sào thiên nhiên</li>
                                    <li>• Không sử dụng hoá chất trong quá trình chế biến </li>
                                    <li>• Sản phẩm được chọn lọc kỹ lưỡng</li>
                                </ul>
                            </div>
                            <img src="img/banner3.jpg" class="d-block w-100"
                                 alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon bg-opacity-10 bg-dark" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon bg-opacity-10 bg-dark" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>

                <jsp:useBean id="proFunc" class="com.nestf.product.ProductDTO"/>
                <c:set var="productList" value="${requestScope['BEST_SELL_LIST']}" scope="page"/>
                <div class="best-sell-container">
                    <div class="bestsell-container-spacing pt-3">
                        <div class="bestsell-header-section ms-3">
                            <h3>Sản phẩm bán chạy</h3>
                        </div>
                        <c:if test="${not empty requestScope.BEST_SELL_LIST}">
                            <div class="bestsell-section-content">
                                <div class="image-collapse">
                                    <ul class="image-list row">
                                        <c:forEach var="product" items="${productList}">
                                            <li class="image-contain col-lg-3 col-md-6 position-relative"> 
                                                <c:if test="${product.discountPrice ne 0}">
                                                    <img class="position-absolute" src="img/saleoff2.png" style="width:100px; height:auto"></img>                                             
                                                </c:if>
                                                <div class="image-contain-section mx-2">
                                                    <div class="image-contain-detail">

                                                        <a href="productDetail?productID=${product.productID}" class="product-detail">
                                                            <img src="${product.imagelink[0]}" alt="Image for ${product.name}" class="mx-2">
                                                            <p class="image-title">
                                                                <span class="product-title d-block">${product.name}</span><br>
                                                                <c:if test="${product.discountPrice != 0}">
                                                                    <span
                                                                        class="image-price-discout">${proFunc.printPrice(product.price)}
                                                                    </span>
                                                                    <br>
                                                                    <span class="image-price text-danger">${proFunc.printPrice(product.discountPrice)}
                                                                    </span>
                                                                </c:if>
                                                                <c:if test="${product.discountPrice == 0}">
                                                                    <br><span class="image-price">${proFunc.printPrice(product.price)}</span>
                                                                </c:if>
                                                            </p>
                                                        </a>
                                                    </div>

                                                    <div class="buynow-btn">
                                                        <button class="btn btn-dark" ${product.quantity eq 0 ? 'disabled' : ''} onclick="checkState(${not empty sessionScope.USER ? product.productID : ''})">
                                                            <c:if test="${product.quantity eq 0}">
                                                                <i class="fa-solid fa-cart-xmark"></i> Hết hàng
                                                            </c:if>
                                                            <c:if test="${product.quantity ne 0}">
                                                                <i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ
                                                            </c:if>                                                           
                                                        </button>
                                                        </a>
                                                    </div>

                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="combo-product">
                    <div class="combo-product-spacing d-flex">

                        <div class="combo-product-describe">
                            <h5 class="combo-title">Combo nổi bật</h5>
                            <p>${productList[0].name}: 
                                <c:if test="${productList[0].discountPrice == 0}">
                                    <span class="product-price">${proFunc.printPrice(productList[0].price)}</span>
                                </c:if>
                                <c:if test="${productList[0].discountPrice != 0}">
                                    <span class="product-price">${proFunc.printPrice(productList[0].discountPrice)}</span>
                                </c:if>
                            </p>
                            <p>${productList[1].name}: 
                                <c:if test="${productList[1].discountPrice == 0}">
                                    <span class="product-price">${proFunc.printPrice(productList[1].price)}</span>
                                </c:if>
                                <c:if test="${productList[1].discountPrice != 0}">
                                    <span class="product-price">${proFunc.printPrice(productList[1].discountPrice)}</span>
                                </c:if>
                            </p>
                        </div>
                        <div class="combo-product-image">
                            <img src="${productList[0].imagelink[0]}" alt="Image for ${productList[0].name}" class="ms-2">
                            <span class="plus-product-img">
                                <i class="fa-solid fa-plus"></i>
                            </span>
                            <img src="${productList[1].imagelink[0]}" alt="Image for ${productList[1].name}" class="ms-2">
                        </div>
                        <div class="combo-product-btn">
                            <p>Chỉ với
                                <b>
                                    <c:if test="${productList[0].discountPrice == 0 && productList[1].discountPrice == 0}">
                                        ${proFunc.printPrice(productList[0].price + productList[1].price)}
                                    </c:if>
                                    <c:if test="${productList[0].discountPrice != 0 && productList[1].discountPrice == 0}">
                                        ${proFunc.printPrice(productList[0].discountPrice + productList[1].price)}
                                    </c:if>
                                    <c:if test="${productList[0].discountPrice == 0 && productList[1].discountPrice != 0}">
                                        ${proFunc.printPrice(productList[0].price + productList[1].discountPrice)}
                                    </c:if>
                                    <c:if test="${productList[0].discountPrice != 0 && productList[1].discountPrice != 0}">
                                        ${proFunc.printPrice(productList[0].discountPrice + productList[1].discountPrice)}
                                    </c:if>
                                </b>
                            </p>
                            <c:set var="productCodes" value="${productList[0].productID},${productList[1].productID}"/>
                            <c:if test = "${productList[0].quantity ne 0 && productList[1].quantity ne 0}">
                                <button class="btn btn-dark" onclick="checkState(${not empty sessionScope.USER ? productCodes : ''})">
                                    <i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ
                                </button> 
                            </c:if>                           
                        </div>
                    </div>
                </div>

                <div class="another-suggestion">
                    <div class="another-suggestion-spacing">
                        <div class="suggestion-header-section">
                            <h4>Các gợi ý khác</h4>
                        </div>
                        <c:if test="${requestScope.OTHER_PRODUCT_LIST != null}">
                            <div class="suggestion-content-section">
                                <div class="image-collapse">
                                    <ul class="another-image-list row">
                                        <c:forEach var="anotherSuggest" varStatus="counter" items="${requestScope.OTHER_PRODUCT_LIST}">
                                            <c:if test="${counter.count <= 4}">
                                                <li class="image-contain col-lg-3 col-md-6 position-relative"> 
                                                    <c:if test="${anotherSuggest.discountPrice ne 0}">
                                                        <img class="position-absolute" src="img/saleoff2.png" style="width:100px; height:auto"></img>                                             
                                                    </c:if>
                                                    <div class="image-contain-section mx-2">
                                                        <div class="image-contain-detail">

                                                            <a href="productDetail?productID=${anotherSuggest.productID}" class="product-detail">
                                                                <img src="${anotherSuggest.imagelink[0]}" alt="Image for ${anotherSuggest.name}" class="mx-2">
                                                                <p class="image-title">
                                                                    <span class="product-title d-block">${anotherSuggest.name}</span><br>
                                                                    <c:if test="${anotherSuggest.discountPrice != 0}">
                                                                        <span
                                                                            class="image-price-discout">${proFunc.printPrice(anotherSuggest.price)}
                                                                        </span>
                                                                        <br>
                                                                        <span class="image-price text-danger">${proFunc.printPrice(anotherSuggest.discountPrice)}
                                                                        </span>
                                                                    </c:if>
                                                                    <c:if test="${anotherSuggest.discountPrice == 0}">
                                                                        <br><span class="image-price">${proFunc.printPrice(anotherSuggest.price)}</span>
                                                                    </c:if>
                                                                </p>
                                                            </a>
                                                        </div>

                                                        <div class="buynow-btn">
                                                            <button class="btn btn-dark" ${anotherSuggest.quantity eq 0 ? 'disabled' : ''} onclick="checkState(${not empty sessionScope.USER ? anotherSuggest.productID : ''})">
                                                                <c:if test="${anotherSuggest.quantity eq 0}">
                                                                    <i class="fa-solid fa-cart-xmark"></i> Hết hàng
                                                                </c:if>
                                                                <c:if test="${anotherSuggest.quantity ne 0}">
                                                                    <i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ
                                                                </c:if>
                                                            </button>
                                                        </div>

                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    <a href="shop" class="all-product">
                                        Tất cả sản phẩm
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>

            </div>
            <button type="button" class="btn btn-floating btn-lg position-fixed rounded-circle text-light bottom-25" id="btn-back-to-top">
                <i class="fas fa-arrow-up"></i>
            </button>
            <c:if test="${sessionScope.USER.role eq 'AD'}">
                <a href="dashboard">
                    <button type="button" id="dashboardRedirect" class="btn btn-floating btn-lg rounded-circle text-light position-fixed d-block" title="DASHBOARD">
                        <i class="fa-solid fa-shop"></i>
                    </button>
                </a>
            </c:if>
                            <c:if test="${sessionScope.USER.role eq 'SE'}">
            <a href="sellerPage">
                <button type="button" id="dashboardRedirect" class="btn btn-floating btn-lg rounded-circle text-light position-fixed d-block"  data-bs-toggle="tooltip" data-bs-placement="right" title="DASHBOARD">
                    <i class="fa-solid fa-shop"></i>
                </button>
            </a>
        </c:if>
            <div>
                <span id="triggerSuccess" class="d-none" data-bs-toggle="modal" data-bs-target="#success"></span>                     
                <div class="modal fade" id="success" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">  
                            <div class="text-start m-0 p-0 row d-flex align-items-center container-fluid">
                                <img src="img/success.svg" class="w-25 d-inline-block p-3">
                                <span class="text-center fw-bold d-inline-block w-75 fs-4">Đã thêm vào giỏ!</span> 
                            </div>           
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <span id="triggerFail" class="d-none" data-bs-toggle="modal" data-bs-target="#fail"></span>                     
                <div class="modal fade" id="fail" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">  
                            <div class="text-start m-0 p-0 row d-flex align-items-center container-fluid">
                                <img src="img/fail.svg" class="w-25 d-inline-block p-3">
                                <span class="text-center fw-bold d-inline-block w-75 fs-4">Sản phẩm này đã đạt giới hạn đặt hàng!</span> 
                            </div>           
                        </div>
                    </div>
                </div>
            </div>
            <c:import url="footer.html" charEncoding="UTF-8"/>               
        </section>

        <script src="js/util.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
                                                                function checkState(...productCodes) {
                                                                    if (productCodes.length > 0) {
                                                                        for (let productID of productCodes) {
                                                                            var quantity = 1;
                                                                            addProduct(productID, quantity);
                                                                        }
                                                                    } else {
                                                                        window.location.replace('login');
                                                                    }
                                                                }
                                                                addProduct = (productID, quantity) => {
                                                                    $.ajax({
                                                                        url: "addToCart",
                                                                        method: "GET",
                                                                        cache: "false",
                                                                        data: {
                                                                            productID: productID,
                                                                            quantity: quantity
                                                                        },
                                                                        success: function (state) {
                                                                            console.log(state);
                                                                            if (state == 'success') {
                                                                                document.getElementById("triggerSuccess").click();
                                                                                document.getElementById("redpoint").style.display = 'block';
                                                                            }
                                                                            if (state == 'fail') {
                                                                                document.getElementById("triggerFail").click();
                                                                            }
                                                                        }

                                                                    })
                                                                }
                                                                $('#triggerSuccess').click(function () {
                                                                    setTimeout(function () {
                                                                        $('#success').modal('hide');
                                                                    }, 1500);
                                                                });
                                                                $('#triggerFail').click(function () {
                                                                    setTimeout(function () {
                                                                        $('#fail').modal('hide');
                                                                    }, 1500);
                                                                });
        </script>
    </body>
</html>
