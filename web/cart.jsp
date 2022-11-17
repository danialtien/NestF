<%-- 
    Document   : cart
    Created on : Sep 19, 2022, 10:33:02 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">      
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>Giỏ hàng</title>
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link href="css/nestf.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.1/js/bootstrap.min.js" integrity="sha512-vyRAVI0IEm6LI/fVSv/Wq/d0KUfrg3hJq2Qz5FlfER69sf3ZHlOrsLriNm49FxnpUGmhx+TaJKwJ+ByTLKT+Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
                    </li>
                    <li class="nav-item col-1 d-inline-block text-center">
                        <div><a href="cart" class="nav-link text-center current-tab disabled"><i class="fa-solid fa-cart-shopping"></i></a></div>
                    </li>
                    <li class="nav-item col-1 d-inline-block text-center">   

                        <div>
                            <jsp:useBean id="formatPrinter" class="com.nestf.util.FormatPrinter"/>
                            <a href="voucher" class="nav-link text-center">${formatPrinter.noFraction(sessionScope.USER.point)} CP</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="overall">
            <ul id="options" class="nav nav-tabs mt-3 " role="tablist">
                <li class="nav-item m-auto" role="presentation">
                    <button id="cart-tab" data-bs-target="#customer-cart" data-bs-toggle="tab" aria-selected="true" role="tab"  aria-controls="customer-cart" aria-current="page" class="nav-link active text-black bg-transparent border-0">Giỏ hàng</button>
                </li>
                <li class="nav-item m-auto" role="presentation">
                    <button id="history-tab" data-bs-target="#order-history" data-bs-toggle="tab" aria-selected="false" role="tab" aria-controls="order-history" aria-current="page" class="nav-link text-black bg-transparent border-0">Lịch sử mua hàng</button>
                </li>
            </ul>
            <div class="tab-content">
                <div id="customer-cart" class="tab-pane fade show active" role="tabpanel" aria-labelledby="cart-tab">
                    <div id="whiteboard2" class="col-8 bg-white">  
                        <c:if test="${not empty sessionScope.CART}">
                            <span class="d-inline-block col-7 mt-4 mb-4 text-start">Giỏ hàng của bạn</span>                       
                            <div id="voucher-modal" class="d-inline-block col-4 text-end">
                                <span id="voucher-button">Voucher : <button id="buy-button" class="col-4" data-bs-toggle="modal" data-bs-target="#voucherModal">
                                        Chọn voucher                                  
                                    </button></span>                       
                                <div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="choose1Voucher" aria-hidden="true">
                                    <div class="modal-dialog modal-xl modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title m-3" id="choose1Voucher">Chọn voucher quý khách muốn sử dụng</h5>
                                                <button type="button" class="btn-close m-3" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row row-cols-4 container-fluid m-0">
                                                    <c:if test = "${not empty sessionScope.VOUCHER_WALLET}">
                                                        <c:forEach items="${sessionScope.VOUCHER_WALLET}" var = "voucher">                                                       
                                                            <div id="item" class="d-inline-block col p-3 text-center">                                           
                                                                <img src="img/voucher.png">
                                                                <h6 class="text-center">${voucher.voucherType.voucherName}</h6>
                                                                <span>Trị giá: <span class="fw-bold">${formatPrinter.printMoney(voucher.voucherType.saleValue)}</span></span><br>
                                                                <p>Hết hạn vào ${voucher.expiredDate}</p>
                                                                <button type="button" id="buy-button" class="col-6" data-bs-dismiss="modal" onclick="pickVoucher(this)" value="${voucher.voucherType.voucherName}">
                                                                    Sử dụng <input type="hidden" value="${voucher.voucherID}">
                                                                    <input type="hidden" value="${voucher.voucherType.saleValue}">
                                                                </button>
                                                            </div>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${ empty sessionScope.VOUCHER_WALLET}">
                                                        <div class="text-center w-100">
                                                            <img src="img/search-no-result.png" class="d-block col-4 m-auto">
                                                            <h3 class="mb-2">Bạn chưa có voucher nào 😥</h3>
                                                            <a href="voucher" class="nav-link d-inline-block mb-3"><i class="fa-solid fa-basket-shopping"></i>Đi mua voucher</a>
                                                        </div>
                                                    </c:if>                                                   
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="cancelVoucher()">Huỷ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                                       
                            <c:forEach items="${sessionScope.CART}" var="cartItem">
                                <div id="cart-item" class="rounded col-11 m-auto mb-3">
                                    <div class="row container-fluid m-0">
                                        <div class="d-inline-block col-2 text-start">
                                            <img src="${cartItem.product.imagelink[0]}" class="rounded w-100 m-2 border border-dark">
                                        </div>     
                                        <div class="d-inline-block col-8 text-start ms-5 mt-4">
                                            <a href="productDetail?productID=${cartItem.product.productID}" class="text-decoration-none text-black"><h4 class="fw-bold">${cartItem.product.name}</h4></a>
                                            <span>
                                                <jsp:useBean id="productFunc" class="com.nestf.product.ProductDTO"/>
                                                <c:if test="${cartItem.product.discountPrice ne 0}">
                                                    <span class="text-danger">

                                                        ${productFunc.printPrice(cartItem.product.discountPrice)}
                                                    </span>                                                 
                                                    <span class="text-muted text-decoration-line-through ms-3">
                                                        ${productFunc.printPrice(cartItem.product.price)}
                                                    </span>
                                                </c:if>
                                                <c:if test="${cartItem.product.discountPrice eq 0}">
                                                    ${productFunc.printPrice(cartItem.product.price)}
                                                </c:if>
                                            </span>                                       
                                            <div id="number-toggle" class="text-end">
                                                <div class="input-group d-inline-flex flex-column align-items-end">
                                                    <form action="addToCart">
                                                        <input type="hidden" id = "productID" name="productID" value="${cartItem.product.productID}">
                                                        <input type="hidden" name="price" value="${cartItem.product.discountPrice eq 0 ? cartItem.product.price : cartItem.product.discountPrice}">
                                                        <img src="img/plus.svg" data-field="newQuantity" class="button-plus d-inline-block">                                                
                                                        <input required id="number-input" type="number" step="1" name="newQuantity" value="${cartItem.amount}" min="1" max="${cartItem.product.quantity}" onblur="minCheck(this), maxCheck(this)" onchange="checkState(this)" class="quantity-field text-center p-0">                                 
                                                        <img src="img/minus.svg" data-field="newQuantity" class="button-minus d-inline-block"><br>                                    
                                                        <h5 class="fw-bold text-end mt-1" id="thisProductTotal"></h5>
                                                    </form>
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="d-inline-block col-1 ms-auto">
                                            <a href="removeFromCart?productID=${cartItem.product.productID}" class="mt-3 nav-link"><i class="fa-solid fa-xmark fa-2xl me-0"></i></a>
                                        </div>
                                    </div>  
                                </div>
                            </c:forEach>
                            <div class="fs-4 d-flex justify-content-between pb-3">
                                <span class="ms-5 d-inline-block align-self-center">Thành tiền : <span class="fw-bold" id="total-display"></span> 
                                </span>
                                <input type="hidden" id="saleMargin" value="0">
                                <form action="checkOutAction" method="POST">
                                    <input type="hidden" id="voucher-use" name="voucher-use" value="">
                                    <button type="submit" id="buy-button" class="btn ms-auto mt-0 me-5" data-bs-toggle="modal" data-bs-target="#checkOutModal">Thanh toán</button>
                                </form>              
                            </div>                                                                     
                        </c:if>
                        <c:if test="${empty sessionScope.CART}">
                            <span class="d-inline-block col-11 mt-4 mb-4 text-start">Giỏ hàng của bạn</span>
                            <div class="mt-5">
                                <img src="img/emptyCart.png">
                                <h4 class="text-muted mt-3 pb-4">Bạn chưa thêm sản phẩm nào</h4>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div id="order-history" class="tab-pane fade" role="tabpanel" aria-labelledby="history-tab">
                    <div id="whiteboard2" class="col-8 bg-white">                       
                        <ul id="options" class="row row-cols-4 nav nav-tabs border-0 p-3" role="tablist">
                            <li class="nav-item m-0" role="presentation">
                                <button id="preparing-tab" data-bs-target="#preparing" data-bs-toggle="tab" aria-selected="true" role="tab"  aria-controls="preparing" aria-current="page" class="nav-link active container-fluid text-black bg-transparent border-0">Đang chuẩn bị</button>
                            </li>
                            <li class="nav-item m-0" role="presentation">
                                <button id="delivering-tab" data-bs-target="#delivering" data-bs-toggle="tab" aria-selected="false" role="tab" aria-controls="delivering" aria-current="page" class="nav-link container-fluid text-black bg-transparent border-0">Đang giao</button>
                            </li>
                            <li class="nav-item m-0" role="presentation">
                                <button id="delivered-tab" data-bs-target="#delivered" data-bs-toggle="tab" aria-selected="false" role="tab" aria-controls="delivered" aria-current="page" class="nav-link container-fluid text-black bg-transparent border-0">Đã giao</button>
                            </li>
                            <li class="nav-item m-0" role="presentation">
                                <button id="canceled-tab" data-bs-target="#canceled" data-bs-toggle="tab" aria-selected="false" role="tab" aria-controls="canceled" aria-current="page" class="nav-link container-fluid text-black bg-transparent border-0">Đã huỷ</button>
                            </li>
                        </ul>
                        <div class="tab-content">                          
                            <div id="preparing" class="tab-pane fade show active pb-3" role="tabpanel" aria-labelledby="preparing-tab">  
                                <c:if test = "${not empty requestScope.PROCESSING}">
                                    <c:set var="billList" value="${requestScope.PROCESSING}"/>
                                    <c:forEach items="${billList}" var = "bill">
                                        <div id = "cart-item" class="row col-11 m-auto text-start mb-3 position-relative">
                                            <h3 class="m-2 mb-0 d-inline-block">Đơn hàng <strong>#NESTF${bill.billID}</strong></h3>
                                            <h5 class="text-success m-2">${bill.status.status}</h5>
                                            <span class="ms-2 mb-2">Ngày đặt hàng: <b>${formatPrinter.printDate(bill.time)}</b></span>
                                            <span class="ms-2 mb-4">Địa chỉ nhận hàng : <b>${bill.address}</b></span>
                                            <c:forEach items = "${bill.detail}" var = "billDetail">
                                                <div class="rounded col-11 m-auto mb-3 border border-dark">
                                                    <div class="row container-fluid m-0">
                                                        <div class="d-inline-block col-2 text-start">
                                                            <img src="${billDetail.product.imagelink[0]}" class="rounded col-9">
                                                        </div>     
                                                        <div class="d-inline-block col-8 text-start ms-2 mt-2">
                                                            <h4 class="fw-bold">${billDetail.product.name}</h4>
                                                            <p class="mt-1 mb-0">Số lượng : <span class="fw-bold">${billDetail.quantity}</span></p>
                                                            <p>Giá : <span class="fw-bold">${formatPrinter.printMoney(billDetail.price)}</span></p> 
                                                        </div>                                              
                                                    </div>                                             
                                                </div>
                                            </c:forEach>                                          
                                            <h4 class="text-end">Thành tiền: <b>${formatPrinter.printMoney(bill.total)}</b></h4>       
                                            <button id="remove-button" class="p-0 position-absolute border-0" data-bs-toggle="modal" data-bs-target="#cancelModal" onclick="loadCancelForm(this)">
                                                <input type="hidden" name="billID" value="${bill.billID}"/>
                                                <i class="fa-solid fa-xmark fa-2xl me-0"></i>
                                            </button> 
                                        </div>
                                    </c:forEach>
                                    <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelThis" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable">
                                            <div class="modal-content">
                                                <form action="cancelBill" method="post">
                                                    <input type="hidden" name="billID">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title m-3" id="cancelThis">Chọn lý do huỷ đơn</h5>
                                                        <button type="button" class="btn-close m-3" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="col-11 border border-warning m-auto mt-3 alert alert-warning" role="alert">
                                                            <div class="row m-0 container-fluid">
                                                                <div class="col-1 text-center d-flex justify-content-center align-items-center"><i class="fa-solid fa-circle-exclamation"></i></div>
                                                                <div class="col-11 mt-2 mb-2">Lưu ý: Thao tác này sẽ huỷ tất cả các sản phẩm có trong đơn hàng và không thể hoàn tác</div>
                                                            </div>
                                                        </div>
                                                        <div class="m-4">
                                                            <input type="radio" id="reason1" checked name="cancelReason" value=""/>
                                                              <label for="reason1">Muốn thay đổi địa chỉ giao hàng</label><br>
                                                            <input type="radio" id="reason2" name="cancelReason" value=""/>
                                                              <label for="reason2">Muốn sử dụng voucher</label><br>
                                                            <input type="radio" id="reason3" name="cancelReason" value=""/>
                                                              <label for="reason3">Muốn thay đổi sản phẩm trong đơn hàng</label><br>
                                                            <input type="radio" id="reason4" name="cancelReason" value=""/>
                                                              <label for="reason4">Tìm thấy giá rẻ hơn ở nơi khác</label><br>
                                                            <input type="radio" id="reason5" name="cancelReason" value=""/>
                                                              <label for="reason5">Đổi ý, không muốn mua nữa</label><br>
                                                            <input type="radio" id="reason6" name="cancelReason" onselect="insertReason()"/>
                                                              <label for="reason6">Khác</label>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn bg-secondary" id="buy-button" data-bs-dismiss="modal">Không phải bây giờ</button>
                                                        <button type="submit" class="btn" id="buy-button">Xác nhận huỷ</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${empty requestScope.PROCESSING}">
                                    <div class="mt-5">
                                        <img src="img/emptyCart.png">
                                        <h4 class="text-muted mt-3 pb-4">Không có lịch sử giao dịch.</h4>
                                    </div>
                                </c:if>
                            </div>
                            <div id="delivering" class="tab-pane fade pb-3" role="tabpanel" aria-labelledby="delivering-tab">  
                                <c:if test = "${not empty requestScope.DELIVERING}">
                                    <c:set var="billList" value="${requestScope.DELIVERING}"/>
                                    <c:forEach items="${billList}" var = "bill">
                                        <div id = "cart-item" class="row col-11 m-auto text-start mb-3 position-relative">
                                            <h3 class="m-2 mb-0 d-inline-block">Đơn hàng <strong>#NESTF${bill.billID}</strong></h3>
                                            <h5 class="text-success m-2">${bill.status.status}</h5>
                                            <span class="ms-2 mb-2">Ngày đặt hàng: <b>${formatPrinter.printDate(bill.time)}</b></span>
                                            <span class="ms-2 mb-4">Địa chỉ nhận hàng : <b>${bill.address}</b></span>
                                            <c:forEach items = "${bill.detail}" var = "billDetail">
                                                <div class="rounded col-11 m-auto mb-3 border border-dark">
                                                    <div class="row container-fluid m-0">
                                                        <div class="d-inline-block col-2 text-start">
                                                            <img src="${billDetail.product.imagelink[0]}" class="rounded col-9">
                                                        </div>     
                                                        <div class="d-inline-block col-8 text-start ms-2 mt-2">
                                                            <h4 class="fw-bold">${billDetail.product.name}</h4>
                                                            <p class="mt-1 mb-0">Số lượng : <span class="fw-bold">${billDetail.quantity}</span></p>
                                                            <p>Giá : <span class="fw-bold">${formatPrinter.printMoney(billDetail.price)}</span></p>                                                 
                                                        </div>                                              
                                                    </div>
                                                </div>
                                            </c:forEach>                                          
                                            <h4 class="text-end">Thành tiền: <b>${formatPrinter.printMoney(bill.total)}</b></h4>       
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.DELIVERING}">
                                    <div class="mt-5">
                                        <img src="img/emptyCart.png">
                                        <h4 class="text-muted mt-3 pb-4">Không có lịch sử giao dịch.</h4>
                                    </div>
                                </c:if>
                            </div>
                            <div id="delivered" class="tab-pane fade pb-3" role="tabpanel" aria-labelledby="delivered-tab">                             
                                <c:if test = "${not empty requestScope.DELIVERED}">
                                    <c:set var="completedList" value="${requestScope.DELIVERED}"/>
                                    <c:forEach items="${completedList}" var = "completedBill">
                                        <div id = "cart-item" class="row col-11 m-auto text-start mb-3 position-relative">
                                            <h3 class="m-2 mb-0 d-inline-block">Đơn hàng <strong>#NESTF${completedBill.billID}</strong></h3>
                                            <h5 class="text-danger m-2">${completedBill.status.status}</h5>
                                            <span class="ms-2 mb-2">Ngày đặt hàng: <b>${formatPrinter.printDate(completedBill.time)}</b></span>
                                            <span class="ms-2 mb-4">Địa chỉ nhận hàng : <b>${completedBill.address}</b></span>
                                            <c:forEach items = "${completedBill.detail}" var = "billDetail">
                                                <div class="rounded col-11 m-auto mb-3 border border-dark">
                                                    <div class="row container-fluid m-0">
                                                        <div class="d-inline-block col-2 text-start">
                                                            <img src="${billDetail.product.imagelink[0]}" class="rounded col-9">
                                                        </div>     
                                                        <div class="d-inline-block col-8 text-start ms-2 mt-2">
                                                            <h4 class="fw-bold">${billDetail.product.name}</h4>
                                                            <p class="mt-1 mb-0">Số lượng : <span class="fw-bold">${billDetail.quantity}</span></p>
                                                            <p>Giá : <span class="fw-bold">${formatPrinter.printMoney(billDetail.price)}</span></p> 
                                                        </div>                                              
                                                    </div>
                                                </div>
                                            </c:forEach>                                          
                                            <h4 class="text-end">Thành tiền: <b>${formatPrinter.printMoney(completedBill.total)}</b></h4>                                                       
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.DELIVERED}">
                                    <div class="mt-5">
                                        <img src="img/emptyCart.png">
                                        <h4 class="text-muted mt-3 pb-4">Không có lịch sử giao dịch.</h4>
                                    </div>
                                </c:if>
                            </div>
                            <div id="canceled" class="tab-pane fade pb-3" role="tabpanel" aria-labelledby="canceled-tab">                             
                                <c:if test = "${not empty requestScope.CANCELED}">
                                    <c:set var="completedList" value="${requestScope.CANCELED}"/>
                                    <c:forEach items="${completedList}" var = "completedBill">
                                        <div id = "cart-item" class="row col-11 m-auto text-start mb-3 position-relative">
                                            <h3 class="m-2 mb-0 d-inline-block">Đơn hàng <strong>#NESTF${completedBill.billID}</strong></h3>
                                            <h5 class="text-danger m-2">${completedBill.status.status}</h5>
                                            <span class="ms-2 mb-2">Ngày đặt hàng: <b>${formatPrinter.printDate(completedBill.time)}</b></span>
                                            <span class="ms-2 mb-4">Địa chỉ nhận hàng : <b>${completedBill.address}</b></span>
                                            <c:forEach items = "${completedBill.detail}" var = "billDetail">
                                                <div class="rounded col-11 m-auto mb-3 border border-dark">
                                                    <div class="row container-fluid m-0">
                                                        <div class="d-inline-block col-2 text-start">
                                                            <img src="${billDetail.product.imagelink[0]}" class="rounded col-9">
                                                        </div>     
                                                        <div class="d-inline-block col-8 text-start ms-2 mt-2">
                                                            <h4 class="fw-bold">${billDetail.product.name}</h4>
                                                            <p class="mt-1 mb-0">Số lượng : <span class="fw-bold">${billDetail.quantity}</span></p>
                                                            <p>Giá : <span class="fw-bold">${formatPrinter.printMoney(billDetail.price)}</span></p> 
                                                        </div>                                              
                                                    </div>
                                                </div>
                                            </c:forEach>                                          
                                            <h4 class="text-end">Thành tiền: <b>${formatPrinter.printMoney(completedBill.total)}</b></h4>                                                       
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty requestScope.CANCELED}">
                                    <div class="mt-5">
                                        <img src="img/emptyCart.png">
                                        <h4 class="text-muted mt-3 pb-4">Không có lịch sử giao dịch.</h4>
                                    </div>
                                </c:if>
                            </div>                           
                        </div>                     
                    </div>
                </div>
            </div>            
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
            <span id="triggerFail" class="d-none" data-bs-toggle="modal" data-bs-target="#fail"></span>                     
            <div class="modal fade" id="fail" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">  
                        <div class="text-start m-0 row d-flex align-items-center container-fluid">
                            <img src="img/fail.svg" class="w-25 d-inline-block p-3">
                            <span class="text-center fw-bold d-inline-block w-75 fs-4">Sản phẩm này đã đạt giới hạn đặt hàng!</span> 
                        </div>           
                    </div>
                </div>
            </div>
        </div>
        <c:import url="footer.html" charEncoding="UTF-8"/>               
        <script src="js/cart.js"></script> 
        <script src="js/util.js"></script>     
    </body>

</html>
