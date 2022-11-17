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
        <title>Update post</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!--CKEditor-->
        <%--<script type="text/javascript" src="<c:url value='https://cdn.ckeditor.com/4.7.0/full-all/ckeditor.js'/>"></script>--%>
        <script type="text/javascript" src="<c:url value='https://cdn.ckeditor.com/4.7.0/standard/ckeditor.js'/>"></script>

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
                                <a class="collapse-item" href="accpetedProductPage">Active Product</a>
                                <a class="collapse-item" href="pendingProductPage">Non-Active Product</a>
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
                                <h6 class="collapse-header">Manage :</h6>
                                <a class="collapse-item" href="manageSellerPage">Sellers</a>
                                <a class="collapse-item" href="manageCustomerPage">Customers</a>
                            </div>
                        </div>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item active">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                           aria-expanded="true" aria-controls="collapsePages">
                            <i class="fas fa-fw fa-folder"></i>
                            <span>Posts</span>
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
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Update post</h1>
                            </div>

                            <!-- Content Row -->

                            <div class="card-body ">
                                <c:set var="post" value="${requestScope['POST_DETAIL']}" scope="page"/>
                                <c:set var="errors" value="${requestScope.POST_ERROR}"/>
                                <c:if test="${requestScope.PREVIEW_POST != null}">
                                    <c:if test="${empty errors}">
                                        <c:set var="temp" value="${requestScope['PREVIEW_POST']}" scope="page"/>
                                        <font color="green">
                                        Bạn vừa cập nhật post thành công! " ${temp.title} "
                                        </font> <br/>
                                        <% request.setAttribute("PREVIEW_POST", null); %>
                                        <% request.setAttribute("POST_DETAIL", null);%>
                                    </c:if>
                                </c:if>
                                <jsp:useBean id="postFunc" class="com.nestf.post.PostDTO"/>
                                <br/>
                                <form action="savePostAction" method="Post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <label class="form-label" for="txtName">Title</label>
                                                <input type="text" id="txtName" name="title" value="${post.title}" class="form-control form-control-lg" />
                                                <c:if test="${not empty errors.title}">
                                                    <font color="red">
                                                    ${errors.title}
                                                    </font> <br/>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4 pb-2">
                                            <div class="form-outline">
                                                <label class="form-label" for="txtName">Thumbnail</label>
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <input type="file" id="txtName" name="thumbnail" value="${post.thumbnail}" class="form-control form-control-lg" />
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <c:if test="${not empty post.thumbnail}">
                                                            <img src="${post.thumbnail}" width="50px" height="50px">
                                                        </c:if>
                                                    </div>

                                                    <c:if test="${not empty errors.thumbnail}">
                                                        <font color="red">
                                                        ${errors.thumbnail}
                                                        </font> <br/>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class=" mb-4 pb-2 col-12">
                                            <div class="form-outline">
                                                <label class="form-label" for="">Post Content</label>
                                                <textarea name="content" cols="200" rows="20" id="productdesc" class="form-control form-control-lg">
                                                    ${post.content}
                                                </textarea>
                                                <c:if test="${not empty errors.content}">
                                                    <font color="red">
                                                    ${errors.content}
                                                    </font> <br/>
                                                </c:if>
                                            </div>
                                        </div>
                                        <input type="hidden" name="adPhone" value="${ADMIN.getPhone()}"/>
                                        <input type="hidden" name="postID" value="${post.postID}"/>                                        
                                    </div>
                                    <div class="mt-4 pt-2 text-center mb-4">
                                        <a href="previewAction?postID=${post.postID}" class="btn btn-primary btn-lg" >Preview</a>
                                        <input class="btn btn-danger btn-lg" type="submit" name="action" value="Submit" />
                                    </div>
                                </form>
                            </div>
                        </div>

                        <br>

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
                CKEDITOR.replace('image');
            </script>
        </c:if>
    </body>
</html>
