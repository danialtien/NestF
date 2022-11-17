<%-- 
    Document   : newjsp2
    Created on : Sep 20, 2022, 4:05:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="formatter" class="com.nestf.util.FormatPrinter"/>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cài đặt tài khoản</title>
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                            <button type="submit" class="border-0 bg-transparent"><i class="fas fa-search    "></i></button>
                            <input type="text" class="text-center" placeholder="Tìm kiếm" name="txtSearch" value="">
                        </form>
                    </li>
                    <li class="nav-item col-2 d-inline-block text-center">
                        <div><a href="account" class="nav-link current-tab disabled" id="name-display"><i class="fas fa-user    "></i>${USER.name}</a></div>
                    </li>
                    <li class="nav-item col-1 d-inline-block text-center">
                        <div>
                            <a href="cart" class="nav-link text-center">
                                <i class="fa-solid fa-cart-shopping position-relative">
                                    <c:if test="${not empty sessionScope.CART}">
                                        <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                                            <span class="visually-hidden">New alerts</span>
                                        </span>
                                    </c:if>
                                </i>
                            </a>
                        </div>
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
            <ul id="options" class="nav nav-tabs mt-3" role="tablist">
                <li class="nav-item m-auto" role="presentation">
                    <button id="setting-tab" data-bs-target="#account-settings" data-bs-toggle="tab" aria-selected="true" role="tab"  aria-controls="account-settings" aria-current="page" class="nav-link active text-black bg-transparent border-0">Cài đặt tài khoản</button>
                </li>
                <li class="nav-item m-auto" role="presentation">
                    <button id="voucher-tab" data-bs-target="#all-voucher" data-bs-toggle="tab" aria-selected="false" role="tab" aria-controls="all-voucher" aria-current="page" class="nav-link text-black bg-transparent border-0">Voucher của bạn</button>
                </li>
            </ul>
            <div class="tab-content">
                <div id="account-settings" class="tab-pane fade show active" role="tabpanel" aria-labelledby="setting-tab">
                    <div id="whiteboard2" class="col-8 bg-white">
                        <span class="d-inline-block col-11 text-start m-3">Cài đặt tài khoản</span>
                        <div class="accordion pb-3">
                            <div class="accordion-item col-11 dropdown-setting" id="changeName">
                                <div class="accordion-header">
                                    <button class="accordion-button collapsed bg-transparent" id="dropDownBtn" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-controls="collapse1">
                                        <img src="img/name.svg">Thay đổi tên hiển thị</i>
                                    </button>
                                </div>
                                <div id="collapse1" class="accordion-collapse collapse">
                                    <div class="accordion-body">


                                        <form id="changeForm" class="text-start">                                     
                                            <div class="m-3 d-inline-block">Tên hiển thị mới</div><input type="text" name="newCustomerName" class="col-6" required minlength="2" maxlength="30"><br>     
                                            <input type="button" onclick="updateName()" value="LƯU" id="color-button" class="mt-3 mb-3">
                                        </form>


                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item col-11 dropdown-setting" id="changePass">
                                <c:set var="error" value="${empty requestScope.ERROR}"></c:set>
                                    <div class="accordion-header">                               
                                        <button class="accordion-button bg-transparent ${error ? 'collapsed' : ''}" id="dropDownBtn" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-controls="collapse2">
                                        <img src="img/lock.svg">Thay đổi mật khẩu</i>
                                    </button>
                                </div>
                                <div id="collapse2" class="accordion-collapse collapse ${error ? '' : 'show'}">
                                    <div class="accordion-body">


                                        <form action="changePasswordAction" method="post" id="changeForm" class="text-start">
                                            <div class="m-3 d-inline-block">Mật khẩu hiện tại</div><input type="password" name="password"
                                                                                                          class="col-6" required placeholder=""><br>
                                            <input type="hidden" name="password" value="">
                                            <div class="m-3 d-inline-block">Mật khẩu mới</div><input type="password" name="newPass" id="newPass"
                                                                                                     class="col-6" required minlength="6" maxlength="20" id="password" placeholder="" oninput="checkSimilar()"><br>
                                            <div class="m-3 d-inline-block">Xác nhận mật khẩu mới</div><input type="password" name="confirm" class="col-6" required minlength="6" maxlength="20" id="confirm" oninput="checkSimilar()"><br>                                          
                                            <span class="text-danger text-center d-inline-block container-fluid mt-2">Sau khi thay đổi mật khẩu thành công, tài khoản sẽ tự động đăng xuất !</span>
                                            <input type="submit" name="submitButton" value="LƯU" id="color-button" class="mt-3 mb-3">
                                        </form>


                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item col-11 dropdown-setting" id="changeAddress" role="tabpanel">
                                <div class="accordion-header">
                                    <button class="accordion-button collapsed bg-transparent" id="dropDownBtn" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-controls="collapse3">
                                        <img src="img/address.svg">Thay đổi địa chỉ giao hàng mặc định</i>
                                    </button>
                                </div>
                                <div id="collapse3" class="accordion-collapse collapse">
                                    <div class="accordion-body">

                                        <form id="changeForm" class="text-start">
                                            <div class="m-3 d-inline-block">Địa chỉ cũ :</div><span id="current-address"> ${USER.address}</span><br>
                                            <div class="m-3 d-inline-block">Địa chỉ mới</div><input type="text" name="newAddress"
                                                                                                    class="col-8" required minlength="20" maxlength="70"><br>                                         
                                            <input type="button" value="LƯU" id="color-button" class="mt-3 mb-3" onclick="updateAddress()">
                                        </form>

                                    </div>
                                </div>
                            </div>                                             
                        </div>
                    </div>
                    <div class="col-10 d-flex justify-content-end mb-5"><a href="logOut" class="nav-link text-decoration-none" id="logout"><i class="fa-solid fa-arrow-right-from-bracket"></i>Đăng xuất</a></div>
                </div>
                <div id="all-voucher" class="tab-pane fade" role="tabpanel" aria-labelledby="voucher-tab">
                    <div id="whiteboard2" class="col-8 bg-white">
                        <span class="d-inline-block col-9 m-3 text-start">Voucher của bạn</span><a href="voucher" class="nav-link d-inline-block"><i class="fa-solid fa-basket-shopping"></i>Đi mua voucher</a> 
                        <div class="row row-cols-4 col-11 m-auto">
                            <c:if test = "${not empty sessionScope.VOUCHER_WALLET}">
                                <c:forEach items="${sessionScope.VOUCHER_WALLET}" var = "voucher">
                                    <div id="item" class="d-inline-block col mb-2">
                                        <img src="img/voucher.png"><br>
                                        <h5>${voucher.voucherType.voucherName}</h5>
                                        <span>Trị giá: <b>${formatter.printMoney(voucher.voucherType.saleValue)}</b></span>
                                        <p>Hết hạn vào <strong>${voucher.expiredDate}</strong></p>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty sessionScope.VOUCHER_WALLET}">
                                <div class="text-center w-100">
                                    <img src="img/search-no-result.png" class="d-block col-4 m-auto">
                                    <h3 class="mb-5">Bạn chưa có voucher nào 😥</h3>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>            
            </div>
        </div>
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
        <div>
            <span id="triggerSuccess" class="d-none" data-bs-toggle="modal" data-bs-target="#success"></span>                     
            <div class="modal fade" id="success" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">  
                        <div class="text-start m-0 p-0 row d-flex align-items-center container-fluid">
                            <img src="img/success.svg" class="w-25 d-inline-block p-3">
                            <span class="text-center fw-bold d-inline-block w-75 fs-4">Thay đổi thông tin thành công!</span> 
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.1/js/bootstrap.min.js" integrity="sha512-vyRAVI0IEm6LI/fVSv/Wq/d0KUfrg3hJq2Qz5FlfER69sf3ZHlOrsLriNm49FxnpUGmhx+TaJKwJ+ByTLKT+Yg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>        
        <script src="js/account.js"></script>
    </body>

</html>
