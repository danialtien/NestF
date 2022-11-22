<%-- 
    Document   : dashboard
    Created on : Oct 9, 2022, 10:17:17 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page language="java"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<jsp:useBean id="formatter" class="com.nestf.util.FormatPrinter"/>
<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    Map<Object, Object> map2 = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
    List<Map<Object, Object>> list2 = new ArrayList<Map<Object, Object>>();
    String dataPoints = null;
    String dataPoints2 = null;
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=NestF;instanceName=SQLEXPRESS", "sa", "123");
        Statement statement = connection.createStatement();
        String xVal, yVal;

        ResultSet resultSet = statement.executeQuery("SELECT MONTH(b.time) as xVal,  SUM(b.total) as total FROM tblBill b JOIN tblStatus s ON b.statusID = s.statusID WHERE b.statusID = 4 GROUP BY  MONTH(b.time)");
//        ResultSet resultSet = statement.executeQuery("SELECT CAST (b.time as date) as xVal,  SUM(b.total) as total FROM tblBill b JOIN tblStatus s ON b.statusID = s.statusID WHERE b.statusID = 4 GROUP BY CAST (b.time as date) Order by CAST (b.time as date)");
//        ResultSet resultSet = statement.executeQuery("Select b.billID as xVal, b.total FROM tblBill b where b.statusID = 4 ");
//        ResultSetMetaData rsmd = resultSet.getMetaData();

//        while (resultSet.next()) {
//            xVal = resultSet.getString("xVal");
//            yVal = resultSet.getString("total");
//            map = new HashMap<Object, Object>();
//            map.put("x", Integer.parseInt(xVal));
//            map.put("y", Float.parseFloat(yVal));
//            list.add(map);
//            dataPoints = gsonObj.toJson(list);
//        }
//        while (resultSet.next()) {
//            xVal = resultSet.getString("xVal");
//            yVal = resultSet.getString("total");
//            map = new HashMap<Object, Object>();
//            map.put("label", xVal);
//            map.put("y", Float.parseFloat(yVal));
//            list.add(map);
//            dataPoints = gsonObj.toJson(list);
//        }
        while (resultSet.next()) {
            int month = Integer.parseInt(resultSet.getString("xVal"));
            switch (month) {
                case 1:
                    xVal = "Jan";
                    break;
                case 2:
                    xVal = "Feb";
                    break;
                case 3:
                    xVal = "Mar";
                    break;
                case 4:
                    xVal = "Apr";
                    break;
                case 5:
                    xVal = "May";
                    break;
                case 6:
                    xVal = "Jun";
                    break;
                case 7:
                    xVal = "Jul";
                    break;
                case 8:
                    xVal = "Aug";
                    break;
                case 9:
                    xVal = "Sep";
                    break;
                case 10:
                    xVal = "Oct";
                    break;
                case 11:
                    xVal = "Nov";
                    break;
                default:
                    xVal = "Dec";
                    break;
            }

            yVal = resultSet.getString("total");
            map = new HashMap<Object, Object>();
            map.put("label", xVal);
            map.put("y", Float.parseFloat(yVal));
            list.add(map);
            dataPoints = gsonObj.toJson(list);
        }

        ResultSet resultSet2 = statement.executeQuery("SELECT s.statusID, s.status, Count(b.billID) as total \n"
                + "FROM tblBill b\n"
                + "INNER JOIN tblStatus s\n"
                + "ON b.statusID = s.statusID AND s.statusID <> 4 AND s.statusID <> 5\n"
                + "GROUP BY s.statusID, s.status");
