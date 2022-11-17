<%-- 
    Document   : newjsp1
    Created on : Sep 20, 2022, 4:05:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="formatter" class="com.nestf.util.FormatPrinter"/>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Mua voucher</title>
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link href="css/nestf.css" rel="stylesheet">       
    </head>

    <body class="text-center">
        <c:if test="${param.success eq true}">
            <span id="trigger" class="d-none" data-bs-toggle="modal" data-bs-target="#notification">                           
            </span>                     
            <div class="modal fade" id="notification" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">  
                        <div class="text-start">
                            <img src="img/success.svg" class="col-3 d-inline-block m-3">
                            <span class="fw-bold d-inline-block fs-2 ms-4">Thành công!</span> 
                        </div>           
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${param.success eq false}">
            <span id="trigger" class="d-none" data-bs-toggle="modal" data-bs-target="#notification">                           
            </span>                     
            <div class="modal fade" id="notification" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">  
                        <div class="text-start">
                            <img src="img/fail.svg" class="col-3 d-inline-block m-3">
                            <span class="fw-bold d-inline-block fs-2 ms-4">Thất bại!</span> 
                        </div>           
                    </div>
                </div>
            </div>
        </c:if>
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
                                </c:if>                                        <c:if test="${sessionScope.USER.role eq 'SE'}">              
                                    <a href="sellerPage" class="nav-link mb-2 text-decoration-none p-2" id="item">Quản lý đơn hàng</a>       
                                </c:if>                                        <c:if test="${sessionScope.USER.role eq 'AD'}">              
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
                            <jsp:useBean id="formatPrinter" class="com.nestf.util.FormatPrinter"/>
                            <a href="voucher" class="nav-link text-center current-tab disabled">${formatPrinter.noFraction(sessionScope.USER.point)} CP</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="white-board" class="bg-white w-75">
            <h2 class="d-inline-block col-6 ms-0">Danh sách voucher</h2>
            <div id="voucher-modal" class="d-inline-block col-4 text-end">
                <button id="buy-button" class="col-5" data-bs-toggle="modal" data-bs-target="#voucherModal">
                    Voucher của bạn                            
                </button>                     
                <div class="modal fade" id="voucherModal" tabindex="-1" aria-labelledby="choose1Voucher" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title m-3" id="choose1Voucher">Voucher của bạn</h5>
                                <button type="button" class="btn-close m-3" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row row-cols-4 container-fluid m-0">
                                    <c:if test = "${not empty sessionScope.VOUCHER_WALLET}">
                                        <c:forEach items="${sessionScope.VOUCHER_WALLET}" var = "voucher">                                                       
                                            <div id="item" class="d-inline-block col p-3 text-center">                                           
                                                <img src="img/voucher.png">
                                                <h6 class="text-center">${voucher.voucherType.voucherName}</h6>
                                                <span>Trị giá: <span class="fw-bold">${formatter.printMoney(voucher.voucherType.saleValue)}</span></span><br>
                                                <p>Hết hạn vào ${voucher.expiredDate}</p>                                               
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${ empty sessionScope.VOUCHER_WALLET}">
                                        <div class="text-center w-100">
                                            <img src="img/search-no-result.png" class="d-block col-4 m-auto">
                                            <h3 class="mb-2">Bạn chưa có voucher nào 😥</h3>
                                        </div>
                                    </c:if>                                                   
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
            <div class="row row-cols-4 col-11 m-auto">
                <c:if test="${not empty requestScope.VOUCHER}">
                    <c:forEach items="${requestScope.VOUCHER}" var="voucher">
                        <c:if test = "${voucher.status}">
                            <div id="item" class="d-inline-block col mb-3 p-2">
                                <img src="img/voucher.png">
                                <h6 class="mt-4">${fn:toUpperCase(voucher.voucherName)}</h6>
                                <span>Trị giá: <span class="fw-bold">${formatter.printMoney(voucher.saleValue)}</span></span><br>
                                <span>Số lượng còn: <span class="fw-bold">${voucher.quantity}</span></span><br>
                                <span>Điểm yêu cầu: <span class="fw-bold">${voucher.point}</span></span><br>
                                    <c:url var="buyLink" value="buyVoucher">
                                        <c:param name="typeID" value="${voucher.typeID}"/>
                                    </c:url>
                                <a href="${buyLink}"><button id="buy-button" class="col-6">Mua ngay</button></a>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
                <c:if test="${ empty requestScope.VOUCHER}">
                    <div class="text-center w-100">
                        <img src="img/search-no-result.png" class="d-block col-4 m-auto">
                        <h3 class="mb-5">Ôi, hết voucher mất rồi 😥</h3>

                    </div>
                </c:if>
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
        <c:import url="footer.html" charEncoding="UTF-8"/>  
        <script src="js/util.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.1/js/bootstrap.min.js" integrity="sha512-vyRAVI0IEm6LI/fVSv/Wq/d0KUfrg3hJq2Qz5FlfER69sf3ZHlOrsLriNm49FxnpUGmhx+TaJKwJ+ByTLKT+Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            window.onload = function () {
                document.getElementById("trigger").click();
            }
            $('#trigger').click(function () {
                setTimeout(function () {
                    $('#notification').modal('hide');
                }, 2000);
            });
        </script>
    </body>

</html>