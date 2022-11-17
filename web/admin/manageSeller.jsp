<%-- 
    Document   : dashboard
    Created on : Oct 9, 2022, 10:17:17 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="money" class="com.nestf.util.FormatPrinter"></jsp:useBean>

<%@page language="java"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map2 = null;
    List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
    String dataPoints2 = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=NestF;instanceName=SQLEXPRESS", "sa", "123");
        Statement statement = connection.createStatement();
        String xVal, yVal;

        ResultSet resultSet2 = statement.executeQuery("SELECT account.name as xVal, count(ps.selPhone) as total\n"
                + "FROM tblProductSeller ps\n"
                + "RIGHT JOIN (SELECT p.productID\n"
                + "           FROM tblProducts p\n"
                + "           WHERE p.status = 1) as p\n"
                + "           ON ps.productID = p.productID AND ps.isActive = 1\n"
                + "		RIGHT JOIN (SELECT acc.phone, name\n"
                + "            	fROM tblAccount acc\n"
                + "            	WHERE acc.role = 'SE') as account\n"
                + "         ON account.phone = ps.selPhone \n"
                + "Group by account.phone, name");
//        ResultSetMetaData rsmd2 = resultSet2.getMetaData();

        while (resultSet2.next()) {
            xVal = resultSet2.getString("xVal");
            yVal = resultSet2.getString("total");
            map2 = new HashMap<Object, Object>();
            map2.put("label", xVal);
            map2.put("y", Integer.parseInt(yVal));
            list2.add(map2);
            dataPoints2 = gsonObj.toJson(list2);
        }
        connection.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 100px;'>Could not connect to the database. Please check if you have SQLServer Connector installed on the machine - if not, try installing the same.</div>");
        dataPoints2 = null;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>Manage Seller</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="admin/css/register.css">

        <style>
            .canvasjs-chart-credit{
                display: none !important;
            }

        </style>

        <script type="text/javascript">
            window.onload = function () {
//            Pie Chart
            <% if (dataPoints2
                        != null) { %>
                var chart2 = new CanvasJS.Chart("chartContainer2", {
                    theme: "light2",
                    animationEnabled: true,
                    exportFileName: "Pob",
                    exportEnabled: true,
                    title: {
                        text: "Product of Seller"
                    },
                    data: [{
                            type: "doughnut",
//                            showInLegend: true,
                            legendText: "{label}",
                            toolTipContent: "{label}: <strong>{y}%</strong>",
                            indexLabel: "{label} {y}",
                            dataPoints: <%out.print(dataPoints2);%>
                        }]
                });
                chart2.render();
            <% }%>
            }
        </script>
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
                            <span>Edit Profile</span></a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">

                    <!-- Nav Item - Products Collapse Menu -->
                    <li class="nav-item">
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo"
                           aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fa fa-users"></i>
                            <span>Users</span>
                        </a>
                        <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Manage: </h6>
                                <a class="collapse-item fw-bold" href="manageSellerPage">Seller</a>
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
                                <a class="collapse-item fw-bold disabled" href="voucher">All voucher types</a>
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
                            <!--//////////////////////////////////////////////////////Kết thúc phần Chung//////////////////////////////////////////////////////////-->

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between row mb-4">
                                <div class="col-6">
                                    <h1 class="h3 mb-1 text-gray-800 col-9">Manage seller</h1>
                                    <c:if test="${not empty requestScope.SELLER_ERROR}">
                                        <font color="red">
                                        ${requestScope.SELLER_ERROR}
                                        </font> <br/>
                                    </c:if>
                                </div>
                                <div class="col-4">
                                    <c:if test="${not empty sessionScope.MONTH}">
                                        <c:set var="MONTH" value="${sessionScope.MONTH}"/>
                                        <form name="form1" action="checkSellerMonthly" class="row">
                                            <div class="col-2 font-weight-bold">Time :</div>
                                            <input class="col-5 mr-2" value="${MONTH}" min="2022-01" type="month" name="choosetime" onchange="javascript:document.form1.submit();">
                                        </form>
                                    </c:if>
                                </div>
                                <!--Home page popup button-->
                                <div class="col-2 ">
                                    <div class="float-right start-btn">
                                        <input type="checkbox" id="show">
                                        <input type="button" class="show-btn btn btn-dark" data-toggle="modal" data-target="#registerModal" value="Add new seller"></input>
                                    </div>
                                </div>
                            </div>
                            <div id="container-register" style="display: none">
                                <input type="button" class="close-btn" title="close" onclick="closeForm()" value="X" ></input>
                                <div class="text">
                                    Create new seller
                                </div>


                            </div>

                            <!-- Content Row -->
                            <div class="row">
                                <div class="col-8 row">
                                    <div class="col-12">
                                        <c:if test="${not empty sessionScope.MANAGE_SELLER}">
                                            <table class="table table-striped table-hover table-bordered">
                                                <thead>
                                                    <tr class="text-center">
                                                        <th>Name</th>
                                                        <th>Phone</th>
                                                        <th>Number of product</th>
                                                        <th>Revenue</th>
                                                        <th>Block</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="seller" items="${sessionScope.MANAGE_SELLER}">
                                                        <tr class="text-center">
                                                            <td><a class="text-decoration-none" href="managePSeller?phone=${seller.phone}&type=show">${seller.name}</a></td>
                                                            <td>${seller.phone}</td>
                                                            <td><a class="text-decoration-none" href="managePSeller?phone=${seller.phone}&type=show">${seller.selQuantity}</td>
                                                            <td>${money.printMoney(seller.total)}</td>
                                                            <td>
                                                                <c:if test="${seller.status}">
                                                                    <a href="managePSeller?phone=${seller.phone}&product=${seller.selQuantity}&type=block" class="btn btn-danger">Block</a>
                                                                </c:if>

                                                                <c:if test="${not seller.status}">
                                                                    <a href="managePSeller?phone=${seller.phone}&type=unblock" class="btn btn-dark">Unblock</a>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </div>
                                    <div class="col-12"><br/></div>
                                    <div class="col-12">
                                        <c:if test="${not empty requestScope.PRODUCT_SELLER}">
                                            <c:set var="selName" value="${requestScope.SELLER_NAME}"/>
                                            <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                                 aria-hidden="true">
                                                <div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Sản phẩm của ${selName}</h5>
                                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">×</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table table-striped table-hover table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <!--<th class="text-center">ID</th>-->
                                                                        <th class="text-center">Name</th>
                                                                        <!--<th class="text-center">Price</th>-->
                                                                        <!--<th class="text-center">Quantity</th>-->
                                                                        <th class="text-center">Category</th>
                                                                        <!--<th class="text-center">Discount</th>-->
                                                                        <th class="text-center">Change Seller</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach var="product" items="${requestScope.PRODUCT_SELLER}">
                                                                        <tr>
                                                                            <%-- <td>${product.productID}</td>--%>
                                                                            <td>${product.name}</td>
                                                                            <%-- <td>${product.price}</td>--%>
                                                                            <%-- <td>${product.quantity}</td>--%>
                                                                            <td>${product.category.categoryName}</td>
                                                                            <%-- <td>${product.discountPrice}</td>--%>
                                                                            <td>
                                                                                <c:set var="listSeller" value="${sessionScope.LIST_SELLER}"/>
                                                                                <form action="changeSeller">
                                                                                    <div  class="row">
                                                                                        <input type="hidden" value="${product.selName}" name="selNameOld"/>
                                                                                        <input class="form-control form-control-sm col-7 ml-2 mr-1" type="text" value="${product.selName}" name="selNameNew" list="sellerlist"/>
                                                                                        <input type="hidden" value="${product.productID}" name="productID"/>

                                                                                        <datalist id="sellerlist">
                                                                                            <label class="form-label select-label">Choose option:</label>
                                                                                            <option disabled>Choose option</option>
                                                                                            <c:forEach var="dto" items="${listSeller}">
                                                                                                <option class="" value="${dto.name}">Number of product: ${dto.selQuantity}</option>
                                                                                            </c:forEach>
                                                                                        </datalist>
                                                                                        <input class="btn btn-dark col-4 mr-1" type="submit" name="btAction" value="Change" />
                                                                                    </div>
                                                                                </form>

                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type=button" class="d-none" data-toggle="modal" data-target="#productModal" id="triggerProductModal">
                                                Logout
                                            </button>                                           
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="card shadow mb-2 ">
                                        <div class="card-body pb-5">
                                            <div class="chart-area">
                                                <div id="chartContainer2" style="height: 350px; width: 100%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End of Content Row -->
                        </div>
                        <!-- End of Content Wrapper -->

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

                    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form action="AddNewSeller">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>

                                    <div class="modal-body">


                                        <div class="data">
                                            <label>Full Name</label>
                                            <input type="text" required  name="name" required minlength="6" maxlength="30" placeholder="6 - 30 ký tự">
                                        </div>
                                        <div class="data sencondchild">
                                            <label>Gender</label>
                                            <span class="gender" style="white-space: nowrap;">
                                                <input type="radio" id="male" checked="" name="gender" value="1">
                                                <label for="male">Nam&emsp;</label>
                                                <input type="radio" id="female" name="gender" value="0">
                                                <label for="female">Nữ</label>
                                            </span>
                                        </div>
                                        <div class="data">
                                            <label>Phone number</label>
                                            <input type="number"  name="phone" required minlength="10" maxlength="11" placeholder="10 - 11 chữ số">
                                        </div>
                                        <div class="data">
                                            <label>Password</label>
                                            <input type="password" name="password" required minlength="6" maxlength="20" id="password" placeholder="6 - 20 ký tự">
                                        </div>
                                        <div class="data">
                                            <label>Confirm Password</label>
                                            <input type="password" name="confirm" required minlength="6" maxlength="20" id="confirm" onblur="validate();">
                                        </div>
                                        <div class="data">
                                            <label>Address</label>
                                            <input type="text" name="address" required minlength="10" maxlength="70" placeholder="20 - 70 ký tự">
                                        </div>




                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                        <button class="btn btn-dark" type="submit">Create</button>
                                    </div>
                                </form>
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

            <script src="./js/nestf.js"></script>

            <script>
                                                function openForm() {
                                                    document.getElementById("container-register").style.display = "block";
                                                }

                                                function closeForm() {
                                                    document.getElementById("container-register").style.display = "none";
                                                }
                <c:if test="${not empty requestScope.PRODUCT_SELLER}">
                                                window.onload = function () {
                                                    document.getElementById("triggerProductModal").click();
                                                }
                </c:if>

            </script>
            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

        </c:if>
    </body>
</html>
