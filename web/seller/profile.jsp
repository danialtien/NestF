
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="seller/styled-notifications-master/dist/notifications.css">

    </head>
    <body id="page-top" onload="checkState()">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a href="home" class="text-center my-xl-2"><img src="img/logo.png" id="logo" width="55px"
                                                                      height="38px"></a>
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
            <!-- End Sidebar -->

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
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin index content -->
                    <div class="container col-lg-10 row seller-profile-content">
                        <c:if test="${sessionScope.USER != null}">
                            <jsp:useBean id="printPriceFunc" scope="page" class="com.nestf.product.ProductDTO"/>
                            <div class="logout-section">
                                <a href="logOut">
                                    <button class="logout-btn">
                                        <span><i class="fa-solid fa-door-closed"></i></span>Đăng xuất
                                    </button>
                                </a>
                            </div>
                            <div class="profile-image col-4 d-inline-block text-center">
                                <img src="img/undraw_profile.svg" height="200px">
                            </div>
                            <div class="profile-detail col-6 d-inline-block" style="color: #000;">
                                <h5>Người bán: <strong>${sessionScope.USER.name}</strong></h5>
                                <hr>
                                <a href="productSeller" class="float-right text-decoration-none text-black-50">Chi tiết</a>
                                <h6>Số lượng sản phẩm quản lý: <strong>${requestScope.PRODUCT_COUNT}</strong></h6>
                                <h6 class="pt-2">Số điện thoại: <strong>${sessionScope.USER.phone}</strong></h6>
                                <a href="selIncome" class="float-right text-decoration-none text-black-50">Chi tiết</a>
                                <h6 class="pt-2">Doanh thu tháng này: <strong>${printPriceFunc.printPrice(requestScope.INCOME_TOTAL)}</strong></h6>
                                <hr>
                                <a href="profileSetting" class="text-decoration-none text-black-50">Cập nhật tên hiển thị</a>
                                <a href="profileSetting?type=changePassword" class="float-right text-decoration-none text-black-50">Đổi mật khẩu?</a>
                            </div>
                        </c:if>
                    </div>
                    <!-- End index content -->

                </div>
                <!-- End Content -->
            </div>
            <!-- End Content Wrapper -->
        </div>
        <!-- End Page Wrapper -->

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

        <script src="seller/styled-notifications-master/dist/notifications.js"></script>

        <script type="text/javascript">

            function checkState() {
                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                const type = urlParams.get('newName');

                if (type != null) {
                    window.createNotification({
                        showDuration: 3000,
                        theme: 'success'
                    })({
                        title: 'Thông báo',
                        message: 'Cập nhật tên thành công'
                    });
                }

                cleanUri();
            }

            function cleanUri() {
                var uri = window.location.toString();
                if (uri.indexOf("?") > 0) {
                    var clean = uri.substring(0, uri.indexOf("?"));
                    window.history.replaceState({}, document.title, clean);
                }
            }
        </script>

    </body>
</html>