//        ResultSetMetaData rsmd2 = resultSet2.getMetaData();

        while (resultSet2.next()) {
            xVal = resultSet2.getString("status");
            yVal = resultSet2.getString("total");
            map2 = new HashMap<Object, Object>();
            map2.put("label", xVal);
            map2.put("y", Integer.parseInt(yVal));
            list2.add(map2);
            dataPoints2 = gsonObj.toJson(list2);
        }
        connection.close();
    } catch (SQLException e) {
        out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 100px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
        dataPoints = null;
        dataPoints2 = null;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>NestF - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <style>
            .canvasjs-chart-credit{
                display: none !important;
            }

        </style>

        <script type="text/javascript">
            window.onload = function () {

            <% if (dataPoints
                        != null) { %>
                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    exportFileName: "RevenueNestF",
                    exportEnabled: true,
                    title: {
                        text: "Revenue of NestF"
                    },
                    axisX: {
                        title: "Month",
                        gridThickness: 2,
                        interval: 1,
                        labelAngle: -20
                    },
                    axisY: {
                        title: "Revenue"
                    },
                    data: [{
                            type: "spline",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();
            <% }%>

//            Pie Chart
            <% if (dataPoints2
                        != null) { %>
                var chart2 = new CanvasJS.Chart("chartContainer2", {
                    theme: "light2",
                    animationEnabled: true,
                    exportFileName: "Bill Status",
                    exportEnabled: true,
                    title: {
                        text: "On Processing"
                    },
                    data: [{
                            type: "pie",
                            showInLegend: false,
                            legendText: "{label}",
                            toolTipContent: "{label}: <strong>{y}%</strong>",
                            indexLabel: "{label} {y}%",
                            dataPoints: <%out.print(dataPoints2);%>
                        }]
                });
                chart2.render();
            <% }%>
            }
        </script>

    </head>
    <body id="page-top">
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

                            <!-- Page Heading -->
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            </div>

                            <!-- Content Row -->
                            <div class="row">

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-dark shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">
                                                        Earnings (Today)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${formatter.printMoney(requestScope.TODAY_REVENUE)}</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-success shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                        Earnings (Annual)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${formatter.printMoney(requestScope.YEAR_REVENUE)}</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Today) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-info shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Order Processed (Today)
                                                    </div>
                                                    <div class="row no-gutters align-items-center">
                                                        <c:set var="percentage" value="${requestScope.TODAY_BILLS eq 0 ? 100 : (1-(requestScope.TODAY_PENDING/requestScope.TODAY_BILLS))*100}"/>
                                                        <div class="col-auto">
                                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${formatter.noFraction(percentage)}%</div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="progress progress-sm mr-2">
                                                                <div class="d-inline-block progress-bar bg-info" role="progressbar"
                                                                     style="width: ${percentage}%" aria-valuenow="${percentage}" aria-valuemin="0"
                                                                     aria-valuemax="100">                                                                   
                                                                </div>                                                               
                                                            </div>
                                                            <div class="position-absolute text-dark bg-light border border-dark rounded p-2" id="billProcessingBarInfo">
                                                                <b>Today</b>
                                                                <div class="row">
                                                                    <div class="col-10">
                                                                    No. orders:<br>
                                                                    Not processed:
                                                                </div>
                                                                <div class="col-1">
                                                                    ${requestScope.TODAY_BILLS}<br>
                                                                    ${requestScope.TODAY_PENDING}
                                                                </div>
                                                                </div>                                                              
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Pending Products Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                        No. Pending Orders (All time) </div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${requestScope.PENDING_BILLS}</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Row -->

                            <div class="row">
                                <!-- Spline Chart -->

                                <div class="col-xl-8 col-lg-7">
                                    <div class="card shadow mb-2">

                                        <div class="card-body pb-5">
                                            <div class="chart-area">
                                                <div id="chartContainer" style="height: 350px; width: 100%; align-content: center"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Pie Chart -->
                                <div class="col-xl-4 col-lg-5">
                                    <div class="card shadow mb-2 ">

                                        <div class="card-body pb-5">
                                            <div class="chart-area">
                                                <div id="chartContainer2" style="height: 350px; width: 100%;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Row -->
                            <!--                            <div class="row">
                            
                                                             Content Column 
                                                            <div class="col-lg-6 mb-4">
                            
                                                                 Project Card Example 
                                                                <div class="card shadow mb-4">
                                                                    <div class="card-header py-3">
                                                                        <h6 class="m-0 font-weight-bold text-dark">Best Product</h6>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <h4 class="small font-weight-bold">Server Migration <span
                                                                                class="float-right">20%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Sales Tracking <span
                                                                                class="float-right">40%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                                                                 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Customer Database <span
                                                                                class="float-right">60%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar" role="progressbar" style="width: 60%"
                                                                                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Payout Details <span
                                                                                class="float-right">80%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                                                                 aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Account Setup <span
                                                                                class="float-right">Complete!</span></h4>
                                                                        <div class="progress">
                                                                            <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                                                                 aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                            
                                                            <div class="col-lg-6 mb-4">
                            
                                                                 Best Sellers 
                                                                <div class="card shadow mb-4">
                                                                    <div class="card-header py-3">
                                                                        <h6 class="m-0 font-weight-bold text-dark">Best Sellers</h6>
                                                                    </div>
                                                                    <div class="card-body">
                                                                        <h4 class="small font-weight-bold">Server Migration <span
                                                                                class="float-right">20%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                                                                 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Sales Tracking <span
                                                                                class="float-right">40%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                                                                 aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Customer Database <span
                                                                                class="float-right">60%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar" role="progressbar" style="width: 60%"
                                                                                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Payout Details <span
                                                                                class="float-right">80%</span></h4>
                                                                        <div class="progress mb-4">
                                                                            <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                                                                 aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                        <h4 class="small font-weight-bold">Account Setup <span
                                                                                class="float-right">Complete!</span></h4>
                                                                        <div class="progress">
                                                                            <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                                                                 aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                            
                            
                                                            </div>
                                                             /.container-fluid 
                            
                                                        </div>-->

                            <!-- End of Main Content -->



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
                </div>
            </div>
            <!-- Footer -->
            <!--            <footer class="sticky-footer bg-white">
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

            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        </c:if>
    </body>
</html>
