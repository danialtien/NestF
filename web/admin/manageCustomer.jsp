<%-- 
    Document   : dashboard
    Created on : Oct 9, 2022, 10:17:17 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>Accepted Product</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>
    <body id="page-top">
        <!--///////////////Bắt đầu phần Chung//////////////////////////////////////////////////////////-->
        <c:if test="${empty sessionScope.ADMIN}">
            <c:redirect url="loginPage"></c:redirect>
        </c:if>
        <c:if test="${not empty sessionScope.ADMIN}">
            <c:set var="ADMIN" value="${sessionScope.ADMIN}" scope="session"/>
            <c:set var="mapIncome" value="${sessionScope.INCOME}" scope="session"/>
            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a href="home" class="text-center my-xl-2"><img src="img/logo.png" id="logo" width="55px"
                                                                    height="38px"></a>
                    <!-- Divider -->
                    <hr class="sidebar-divider my-0">

                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Dashboard</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">


                    <!-- Nav Item - Charts -->
                    <li class="nav-item">
                        <a class="nav-link" href="adminProfilePage">
                            <i class="fa fa-cog fa-chart-area"></i>
                            <span>Edit profile</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Products Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
                           aria-expanded="true" aria-controls="collapseProducts">
                            <i class="fa fa-cube"></i>
                            <span>Products</span>
                        </a>
                        <div id="collapseProducts" class="collapse" aria-labelledby="headingProducts"
                             data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">List products:</h6>
                                <a class="collapse-item" href="addNewProductPage">Add new products</a>
                                <a class="collapse-item" href="accpetedProductPage">Active products</a>
                                <a class="collapse-item" href="pendingProductPage">Non-active products</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo"
                           aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fa fa-users"></i>
                            <span>User</span>
                        </a>
                        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Manage :</h6>
                                <a class="collapse-item" href="manageSellerPage">Sellers</a>
                                <a class="collapse-item fw-bold" href="manageCustomerPage">Customers</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                           aria-expanded="true" aria-controls="collapsePages">
                            <i class="fas fa-fw fa-folder"></i>
                            <span>Post</span>
                        </a>
                        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Manage: </h6>
                                <a class="collapse-item" href="addPostPage">Add new post</a>
                                <a class="collapse-item" href="activePostPage">Active posts</a>
                                <a class="collapse-item" href="nonActivePost">Non-active posts</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Charts -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVouchers"
                           aria-expanded="true" aria-controls="collapseVouchers">
                            <i class="fa fa-gift"></i>
                            <span>Voucher</span></a>
                        <div id="collapseVouchers" class="collapse" aria-labelledby="headingProducts"
                             data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Manage:</h6>
                                <a class="collapse-item fw-bold" href="voucher">All voucher types</a>
                                <a class="collapse-item" href="updateVoucher?act=add">Add/Update voucher type</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Charts -->
                    <li class="nav-item">
                        <a class="nav-link" href="manageFeedbackPage">
                            <i class="fa fa-comments" aria-hidden="true"></i>
                            <span>Feedback</span></a>
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

                            <!-- Topbar Search -->
                            <form
                                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                           aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-dark" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>

                            <!-- Topbar Navbar -->
                            <ul class="navbar-nav ml-auto">

                                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                <li class="nav-item dropdown no-arrow d-sm-none">
                                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-search fa-fw"></i>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                         aria-labelledby="searchDropdown">
                                        <form class="form-inline mr-auto w-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small"
                                                       placeholder="Search for..." aria-label="Search"
                                                       aria-describedby="basic-addon2">
                                                <div class="input-group-append">
                                                    <button class="btn btn-dark" type="button">
                                                        <i class="fas fa-search fa-sm"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </li>

                                <!-- Nav Item - User Information -->
                                <li class="nav-item dropdown no-arrow">
                                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">${ADMIN.getName()}</span>
                                        <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                    </a>
                                    <!-- Dropdown - User Information -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                         aria-labelledby="userDropdown">
                                        <a class="dropdown-item" href="adminProfilePage">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Profile
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Logout
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <!-- End of Topbar -->

                        <!-- Begin Page Content -->
                        <div class="container-fluid">
                            <!--//////////////////////////////////////////////////////Kết thúc phần Chung/////////////////-->
                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4 row">
                                <div class="col-9">
                                    <h1 class="h3 mb-0 text-gray-800 col-9">List customer</h1> 
                                </div>
                                <div class="col-3 ">
                                    <div class="dropdown float-right">
                                        <button class="btn btn-dark dropdown-toggle" type="button" data-toggle="dropdown">Filter
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu px-3 bg-white text-gray-100">
                                            <li class="my-2"><a href="customerFilter?btAction=all">All</a></li>
                                            <li class="my-2"><a href="customerFilter?btAction=blocked">Blocked</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Row -->

                            <c:if test="${empty requestScope.SORT_CUSTOMER}">
                                <c:if test="${not empty sessionScope.LIST_CUSTOMER}">
                                    <table class="table table-striped table-hover table-bordered">
                                        <thead>
                                            <tr class="text-center">
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>Address</th>
                                                <th>Number of Successful Purchases</th>
                                                <th>Number of Cancel Purchases</th>
                                                <td>Detail</td>
                                                <th>Block</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="customer" items="${sessionScope.LIST_CUSTOMER}">
                                                <c:set var="successCounter" scope="page" value="0" />
                                                <c:set var="cancelCounter" scope="page" value="0" />
                                                <tr class="text-center">
                                                    <td>${customer.name}</td>
                                                    <td>${customer.phone}</td>
                                                    <td>${customer.address}</td>
                                                    <td>
                                                        <c:forEach var="success" items="${sessionScope.SUCCESS_ORDER_LIST}">
                                                            <c:if test="${customer.phone eq success.phone}">
                                                                <c:set var="successCounter" scope="page" value="${successCounter + 1}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        ${successCounter}
                                                    </td>
                                                    <td>
                                                        <c:forEach var="cancel" items="${sessionScope.CANCEL_ORDER_LIST}">
                                                            <c:if test="${customer.phone eq cancel.phone}">
                                                                <c:set var="cancelCounter" scope="page" value="${cancelCounter + 1}" />
                                                            </c:if>
                                                        </c:forEach>
                                                        ${cancelCounter}
                                                    </td>
                                                    <td>
                                                        <a href="CustomerDetailServlet?phone=${customer.phone}" class="text-decoration-none text-dark">View</a>
                                                    </td>
                                                    <td>
                                                        <c:if test="${customer.status}">
                                                            <a href="blockCustomerAction?phone=${customer.phone}&btAction=block" class="btn btn-danger">Block</a>
                                                        </c:if>
                                                        <c:if test="${not customer.status}">
                                                            <a href="blockCustomerAction?phone=${customer.phone}&btAction=unblock" class="btn btn-dark">Unblock</a>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                            </c:if>

                            <c:if test="${not empty requestScope.SORT_CUSTOMER}">
                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Bill ID</th>
                                            <th>Bill Status</th>
                                            <th>Total(VND)</th>
                                            <th>Cancel Reason</th>
                                            <th>Block</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="customer" items="${requestScope.SORT_CUSTOMER}">
                                            <tr class="text-center">
                                                <td>${customer.name}</td>
                                                <td>${customer.phone}</td>
                                                <td>${customer.address}</td>
                                                <td>${customer.billID}</td>
                                                <td>${customer.billStatus}</td>
                                                <td><f:formatNumber  maxIntegerDigits="7" minIntegerDigits="2" value="${customer.total}" var="formattedPrice" />${customer.total}</td>
                                                <td>${customer.cancelReason}</td>
                                                <td>
                                                    <c:if test="${customer.status}">
                                                        <a href="blockCustomerAction?phone=${customer.phone}&btAction=block" class="btn btn-danger">Block</a>
                                                    </c:if>
                                                    <c:if test="${not customer.status}">
                                                        <a href="blockCustomerAction?phone=${customer.phone}&btAction=unblock" class="btn btn-dark">Unblock</a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <br/>

                            <!-- Detail List -->
                            <c:if test="${requestScope.CUS_DETAIL_LIST ne null}">
                                <c:set var="customerDetail" value="${requestScope.CUS_DETAIL_LIST}"></c:set>
                                <h1 class="h3 mb-0 text-gray-800 col-9">Order history of <b>${customerDetail[0].name}</b></h1> 
                                <br>

                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Name</th>
                                            <th>Purchased Products</th>
                                            <th>Status</th>
                                            <th>Cancel Reason</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="customer" items="${requestScope.CUS_DETAIL_LIST}">
                                            <c:if test="${customer.billStatus eq "Đã giao" || customer.billStatus eq "Đã hủy"}">
                                                <tr class="text-center">
                                                    <td>${customer.name}</td>
                                                    <td class="text-left">
                                                        <c:forEach var="product" items="${requestScope.BILL_DETAIL_LIST}">
                                                            <c:if test="${product.billID eq customer.billID}">
                                                                ${product.product.name} <br>
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <td>
                                                        <c:if test="${customer.billStatus eq "Đã giao"}">
                                                            Succeed
                                                        </c:if>
                                                        <c:if test="${customer.billStatus eq "Đã hủy"}">
                                                            Canceled
                                                        </c:if>
                                                    </td>
                                                    <td>${customer.cancelReason}</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                    <!-- End of Page Wrapper -->

                    <!-- Scroll to Top Button-->
                    <a class="scroll-to-top rounded" href="#page-top">
                        <i class="fas fa-angle-up"></i>
                    </a>

                    <!-- Logout Modal-->
                    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">Select "Logout" below if you are ready to end your current session.
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                    <a class="btn btn-dark" href="logoutServlet">Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--            <footer class="sticky-footer bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; NestF 2022</span>
                    </div>
                </div>
            </footer>-->
            <!-- End of Footer -->
            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="vendor/chart.js/Chart.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="js/demo/chart-area-demo.js"></script>
            <script src="js/demo/chart-pie-demo.js"></script>
        </c:if>

    </body>
</html>
