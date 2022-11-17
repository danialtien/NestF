<%-- 
    Document   : cart
    Created on : Sep 19, 2022, 10:33:02 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <c:if test="${empty requestScope.TOTAL}">
        <c:redirect url="cart"/>
    </c:if>
    <jsp:useBean id="formatPrinter" class="com.nestf.util.FormatPrinter"/>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>Thanh toán</title>
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
                        <div> 
                            <c:if test="${not empty sessionScope.USER}">
                                <a href="cart" class="nav-link text-center"><i class="fa-solid fa-cart-shopping position-relative">
                                        <c:if test="${not empty sessionScope.CART}">
                                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                                                <span class="visually-hidden">New alerts</span>
                                            </span>
                                        </c:if>
                                    </i>
                                </a>
                            </c:if> 
                        </div>                                                    
                    </li>
                    <li class="nav-item col-1 d-inline-block text-center">
                        <div>
                            <a href="voucher" class="nav-link text-center">${formatPrinter.noFraction(sessionScope.USER.point)} CP</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="whiteboard2" class="bg-white w-75">
            <h2 class="p-4">Xác nhận thanh toán</h2>
            <div id="cart-modal" class="d-inline-block col-4">
                <span id="cart-button">
                    <button id="buy-button" class="col-6" data-bs-toggle="modal" data-bs-target="#cartModal">
                        Xem sản phẩm đã chọn                        
                    </button>
                </span>                       
                <div class="modal fade" id="cartModal" tabindex="-1" aria-labelledby="choose1Voucher" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title m-3" id="choose1Voucher">Danh sách các sản phẩm quý khách đã chọn mua</h5>
                                <c:if test="${not empty requestScope.VOUCHER_USE}">
                                    <span>Voucher sử dụng : <b>${requestScope.VOUCHER_USE.voucherType.voucherName}</b></span>
                                    <br><span>Trị giá : <b>${formatPrinter.printMoney(requestScope.VOUCHER_USE.voucherType.saleValue)}</b></span>
                                </c:if>
                                <button type="button" class="btn-close m-3" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row container-fluid m-0">
                                    <c:forEach items="${sessionScope.CART}" var="cartItem">
                                        <div id="cart-item" class="rounded col-11 m-auto mb-3">
                                            <div class="row container-fluid m-0">
                                                <div class="d-inline-block col-2 text-start">
                                                    <img src="${cartItem.product.imagelink[0]}" class="rounded w-100 m-2 border border-dark">
                                                </div>     
                                                <div class="d-inline-block col-8 text-start ms-5 mt-4">
                                                    <a href="productDetail?productID=${cartItem.product.productID}" class="text-decoration-none text-black"><h4 class="fw-bold">${cartItem.product.name}</h4></a>
                                                    <span> Giá : 
                                                        <b>
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
                                                        </b>
                                                        <br><span>Số lượng : <b>${cartItem.amount}</b></span>
                                                    </span>                                                                                        
                                                </div> 
                                            </div>  
                                        </div>
                                    </c:forEach>                                                 
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form action="confirmPayment">
                <div class="fs-5 p-5">
                    <p><span>Địa chỉ giao hàng : </span><input id = "address" class = "col-6" type="text" name="address" placeholder="${sessionScope.USER.address}"/>
                        <br>
                        <font color="red" class="fs-6">(Lưu ý: Đơn hàng sẽ được giao theo địa chỉ trên/địa chỉ mặc định của quý khách, địa chỉ giao hàng Paypal sẽ không được sử dụng)</font>
                    </p>                  
                    <jsp:useBean id="formatter" class="com.nestf.util.FormatPrinter"/>
                    <c:set var = "totalInUSD" value="${formatter.toUSD(requestScope.TOTAL)}"/>
                    <span>Thành tiền : <b>${formatter.printMoney(requestScope.TOTAL)}</b> (quy đổi sang USD : <b>$${totalInUSD}</b>)</span><br>
                    <span>Quý khách sẽ được cộng <b>${formatPrinter.noFraction(requestScope.TOTAL/1000)}</b> điểm tích luỹ khi quá trình giao hàng bắt đầu</span>
                </div>
                <div id="paypalButtonContainer" class="m-auto col-6"></div>
            </form>
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
        <c:import url="footer.html" charEncoding="UTF-8"/>               
        <script src="js/util.js"></script>   
        <script src="https://www.paypal.com/sdk/js?client-id=AeJ5oAA7OGoD8dlZNG6MWDNJqDoV2MQaaldDD1xNoq0upDs938zsUah_a2tjlplqHCutIojCuLwYJK__&currency=USD"></script>
        <c:if test="${empty sessionScope.ADMIN && sessionScope.USER.role ne 'SE'}">
            <script>
                paypal.Buttons({
                    // Sets up the transaction when a payment button is clicked
                    createOrder: (data, actions) => {
                        return actions.order.create({
                            purchase_units: [{
                                    amount: {
                                        value: '${totalInUSD}' // Can also reference a variable or function
                                    }
                                }]
                        });
                    },
                    // Finalize the transaction after payer approval
                    onApprove: (data, actions) => {
                        return actions.order.capture().then(function (orderData) {
                            // Successful capture! For dev/demo purposes:
                            const transaction = orderData.purchase_units[0].payments.captures[0];
                            // When ready to go live, remove the alert and show a success message within this page. For example:
                            // const element = document.getElementById('paypal-button-container');
                            // element.innerHTML = '<h3>Thank you for your payment!</h3>';
                            // Or go to another URL:  actions.redirect('thank_you.html');
                            var url = 'confirmCheckOut?transactionID=' + transaction.id + '&address=';
                            url += document.getElementById("address").value;
                            url += "&total=${requestScope.TOTAL}";
                <c:if test = "${not empty requestScope.VOUCHER_USE}">
                            url += "&voucherID=${requestScope.VOUCHER_USE.voucherID}";
                </c:if>
                            window.location.replace(url);
                        });
                    }
                }).render('#paypalButtonContainer');
            </script>
        </c:if>
    </body>

</html>
