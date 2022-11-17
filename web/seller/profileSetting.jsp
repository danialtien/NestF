<%-- 
    Document   : profileSetting
    Created on : Nov 11, 2022, 2:21:16 PM
    Author     : NameIsDuy
--%>

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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="seller/styled-notifications-master/dist/notifications.css">

    </head>
    <body id="page-top" onload="removeAndAddClass()">

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
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="sellerProfile">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Hồ sơ
                                    </a>
                                    <a class="dropdown-item" href="#">
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
                    <div class="container col-lg-10 seller-profile-content">
                        <ul class="nav nav-tabs justify-content-between" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active update-profile-btn" id="name-update-tab" data-toggle="tab"
                                        data-target="#name-update-tab-pane" type="button" role="tab" aria-controls="name-update-tab-pane"
                                        aria-selected="true">Cập nhật tên</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link update-profile-btn" id="change-password-tab" data-toggle="tab"
                                        data-target="#change-password-tab-pane" type="button" role="tab"
                                        aria-controls="change-password-tab-pane" aria-selected="false">Đổi mật khẩu</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="name-update-tab-pane" role="tabpanel"
                                 aria-labelledby="name-update-tab" tabindex="0">
                                <div class="name-update-content">
                                    <h6 class="pb-3">Tên hiển thị hiện tại: <label class="seller-cur-name"><strong>${sessionScope.USER.name}</strong></label></h6>
                                    <h6>Tên hiển thị mới: <input type="text" name="newName" id="newName" placeholder="Nhập tên mới..." required minlength="2"></h6>
                                    <button class="btn btn-dark name-update-btn" onclick="checkName()">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="change-password-tab-pane" role="tabpanel" aria-labelledby="change-password-tab"
                                 tabindex="0">
                                <div class="change-password-content">
                                    <h6 class="pb-3">Nhập mật khẩu hiện tại: <input type="text"
                                                                                    placeholder="Nhập mật khẩu hiện tại..." id="old-password" required minlength="6"
                                                                                    style="margin-left: .2rem;"></h6>
                                    <h6 class="pb-3">Mật khẩu mới: <input type="text" required minlength="6" placeholder="Nhập mật khẩu mới..."
                                                                          id="new-password" style="margin-left: 4.5rem;"></h6>
                                    <h6 class="pb-3">Xác nhận mật khẩu: <input type="text"
                                                                               placeholder="Xác nhận mật khẩu..." required minlength="6" id="confirm-password"
                                                                               style="margin-left: 2rem;"></h6>
                                    <span style="color: #f00;">* Sau khi thay đổi mật khẩu thành công, trang web sẽ tự đăng
                                        xuất.</span>
                                    <button type="submit" class="btn btn-dark change-password-btn" onclick="checkPassword()">
                                        Xác nhận
                                    </button>
                                </div>
                            </div>
                        </div>
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

        <script type="text/javascript">

                                        function removeAndAddClass() {
                                            const queryString = window.location.search;
                                            const urlParams = new URLSearchParams(queryString);
                                            const type = urlParams.get('type');

                                            if (type != null) {
                                                if (type == "changePassword") {
                                                    var nameUpdateTab = document.getElementById('name-update-tab');
                                                    nameUpdateTab.classList.remove('active');
                                                    var nameUpdateTabPane = document.getElementById('name-update-tab-pane');
                                                    nameUpdateTabPane.classList.remove('show', 'active');

                                                    var changePasswordTab = document.getElementById('change-password-tab');
                                                    changePasswordTab.classList.add('active');
                                                    var changePasswordTabPane = document.getElementById('change-password-tab-pane');
                                                    changePasswordTabPane.classList.add('show', 'active');
                                                }

                                                cleanUri();
                                            }
                                        }

                                        function cleanUri() {
                                            var uri = window.location.toString();
                                            if (uri.indexOf("?") > 0) {
                                                var clean = uri.substring(0, uri.indexOf("?"));
                                                window.history.replaceState({}, document.title, clean);
                                            }
                                        }
        </script>

        <script src="seller/styled-notifications-master/dist/notifications.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

        <script type="text/javascript">

                                        function checkName() {
                                            var newName = document.getElementById('newName').value;
                                            if (newName.length === 0) {
                                                window.createNotification({
                                                    showDuration: 1500,
                                                    theme: 'warning'
                                                })({
                                                    title: 'Lỗi',
                                                    message: 'Tên không được để trống'
                                                });
                                            } else {
                                                window.location.href = '/NestF/updateSellerName?newName=' + newName;
                                            }
                                        }

                                        function checkPassword() {
                                            var oldPass = document.getElementById('old-password').value;
                                            var newPass = document.getElementById('new-password').value;
                                            var confirmPass = document.getElementById('confirm-password').value;

                                            if (oldPass.length < 6 || newPass.length < 6 || confirmPass.length < 6) {
                                                window.createNotification({
                                                    showDuration: 1500,
                                                    theme: 'warning'
                                                })({
                                                    title: "Lỗi",
                                                    message: "Mật khẩu phải bao gồm 6 kí tự."
                                                });
                                            } else if (oldPass !== '${sessionScope.USER.password}') {
                                                window.createNotification({
                                                    showDuration: 1500,
                                                    theme: 'warning'
                                                })({
                                                    title: "Lỗi",
                                                    message: "Mật khẩu của bạn không đúng!"
                                                });
                                            } else if (newPass !== confirmPass) {
                                                window.createNotification({
                                                    showDuration: 1500,
                                                    theme: 'warning'
                                                })({
                                                    title: "Lỗi",
                                                    message: "2 mật khẩu không trùng khớp!"
                                                });
                                            } else if (oldPass === newPass) {
                                                window.createNotification({
                                                   showDuration: 1500,
                                                   theme: 'warning'
                                                })({
                                                    title: "Lỗi",
                                                    message: "Mật khẩu mới không được trùng với mật khẩu cũ."
                                                });
                                            } else {
                                                location = 'sellerUpdatePass?newPass=' + newPass;
                                            }
                                        }

        </script>

    </body>
</html>
