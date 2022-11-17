<%-- 
    Document   : dashboard
    Created on : Oct 9, 2022, 10:17:17 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>Product Detail</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <link href="./css/productdetail.css" rel="stylesheet">

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
                    <li class="nav-item active">
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
                            <span>Edit Profile</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Products Collapse Menu -->
                    <li class="nav-item active">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
                           aria-expanded="true" aria-controls="collapseProducts">
                            <i class="fa fa-cube"></i>
                            <span>Product</span>
                        </a>
                        <div id="collapseProducts" class="collapse" aria-labelledby="headingProducts"
                             data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">List product:</h6>
                                <a class="collapse-item" href="addNewProductPage">Add new product</a>
                                <a class="collapse-item" href="accpetedProductPage">Active products</a>
                                <a class="collapse-item" href="pendingProductPage">Non-active products</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                           aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fa fa-users"></i>
                            <span>Users</span>
                        </a>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Manage: </h6>
                                <a class="collapse-item" href="manageSellerPage">Seller</a>
                                <a class="collapse-item" href="manageCustomerPage">Customer</a>
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
                                        <a class="dropdown-item" href="#">
                                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Settings
                                        </a>
                                        <a class="dropdown-item" href="#">
                                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Activity Log
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
                            <div class="mx-3">
                                <c:set var="returnPage" value="${requestScope['RETURN_PAGE']}" scope="page"/>
                                <c:if test="${returnPage == 'pending'}">
                                    <a href="pendingProductPage" class="my-2 text-decoration-none">
                                        <i class="fa fa-arrow-circle-left text-gray-800 fa-lg" aria-hidden="true"></i>
                                    </a> 
                                </c:if>
                                <c:if test="${returnPage == 'accepted'}">
                                    <a href="accpetedProductPage" class="my-2 text-decoration-none">
                                        <i class="fa fa-arrow-circle-left text-gray-800 fa-lg" aria-hidden="true"></i>
                                    </a>
                                </c:if>
                                <span class="h3 mb-0 text-gray-800">Product detail: </span>
                            </div>


                            <!-- Content Row -->
                            <div id="white-board" class="bg-white rounded-0">
                                <c:if test="${requestScope.PRODUCT_DETAIL != null}">
                                    <c:set var="productDetail" value="${requestScope['PRODUCT_DETAIL']}" scope="page"/>
                                    <jsp:useBean id="productFunc" class="com.nestf.product.ProductDTO"/>
                                    <div class="row container-fluid m-0 mt-3">

                                        <div class="d-inline-block col-4 mt-3 text-center">
                                            <div class="imgBox"><img src="${productDetail.imagelink[0]}" class="rounded" height="395px" width="395px"></div>
                                            <ul class="thumb list-unstyled d-flex row text-center mt-3">
                                                <c:forEach var="image" items="${productDetail.imagelink}" varStatus="counter">
                                                    <li class="col">
                                                        <a href="${image}" target="imgBox"><img src="${image}"  width="50px"></a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="col-7 mt-3 ml-5">
                                            <div class="d-inline-block">
                                                <div class="text-center">
                                                    <h2 class="text-center">${productDetail.name}</h2>
                                                    <c:if test="${productDetail.discountPrice != 0}">
                                                        <h3 class="text-center">${productFunc.printPrice(productDetail.discountPrice)}  <span class="text-decoration-line-through">${productFunc.printPrice(productDetail.price)}</span></h3>
                                                        </c:if>
                                                        <c:if test="${productDetail.discountPrice == 0}">
                                                        <h3 class="text-center">${productFunc.printPrice(productDetail.price)}</h3>
                                                    </c:if>
                                                </div>
                                                <div>
                                                    ${productDetail.productDes}
                                                </div>
                                            </div>

                                            <div id="number-toggle" class="text-center">
                                                <div class="input-group d-inline-block">
                                                    <form action="editProductAction" method="POST">
                                                        <input type="hidden" name="productID" value="${productDetail.productID}"/>
                                                        <input type="hidden" name="productType" value="${returnPage}"/>
                                                        <button type="submit" id="buy-button" class="col-3 me-2 mb-4" value="editProduct">Edit</button>
                                                    </form>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <br/>
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
            </div>
<!--            <footer class="sticky-footer bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; NestF 2022</span>
                    </div>
                </div>
            </footer>-->
            <!-- End of Footer -->
            <!-- Jquery -->
            <script src="https://code.jquery.com/jquery-2.2.4.js" ></script>

            <!-- Bootstrap core JavaScript-->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="./js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <!--<script src="vendor/chart.js/Chart.min.js"></script>-->
            <script src="https://code.jquery.com/jquery-2.2.4.js" ></script>
            <!-- Page level custom scripts -->
            <script src="js/demo/chart-area-demo.js"></script>

            <script type="text/javascript">
                $(document).ready(function () {
                    $('.thumb a').click(function (e) {
                        e.preventDefault();
                        $('.imgBox img').attr("src", $(this).attr("href"));
                    })
                });
            </script>
            <script src="./js/demo/chart-pie-demo.js"></script>
        </c:if>
    </body>
</html>
