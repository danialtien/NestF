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
        <title>Edit Product</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!--CKEditor-->
        <%--<script type="text/javascript" src="<c:url value='https://cdn.ckeditor.com/4.7.0/full-all/ckeditor.js'/>"></script>--%>
        <script type="text/javascript" src="<c:url value='https://cdn.ckeditor.com/4.7.0/standard/ckeditor.js'/>"></script>

        <link href="./css/productdetail.css" rel="stylesheet">

        <style> 
            .blocker {
                display: none;
            }
        </style>
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
                                        <a class="dropdown-item" href="adminProfile.jsp">
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
                            <div class="mx-3">
                                <c:set var="productDetail" value="${requestScope['PRODUCT_DETAIL']}" scope="page"/>
                                <c:set var="returnPage" value="${requestScope['RETURN_PAGE']}" scope="page"/>
                                <c:if test="${returnPage == 'pending'}">
                                    <a href="viewProductDetail?productID=${productDetail.productID}&productType=pending" class="view px-2" data-toggle="tooltip">
                                        <i class="fa fa-arrow-circle-left text-gray-800 fa-lg" aria-hidden="true"></i>
                                    </a> 
                                </c:if>
                                <c:if test="${returnPage == 'accepted'}">
                                    <a href="viewProductDetail?productID=${productDetail.productID}&productType=accepted" class="view px-2" data-toggle="tooltip">
                                        <i class="fa fa-arrow-circle-left text-gray-800 fa-lg" aria-hidden="true"></i>
                                    </a>
                                </c:if>
                                <span class="h3 mb-0 text-gray-800">Edit product</span>
                            </div>

                            <!-- Content Row -->

                            <div class="card-body ">
                                <c:if test="${requestScope.PRODUCT_DETAIL != null}">
                                    <c:if test="${requestScope.SAVE_PRODUCT != null}">
                                        <c:if test="${empty errors}">
                                            <c:set var="temp" value="${requestScope['SAVE_PRODUCT']}" scope="page"/>
                                            <font color="green">
                                            Cập nhật sản phẩm "${temp.name}" thành công! 
                                            </font> <br/>
                                            <% request.setAttribute("PREVIEW_PRODUCT", null); %>
                                            <% request.setAttribute("SAVE_PRODUCT", null);%>
                                        </c:if>
                                    </c:if>
                                    <jsp:useBean id="productFunc" class="com.nestf.product.ProductDTO"/>
                                    <form action="saveProductAction" method="Post" enctype="multipart/form-data" >
                                        <c:set var="errors" value="${requestScope.PRODUCT_ERR}"/>

                                        <div class="row">
                                            <div class="col-md-6 mb-6 pb-2">
                                                <c:set var="listCategory" value="${sessionScope.LIST_CATEGORY}"/>
                                                <label class="form-label">Category Name</label>

                                                <input class="form-control form-control-lg" type="text" value="${productDetail.category.categoryName}" name="categoryName" list="categorylist"/>
                                                <datalist id="categorylist">
                                                    <label class="form-label select-label">Choose option:</label>
                                                    <option disabled>Choose option</option>
                                                    <c:forEach var="dto" items="${listCategory}">
                                                        <option value="${dto.categoryName}">${dto.categoryName}</option>
                                                    </c:forEach>
                                                </datalist>
                                                <c:if test="${not empty errors.category}">
                                                    <font color="red">
                                                    ${errors.category}
                                                    </font> <br/>
                                                </c:if>
                                            </div>
                                            <div class="col-md-6 mb-4 pb-2">
                                                <c:set var="listSeller" value="${sessionScope.LIST_SELLER}"/>
                                                <label class="form-label">Seller</label>

                                                <input class="form-control form-control-lg" type="text" value="${productDetail.selName}" name="selName" list="sellerlist"/>
                                                <datalist id="sellerlist">
                                                    <label class="form-label select-label">Choose option:</label>
                                                    <option disabled>Choose option</option>
                                                    <c:forEach var="dto" items="${listSeller}">
                                                        <option class="" value="${dto.name}">Number of product: ${dto.selQuantity}</option>
                                                    </c:forEach>
                                                </datalist>
                                                <c:if test="${not empty errors.sellerID}">
                                                    <font color="red">
                                                    ${errors.sellerID}
                                                    </font> <br/>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <label class="form-label" for="txtName">Name</label>
                                                    <input type="text" id="txtName" name="txtName" value="${productDetail.name}" class="form-control form-control-lg" />
                                                    <input type="hidden" name="productID" value="${productDetail.productID}" class="form-control form-control-lg" />
                                                    <c:if test="${not empty errors.name}">
                                                        <font color="red">
                                                        ${errors.name}
                                                        </font> <br/>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-4 row">
                                                <div class="col-md-6 d-flex align-items-center">
                                                    <div class="form-outline datepicker w-100">
                                                        <label for="quantity" class="form-label">Quantity</label>
                                                        <input type="number" min="0" max="1000" value="${productDetail.quantity}" class="form-control form-control-lg" id="quantity" name="quantity" />
                                                    </div>
                                                </div>

                                                <div class="col-md-6">


                                                    <h6 class="mb-2 pb-1">Active </h6>

                                                    <c:set var="returnPage" value="${requestScope['RETURN_PAGE']}" scope="page"/>
                                                    <c:if test="${returnPage == 'pending'}">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="checkFalse"
                                                                   value="false" checked/>
                                                           git  <label class="form-check-label" for="checkFalse">False</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="checkTrue"
                                                                   value="true" />
                                                            <label class="form-check-label" for="checkTrue">True</label>
                                                        </div>
                                                    </c:if>

                                                    <c:if test="${returnPage == 'accepted'}">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="checkFalse"
                                                                   value="false"/>
                                                            <label class="form-check-label" for="checkFalse">False</label>
                                                        </div>

                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="status" id="checkTrue"
                                                                   value="true" checked/>
                                                            <label class="form-check-label" for="checkTrue">True</label>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <label class="form-label" for="numprice">Original Price</label>
                                                    <input type="number" min="0" id="numprice" value="${productDetail.price}" name="numprice" class="form-control form-control-lg" />
                                                    <c:if test="${not empty errors.price}">
                                                        <font color="red">
                                                        ${errors.price}
                                                        </font> <br/>
                                                    </c:if>
                                                </div>
                                            </div>    
                                            <div class="col-md-6 mb-4">
                                                <div class="form-outline">
                                                    <label class="form-label" for="disPrice">New Price</label>
                                                    <input type="number" id="disPrice" name="disPrice" min="0" value="${productDetail.discountPrice}" class="form-control form-control-lg" />
                                                    <c:if test="${not empty errors.discountPrice}">
                                                        <font color="red">
                                                        ${errors.discountPrice}
                                                        </font> <br/>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-4 pb-2">
                                            <div class="form-outline col-12">
                                                <label class="form-label" for="productdesc">Product Description</label>

                                                <textarea name="productdesc" cols="200" rows="50" id="productdesc" class="form-control form-control-lg">
                                                    ${productDetail.productDes}
                                                </textarea>
                                                <c:if test="${not empty errors.productDes}">
                                                    <font color="red">
                                                    ${errors.productDes}
                                                    </font> <br/>
                                                </c:if>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-2 mb-4">
                                                <div class="form-outline text-center">
                                                    <label class="form-label text-gray-800 h5 mt-2" for="">Image</label>
                                                </div>
                                                <c:if test="${not empty errors.image}">
                                                    <font color="red">
                                                    ${errors.image}
                                                    </font> <br/>
                                                </c:if>
                                            </div>
                                            <div class="col-lg-10 mb-4 pb-2">
                                                <c:forEach var="image" items="${productDetail.imagelink}" varStatus="counter"> 
                                                    <div class="form-outline mb-4 blocker">
                                                        <div class="row">
                                                            <c:set var="index" value="${counter.count}" scope="page"/>
                                                            <div class="col-lg-8">
                                                                <input type="file" id="image" name="image${counter.count}" value="${image}" class="form-control form-control-lg" />
                                                            </div>
                                                            <div class="col-lg-4 ">
                                                                <c:if test="${not empty image}">
                                                                    <img src="${image}" width="50px" height="50px">
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                                <c:forEach var = "num" begin = "${index}" end = "4">
                                                    <div class="form-outline mb-4 blocker">
                                                        <div class="row">
                                                            <div class="col-lg-8">
                                                                <input type="file" id="image" name="image${num+1}" value="" class="form-control form-control-lg" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>

                                        </div>
                                        <div id="load" class="col-12 text-center align-content-center">
                                            <div class=" btn btn-primary btn-lg">More</div>
                                        </div>

                                        <!-- PREVIEW CONTENT -->
                                        <div id="white-board" class="bg-white rounded-0">
                                            <c:if test="${requestScope.PREVIEW_PRODUCT != null}">
                                                <c:set var="productDetail" value="${requestScope['PREVIEW_PRODUCT']}" scope="page"/>
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
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        <!--END OF PREVIEW CONTENT -->

                                        <div class="mt-4 text-center pt-2">
                                            <input class="btn btn-primary btn-lg" type="submit" name="btAction" value="Preview" />
                                            <input class="btn btn-danger btn-lg" type="submit" name="btAction" value="Save" />
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                        </div>
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
<!--        <footer class="sticky-footer bg-white sticky-footer">
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
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>

        <script src=”https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js”></script>
        <script src=”https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js”></script>
        <script>
            $(document).ready(function () {
                $(".blocker").slice(0, 1).show();
                if ($(".blocker:hidden").length != 0) {
                    $("#load").show();
                }
                $("#load").on("click", function (e) {
                    e.preventDefault();
                    $(".blocker:hidden").slice(0, 1).slideDown();
                    if ($(".blocker:hidden").length == 0) {
                        $("#load").text("")
                                .fadOut("slow");
                    }
                });
            })
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.thumb a').click(function (e) {
                    e.preventDefault();
                    $('.imgBox img').attr("src", $(this).attr("href"));
                })
            });
        </script>

        <script>
            CKEDITOR.config.pasteFromWordPromptCleanup = true;
            CKEDITOR.config.pasteFromWordRemoveFontStyles = false;
            CKEDITOR.config.pasteFromWordRemoveStyles = false;
            CKEDITOR.config.language = "vi";
            CKEDITOR.config.htmlEncodeOutput = false;
            CKEDITOR.config.ProcessHTMLEntities = false;
            CKEDITOR.config.entities = false;
            CKEDITOR.config.entities_latin = false;
            CKEDITOR.config.ForceSimpleAmpersand = true;
            CKEDITOR.replace('productdesc');
        </script>
    </c:if>
</body>
</html>
