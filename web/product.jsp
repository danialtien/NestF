<%-- 
    Document   : newjsp1
    Created on : Sep 20, 2022, 4:05:11 PM
    Author     : Admin
--%>

<%@page import="com.nestf.product.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>${requestScope.PRODUCT_DETAIL.name}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link href="css/nestf.css" rel="stylesheet">       
    </head>

    <body class="text-center">       
        <div id="navbar" class="sticky-top">
            <nav class="navbar-expand bg-white navbar-light">
                <ul class="navbar">
                    <li class="nav-item col-2 d-inline-block">
                        <a href="home"><img src="img/logo.png" id="logo" class="col-3"></a>
                    </li>
                    <li class="nav-item col-1 d-inline-block">
                        <a href="shop" class="nav-link text-center">Sản phẩm</a>
                    </li>
                    <li class="nav-item col-1 d-inline-block">
                        <a href="handbook" class="nav-link text-center">Cẩm nang</a>
                    </li>
                    <li class="nav-item col-1 d-inline-block">
                        <a href="about" class="nav-link text-center">Về chúng tôi</a>
                    </li>
                    <li class="nav-item col-3 d-inline-block text-center">
                        <form action="searchAction" method="get" id="search-form">
                            <button type="submit" class="border-0 bg-transparent"><i class="fas fa-search    "></i></button>
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
                                        <span id="redpoint" class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" style="${empty sessionScope.CART ? 'display: none' : ''}">
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
        <div id="white-board" class="bg-white w-75">
            <div class="row container-fluid m-0">
                <c:if test="${requestScope.PRODUCT_DETAIL != null}">
                    <c:set var="productDetail" value="${requestScope['PRODUCT_DETAIL']}" scope="page"/>
                    <jsp:useBean id="productFunc" class="com.nestf.product.ProductDTO"/>
                    <div class="d-inline-block col-5 mt-3">
                        <div class="imgBox">
                            <img src="${productDetail.imagelink[0]}" class="rounded col-11 border border-dark">
                        </div>
                        <ul class="thumb list-unstyled d-flex row text-center mt-3">
                            <c:forEach var="image" items="${productDetail.imagelink}" varStatus="counter">
                                <li class="col">
                                    <a href="${image}" target="imgBox"><img src="${image}" class="border border-dark rounded" width="50px"></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>     
                    <div class="d-inline-block col-7">
                        <span class="text-center fs-2 mt-3 mb-2 d-block fw-bold">${productDetail.name}</span>
                        <span class="d-inline-block pb-3 fs-5 text-danger">
                            <c:if test="${productDetail.discountPrice ne 0}">
                                ${productFunc.printPrice(productDetail.discountPrice)}
                                <span class="text-muted text-decoration-line-through ms-3">
                                    ${productFunc.printPrice(productDetail.price)}
                                </span>
                            </c:if>
                            <c:if test = "${productDetail.discountPrice eq 0}">
                                <span class="text-black">
                                    ${productFunc.printPrice(productDetail.price)}
                                </span>
                            </c:if>
                        </span>
                        <div class="text-start ps-4">${productDetail.productDes}</div>
                    </div>
                </c:if>           
            </div>

            <div id="number-toggle" class="text-center col-7">
                <c:if test="${productDetail.status eq true}">
                    <c:if test="${productDetail.quantity ne 0}">
                        <div class="input-group d-inline-block">
                            <form action="addToCart">
                                <input type="hidden" id="productID" name="productID" value="${productDetail.productID}"/>
                                <img src="img/plus.svg" data-field="quantity" class="button-plus d-inline-block">
                                <input required id="number-input" type="number" step="1" value="1" min="1" max="${productDetail.quantity}" onblur="minCheck(this), maxCheck(this)" name="quantity" class="quantity-field text-center p-0">
                                <img src="img/minus.svg" data-field="quantity" class="button-minus d-inline-block"><br>
                                <button type="submit" id="buy-button" class="col-3 me-2 border rounded" value="true" name="buynow">Mua ngay</button>
                                <button type="button" id="buy-button" class="col-3 ms-2 bg-white text-black border border-dark rounded" onclick="checkState(${not empty sessionScope.USER ? productDetail.productID : 'null'}, this)"><img src="img/cart.svg" class="me-2">Thêm vào giỏ</button>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${productDetail.quantity eq 0}">
                        <h1 class="text-danger text-center">HẾT HÀNG</h1>
                    </c:if>
                </c:if>
                <c:if test="${productDetail.status eq false}">
                    <h1 class="text-danger text-center">NGỪNG KINH DOANH</h1>
                </c:if>     
            </div>
            <br>
            <div class="container-fluid">
            </div>
        </div>
        <div id="white-board" class="bg-white w-75">
            <h4 class="text-start pt-4 ms-4">Sản phẩm cùng loại</h4>
            <c:if test="${requestScope.LIST_RELATE_PRODUCT != null}">
                <div class="row col-11 m-auto">
                    <c:forEach var="otherProduct" varStatus="counter" items="${requestScope.LIST_RELATE_PRODUCT}">
                        <c:if test="${counter.count <= 4}">
                            <div id="item" class="col-lg-3 col-md-4 d-inline-block p-3">
                                <a href="productDetail?productID=${otherProduct.productID}" 
                                   style="color: #000;
                                   text-decoration: none">
                                    <img src="${otherProduct.imagelink[0]}" class="mb-2">
                                    <h6 class="product-title">${otherProduct.name}</h6>
                                    <c:if test="${otherProduct.discountPrice != 0}">
                                        <span class="text-muted text-decoration-line-through">${productFunc.printPrice(otherProduct.price)}</span>
                                        <br>
                                        <span class="text-danger">${productFunc.printPrice(otherProduct.discountPrice)}</span><br>
                                    </c:if>
                                    <c:if test="${otherProduct.discountPrice == 0}">
                                        <br><span>${productFunc.printPrice(otherProduct.price)}</span><br>
                                    </c:if>
                                </a>
                                <div class="buynow-btn mt-2">
                                    <button class="btn btn-dark" ${otherProduct.quantity eq 0 ? 'disabled' : ''} onclick="checkState(${not empty sessionScope.USER ? otherProduct.productID : ''})">
                                        <c:if test="${otherProduct.quantity eq 0}">
                                            <i class="fa-solid fa-cart-xmark"></i> Hết hàng
                                        </c:if>
                                        <c:if test="${otherProduct.quantity ne 0}">
                                            <i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ
                                        </c:if>
                                    </button>
                                </div>

                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </c:if>
            <a href="ShopPageController" class="nav-link pb-3">Tất cả sản phẩm</a>
        </div>
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
        <button type="button" class="btn btn-floating btn-lg position-fixed rounded-circle text-light bottom-25" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>
        <c:if test="${sessionScope.USER.role eq "AD"}">
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
        <c:import url="footer.html" charEncoding="UTF-8"/>  
        <script src="js/util.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.1/js/bootstrap.min.js" integrity="sha512-vyRAVI0IEm6LI/fVSv/Wq/d0KUfrg3hJq2Qz5FlfER69sf3ZHlOrsLriNm49FxnpUGmhx+TaJKwJ+ByTLKT+Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>        
        <script>
                                        function checkState(productCode, obj) {
                                            if (productCode != null) {
                                                var productID = productCode;
                                                var quantity = 1;
                                                if (obj != null) {
                                                    var parent = obj.parentElement;
                                                    quantity = $(parent).find('#number-input').val();
                                                }
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
        <script>
            function incrementValue(e) {
                e.preventDefault();
                var max = document.getElementById("number-input").max;
                var fieldName = $(e.target).data('field');
                var parent = $(e.target).closest('div');
                var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

                if (!isNaN(currentVal) && currentVal < max) {
                    parent.find('input[name=' + fieldName + ']').val(currentVal + 1);
                }
            }

            function decrementValue(e) {
                e.preventDefault();
                var fieldName = $(e.target).data('field');
                var parent = $(e.target).closest('div');
                var currentVal = parseInt(parent.find('input[name=' + fieldName + ']').val(), 10);

                if (!isNaN(currentVal) && currentVal > 1) {
                    parent.find('input[name=' + fieldName + ']').val(currentVal - 1);
                } else {
                    parent.find('input[name=' + fieldName + ']').val(1);
                }
            }

            $('.input-group').on('click', '.button-plus', function (e) {
                incrementValue(e);
            });

            $('.input-group').on('click', '.button-minus', function (e) {
                decrementValue(e);
            });

            function maxCheck(object) {
                if (object.value > object.max)
                    object.value = object.max;
            }

            function minCheck(object) {
                if (object.value == '' || object.value < object.min)
                    object.value = object.min;
            }
        </script>   
        <!--
            <script src="https://code.jquery.com/jquery-2.2.4.js" ></script>-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.thumb a').click(function (e) {
                    e.preventDefault();
                    $('.imgBox img').attr("src", $(this).attr("href"));
                })
            });
        </script>
    </body>
</html>