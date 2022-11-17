<%-- 
    Document   : newjsp
    Created on : Sep 20, 2022, 4:05:05 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.nestf.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sản phẩm</title>
        <link rel="stylesheet" href="css/styleproduct.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
                            <a href="shop" class="nav-link current-tab disabled">Sản phẩm</a>
                        </li>
                        <li class="nav-item col-1 d-inline-block">
                            <a href="handbook" class="nav-link">Cẩm nang</a>
                        </li>
                        <li class="nav-item col-1 d-inline-block">
                            <a href="about" class="nav-link">Về chúng tôi</a>
                        </li>
                        <li class="nav-item col-3 d-inline-block text-center">
                            <form action="searchAction" method="GET" id="search-form">
                                <button type="submit"><i class="fas fa-search"></i></button>
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
            <div class="container bg-white shop-container">
                <div class="filter-header">
                    <form class="form-horizontal" action="FilterController" method="POST">
                        <div class="m-auto" id="filter">
                            <h4 class="category-title d-inline-block">Phân loại</h4>
                            <select class="form-controls category-option" name="categoryFilter" onchange="filter(this)">
                                <option value="empty"></option>
                                <option value="yenTho">Tổ yến thô</option>
                                <option value="yenTinhChe">Tổ yến tinh chế</option>
                                <option value="yenChungTuoi">Yến chưng tươi</option>
                                <option value="yenChungSan">Yến chưng sẵn</option>
                            </select>
                            <select class="form-controls category-option" name="priceFilter" onchange="filter(this)">
                                <option value="empty"></option>
                                <option value="below1">Dưới 1.000.000 đ</option>
                                <option value="1to2">Từ 1.000.000 đ ~ 2.000.000 đ</option>
                                <option value="2to3">Từ 2.000.000 đ ~ 3.000.000 đ</option>
                                <option value="3to4">Từ 3.000.000 đ ~ 4.000.000 đ</option>
                                <option value="over4">Trên 4.000.000 đ</option>
                            </select>
                        </div>
                    </form>

                </div>
                <c:if test="${requestScope.LIST_PRODUCT != null}">
                    <c:if test="${not empty requestScope.LIST_PRODUCT}">
                        <div class="product-content">
                            <jsp:useBean id="productFunc" class="com.nestf.product.ProductDTO"/>
                            <div class="row col-11 m-auto list-product-shop">
                                <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                                    <c:if test="${product.status}">
                                        <div class="col-lg-3 col-md-4 product-contain-detail">
                                            <div class="product-image-contain-detail position-relative">
                                                <a href="productDetail?productID=${product.productID}" class="product-detail">
                                                    <img class="img-responsive"
                                                         src="${product.imagelink[0]}" width="200px" height="200px" alt="${product.name}" class="mx-2">
                                                    <c:if test="${product.discountPrice ne 0}">
                                                        <img class="saleoff position-absolute" src="img/saleoff2.png" width="100px">                                              
                                                    </c:if>
                                                    <p class="image-title">
                                                        <span class="product-title d-block">${product.name}</span>
                                                        <br>
                                                        <c:if test="${product.discountPrice != 0}">
                                                            <span
                                                                class="image-price-discout">${productFunc.printPrice(product.price)}
                                                            </span>
                                                            <br>
                                                            <span class="image-price text-danger">${productFunc.printPrice(product.discountPrice)}
                                                            </span>
                                                        </c:if>
                                                        <c:if test="${product.discountPrice == 0}">
                                                            <br><span class="image-price">${productFunc.printPrice(product.price)}</span>
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
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:if>
            <div class="load-more-section">
                <div id="load-more">Xem thêm</div>
            </div>
            <button type="button" class="btn btn-floating btn-lg position-fixed rounded-circle text-light bottom-25" id="btn-back-to-top">
                <i class="fas fa-arrow-up"></i>
            </button>
            <c:if test="${sessionScope.USER.role eq 'AD'}">
                <a href="dashboard">
                    <button type="button" id="dashboardRedirect" class="btn btn-floating btn-lg rounded-circle text-light position-fixed d-block"  data-bs-toggle="tooltip" data-bs-placement="right" title="DASHBOARD">
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
            function filter(e){
                var form = $(e).closest('form');
                form.submit();
            }
        </script>
        <script>
                                                    let loadMoreBtn = document.querySelector('#load-more');
                                                    let currentItem = 8;

                                                    loadMoreBtn.onclick = () => {
                                                        let boxes = [...document.querySelectorAll('.product-contain-detail')];
                                                        for (var i = currentItem; i < currentItem + 4 && i < boxes.length; i++) {
                                                            boxes[i].style.display = 'block';
                                                        }
                                                        currentItem += 4;

                                                        if (currentItem >= boxes.length) {
                                                            loadMoreBtn.style.display = 'none';
                                                        }
                                                    }
        </script>
        <script>
            function checkState(productCode) {
                if (productCode != null) {
                    var productID = productCode;
                    var quantity = 1;
                    addProduct(productID, quantity);
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
