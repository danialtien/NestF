
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>Nest F</title>

        <!-- Custom fonts for this template-->
        <link href="seller/sellerVendor/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="seller/css/sb-seller-2.min.css" rel="stylesheet">
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a href="home" class="text-center my-xl-2"><img src="img/logo.png" id="logo" width="55px" height="38px"></a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Quan ly don hang -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTasks"
                       aria-expanded="true" aria-controls="collapseTasks">
                        <i class="fas fa-list fa-list-alt"></i>
                        <span>Quản lý đơn hàng</span></a>
                    </a>
                    <div id="collapseTasks" class="collapse" aria-labelledby="headingTasks" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Đơn hàng</h6>
                            <a class="collapse-item" href="allOrder">Tất cả</a>
                            <a class="collapse-item" href="allOrder?type=process">Xử lý đơn hàng</a>
                            <a class="collapse-item" href="allOrder?type=status">Chi tiết vận chuyển</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Products Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
                       aria-expanded="true" aria-controls="collapseProducts">
                        <i class="fa fa-cube"></i>
                        <span>Quản lý sản phẩm</span>
                    </a>
                    <div id="collapseProducts" class="collapse" aria-labelledby="headingProducts"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Danh sách sản phẩm</h6>
                            <a class="collapse-item" href="productSeller">Sản phẩm bạn phụ trách</a>
                            <a class="collapse-item" href="productSeller?type=outOfStock">Sản phẩm hết hàng</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Income -->
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseIncome" aria-expanded="true"
                       aria-controls="collapseIncome">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Tài chính</span>
                    </a>
                    <div class="collapse" id="collapseIncome" aria-labelledby="headingIncome"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Doanh thu: </h6>
                            <a href="selIncome" class="collapse-item">Doanh thu</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Title -->
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <p class="m-auto">Kênh người bán Nest F</p>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.USER.name}</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="sellerProfile">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Hồ sơ
                                    </a>
                                    <a class="dropdown-item" href="profileSetting">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Cài đặt
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logOut">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Đăng xuất
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin index content -->
                    <div class="container col-lg-8 col-md-10">

                        <div class="things-need-to-do-wrapper col-lg-12">
                            <h4 class="things-title">
                                Danh sách cần làm
                            </h4>
                            <h6 class="things-title">
                                Những việc bạn sẽ phải làm
                            </h6>
                            <div class="things-to-do-content">
                                <div class="things-to-do-detail col-3 p-4 text-center d-inline-block">
                                    <a href="allOrder?type=process"><span class="status-counter">${requestScope.COUNT_1}</span><br>Chờ xác
                                        nhận</a>
                                </div>
                                <div class="things-to-do-detail col-3 p-4 text-center d-inline-block">
                                    <a href="allOrder?type=process2"><span class="status-counter">${requestScope.COUNT_2}</span><br>Chờ lấy
                                        hàng</a>
                                </div>
                                <div class="things-to-do-detail col-3 p-4 text-center d-inline-block">
                                    <a href="allOrder?type=status"><span class="status-counter">${requestScope.COUNT_3}</span><br>Đã xử
                                        lý</a>
                                </div>
                                <div class="things-to-do-detail col-3 p-4 text-center d-inline-block">
                                    <a href="allOrder?type=status2"><span class="status-counter">${requestScope.COUNT_4}</span><br>Đơn
                                        hủy</a>
                                </div>
                                <div class="things-to-do-detail col-3 p-4 text-center d-inline-block">
                                    <a href="productSeller?type=outOfStock"><span class="status-counter">${requestScope.COUNT_5}</span><br>Sản phẩm hết hàng</a>
                                </div>
                                <div class="things-to-do-detail col-3 p-4 text-center d-inline-block">
                                    <a href="selIncome">Tài chính/Doanh thu</a>
                                </div>
                            </div>

                        </div>

                        <div class="bestsell-section-wrapper col-lg-12 p-2">
                            <h4 class="bestsell-title">
                                Sản phẩm bán nhiều
                            </h4>

                            <div class="bestsell-section-content">
                                <c:if test="${requestScope.BEST_SELL_LIST != null}">
                                    <jsp:useBean id="printPriceFunc" scope="page" class="com.nestf.product.ProductDTO"></jsp:useBean>
                                    <c:forEach var="product" items="${requestScope.BEST_SELL_LIST}">
                                        <c:set var="productImage" value="${product.imagelink}" />
                                            <div class="bestsell-product-content position-relative">
                                                <a href="proSelDetail?productID=${product.productID}">
                                                    <img src="${productImage[0]}" alt="Image for ${product.name}" width="200px" height="200px">
                                                <p class="product-title d-inline-block col-lg-8 position-absolute">
                                                    ${product.name}<br><br>
                                                    <c:if test="${product.discountPrice == 0}">
                                                        <span class="new-price">
                                                            <strong>${printPriceFunc.printPrice(product.price)}</strong>
                                                        </span>
                                                    </c:if>
                                                    <c:if test="${product.discountPrice ne 0}">
                                                        <span class="product-discount-price">
                                                            <span class="old-price">${printPriceFunc.printPrice(product.price)}</span><br>
                                                            <span class="new-price"><strong>${printPriceFunc.printPrice(product.discountPrice)}</strong></span>
                                                        </span>
                                                    </c:if>
                                                </p>
                                                
                                                <button class="btn btn-dark position-absolute position-relative">
                                                    Chi tiết
                                                </button>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>

                    </div>
                    <!-- End index content -->
                </div>
            </div>
            <!-- End content wrapper -->

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="seller/sellerVendor/vendor/jquery/jquery.min.js"></script>
        <script src="seller/sellerVendor/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="seller/sellerVendor/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="seller/sellerVendor/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="seller/sellerVendor/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="seller/sellerVendor/js/demo/chart-area-demo.js"></script>
        <script src="seller/sellerVendor/js/demo/chart-pie-demo.js"></script>
        
    </body>
</html>
