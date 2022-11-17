
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <body id="page-top" onload="filterChart('on-delivery-monthly', 'ondelivery-income-table')">

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
                <li class="nav-item active">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseIncome"
                       aria-expanded="true" aria-controls="collapseIncome">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Tài chính</span>
                    </a>
                    <div class="collapse show active" id="collapseIncome" aria-labelledby="headingIncome"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Doanh thu: </h6>
                            <a href="#" class="collapse-item active">Doanh thu</a>
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
                    <div class="container col-lg-10">
                        <jsp:useBean id="printPriceFunc" scope="page" class="com.nestf.product.ProductDTO"></jsp:useBean>

                            <div class="income-content-header">
                                <h4 class="income-header-title text-black">Tổng quan</h4>
                                <div class="income-content-header-content">
                                    <div class="income-header-on-delivery py-2 collapse-inner col-4 d-inline-block">
                                        <h5>Đang giao</h5>
                                        <h6 class="collapse-header income-header-content-label">Tổng cộng: </h6>
                                        <a href="#on-delivery-tab-pane" class="collapse-item"><strong>${printPriceFunc.printPrice(requestScope.ON_DELIVERY_TOTAL)}</strong></a>
                                </div>
                                <div class="income-header-delivered py-2 collapse-inner col-4 d-inline-block">
                                    <h5>Đã giao</h5>
                                    <h6 class="collapse-header income-header-content-label">Tổng cộng: </h6>
                                    <a href="#paid-tab-pane" class="collapse-item"><strong>${printPriceFunc.printPrice(requestScope.DELIVERED_TOTAL)}</strong></a>
                                </div>
                            </div>
                        </div>

                        <div class="income-content-body">
                            <h4 class="income-body-title">Chi tiết</h4>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active income-btn" id="on-delivery-income-tab" data-toggle="tab"
                                            data-target="#on-delivery-income-tab-pane" type="button" role="tab"
                                            aria-controls="on-delivery-income-tab-pane" aria-selected="true">
                                        Đang giao
                                    </button>
                                </li>

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link income-btn" id="delivered-income-tab" data-toggle="tab"
                                            data-target="#delivered-income-tab-pane" type="button" role="tab" aria-controls="delivered-income-tab-pane"
                                            aria-selected="true" onclick="filterChart('delivered-monthly', 'delivered-income-table')">
                                        Đã giao
                                    </button>
                                </li>

                            </ul>


                            <div class="tab-content" id="myTabContent">
                                <!-- Content for Đang giao -->
                                <div class="tab-pane fade show active" id="on-delivery-income-tab-pane" role="tabpanel"
                                     aria-labelledby="on-delivery-income-tab" tabindex="0">

                                    <div class="view-by-month">
                                        <select name="monthly" id="on-delivery-monthly" value=""
                                                onchange="filterChart('on-delivery-monthly', 'ondelivery-income-table')">
                                            <jsp:useBean id="date" class="java.util.Date" />
                                            <fmt:formatDate var="curMonth" value="${date}" pattern="MM" />
                                            <c:forEach var="month" items="${requestScope.LIST_MONTH}">
                                                <option value="<c:if test="${month < 10}">0</c:if>${month}" <c:if test="${month eq curMonth}">selected="select"</c:if>>Tháng ${month}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div id="chart-div-1"></div>

                                    <table class="table table-hover table-secondary" id="ondelivery-income-table">
                                        <thead>
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Tháng</th>
                                        <th scope="col">Doanh thu</th>
                                        <th scope="col">Thao tác</th>
                                        </thead>
                                        <tbody>
                                            <c:if test="${requestScope.ON_DELIVERY_INCOME != null}">
                                                <c:forEach var="onDeliveryIncome" varStatus="counter" items="${requestScope.ON_DELIVERY_INCOME}">
                                                    <tr class="tr-income-information">
                                                        <td><fmt:formatDate value="${onDeliveryIncome.date}" pattern="dd"></fmt:formatDate></td>
                                                        <td><fmt:formatDate value="${onDeliveryIncome.date}" pattern="MM"></fmt:formatDate></td>
                                                        <td>${printPriceFunc.printPrice(onDeliveryIncome.total)}</td>
                                                        <td>
                                                            <fmt:formatDate value="${onDeliveryIncome.date}" pattern="dd-MM-yyyy" var="orderDate"></fmt:formatDate>
                                                                <button class="btn btn-dark text-white" type="button" data-toggle="modal"
                                                                        data-target="#incomeDetailModal${counter.count}">
                                                                <i class="fa fa-eye"></i>
                                                                Chi tiết
                                                            </button>

                                                            <div class="modal fade" id="incomeDetailModal${counter.count}" tabindex="-1"
                                                                 role="dialog" aria-labelledby="incomeDetailModal${counter.count}"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-center modal-xl text-dark">
                                                                    <div class="modal-content income-detail-modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="staticBackdropLabel">Ngày <strong>${orderDate}</strong>
                                                                            </h5>
                                                                            <button type="button" class="close" data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body" style="color: #000;">
                                                                            <h5 class="orders-title">Đơn hàng</h5>
                                                                            <c:if test="${requestScope.LIST_ORDER != null}">
                                                                                <c:forEach var="orderDetail" items="${requestScope.LIST_ORDER}">
                                                                                    <fmt:formatDate value="${orderDetail.time}" pattern="dd-MM-yyyy" var="detailDate"></fmt:formatDate>
                                                                                    <c:if test="${detailDate eq orderDate && orderDetail.status.statusID == 3}">
                                                                                        <div class="all-order-content">
                                                                                            <p class="order-id d-inline-block">Mã đơn: #<strong>NESTF${orderDetail.billID}</strong></p>

                                                                                            <h6 class="float-right pt-3 pr-3">SĐT khách hàng: <strong>${orderDetail.cusPhone}</strong>
                                                                                            </h6>

                                                                                            <table
                                                                                                class="table table-content income-detail-table-content">
                                                                                                <thead class="orders-table-header">
                                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                                <th scope="col">Số lượng</th>
                                                                                                <th scope="col">Giá SP khi giảm (nếu có)</th>
                                                                                                <th scope="col">Vận chuyển</th>
                                                                                                </thead>
                                                                                                <tbody class="orders-table-body">
                                                                                                    <c:forEach var="productBill" items="${orderDetail.detail}">
                                                                                                        <c:set var="productImage" value="${productBill.product.imagelink}"></c:set>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <img src="${productImage[0]}"
                                                                                                                     alt="Image for ${productBill.product.name}">
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <p>${productBill.product.name}
                                                                                                                </p>
                                                                                                                <strong>${printPriceFunc.printPrice(productBill.product.price)}</strong>
                                                                                                                <br>
                                                                                                                <span class="cate-title">Danh mục: ${productBill.product.category.categoryName}</span>
                                                                                                            </td>
                                                                                                            <td>${productBill.quantity}</td>
                                                                                                            <td>
                                                                                                                <c:if test="${productBill.product.discountPrice ne 0}">
                                                                                                                    ${printPriceFunc.printPrice(productBill.product.discountPrice)} 
                                                                                                                </c:if>
                                                                                                                <c:if test="${productBill.product.discountPrice eq 0}">
                                                                                                                    ${printPriceFunc.printPrice(productBill.price)}
                                                                                                                </c:if>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <img src="img\GHTK.png"
                                                                                                                     alt="Image for GHTK"
                                                                                                                     width="50px" height="50px">
                                                                                                                GHTK
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </div>
                                                                        <!-- End modal body -->        
                                                                    </div>
                                                                    <!-- End modal content -->
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${requestScope.ON_DELIVERY_INCOME == null}">
                                            <div class="delivered-income-content">
                                                <img src="img/income-no-result.png" alt="Image for no Income result">
                                                <h5>Không có lịch sử thanh toán nào.</h5>
                                            </div>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End content Sẽ thanh toán -->

                                <!-- Content for Đã thanh toán -->
                                <div class="tab-pane" id="delivered-income-tab-pane" role="tabpane" aria-labelledby="delivered-income-tab"
                                     tabindex="0">
                                    <div class="view-by-month">
                                        <select name="monthly" id="delivered-monthly" value=""
                                                onchange="filterChart('delivered-monthly', 'delivered-income-table')">
                                            <c:forEach var="month" items="${requestScope.LIST_MONTH}">
                                                <option value="<c:if test="${month < 10}">0</c:if>${month}" <c:if test="${month eq curMonth}">selected="select"</c:if>>Tháng ${month}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div id="chart-div-2"></div>

                                    <table class="table table-hover table-secondary" id="delivered-income-table">
                                        <thead>
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Tháng</th>
                                        <th scope="col">Doanh thu</th>
                                        <th scope="col">Thao tác</th>
                                        </thead>
                                        <tbody>
                                            <c:if test="${requestScope.DELIVERED_INCOME != null}">
                                                <c:forEach var="deliveredIncome" varStatus="counter" items="${requestScope.DELIVERED_INCOME}">
                                                    <tr class="tr-income-information">
                                                        <td><fmt:formatDate value="${deliveredIncome.date}" pattern="dd"></fmt:formatDate></td>
                                                        <td><fmt:formatDate value="${deliveredIncome.date}" pattern="MM"></fmt:formatDate></td>
                                                        <td>${printPriceFunc.printPrice(deliveredIncome.total)}</td>
                                                        <td>
                                                            <fmt:formatDate value="${deliveredIncome.date}" pattern="dd-MM-yyyy" var="orderDate"></fmt:formatDate>
                                                                <button class="btn btn-dark text-white" type="button" data-toggle="modal"
                                                                        data-target="#incomeDetailModalB${counter.count}">
                                                                <i class="fa fa-eye"></i>
                                                                Chi tiết
                                                            </button>

                                                            <div class="modal fade" id="incomeDetailModalB${counter.count}" tabindex="-1"
                                                                 role="dialog" aria-labelledby="incomeDetailModalB${counter.count}"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-center modal-xl text-dark">
                                                                    <div class="modal-content income-detail-modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="staticBackdropLabel">Ngày <strong>${orderDate}</strong>
                                                                            </h5>
                                                                            <button type="button" class="close" data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body" style="color: #000;">
                                                                            <h5 class="orders-title">Đơn hàng</h5>
                                                                            <c:if test="${requestScope.LIST_ORDER != null}">
                                                                                <c:forEach var="orderDetail" items="${requestScope.LIST_ORDER}">
                                                                                    <fmt:formatDate value="${orderDetail.time}" pattern="dd-MM-yyyy" var="detailDate"></fmt:formatDate>
                                                                                    <c:if test="${detailDate eq orderDate && orderDetail.status.statusID == 4}">
                                                                                        <div class="all-order-content">
                                                                                            <p class="order-id d-inline-block">Mã đơn: #<strong>NESTF${orderDetail.billID}</strong></p>

                                                                                            <h6 class="float-right pt-3 pr-3">SĐT khách hàng: <strong>${orderDetail.cusPhone}</strong>
                                                                                            </h6>

                                                                                            <table
                                                                                                class="table table-content income-detail-table-content">
                                                                                                <thead class="orders-table-header">
                                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                                <th scope="col">Số lượng</th>
                                                                                                <th scope="col">Giá SP khi giảm (nếu có)</th>
                                                                                                <th scope="col">Vận chuyển</th>
                                                                                                </thead>
                                                                                                <tbody class="orders-table-body">
                                                                                                    <c:forEach var="productBill" items="${orderDetail.detail}">
                                                                                                        <c:set var="productImage" value="${productBill.product.imagelink}"></c:set>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <img src="${productImage[0]}" alt="Image for ${productBill.product.name}" >
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <p>${productBill.product.name}
                                                                                                                </p>
                                                                                                                <strong>${printPriceFunc.printPrice(productBill.product.price)}</strong>
                                                                                                                <br>
                                                                                                                <span class="cate-title">Danh mục: ${productBill.product.category.categoryName}</span>
                                                                                                            </td>
                                                                                                            <td>${productBill.quantity}</td>
                                                                                                            <td>
                                                                                                                <c:if test="${productBill.product.discountPrice ne 0}">
                                                                                                                    ${printPriceFunc.printPrice(productBill.product.discountPrice)}                                                                                                                    
                                                                                                                </c:if>
                                                                                                                <c:if test="${productBill.product.discountPrice eq 0}">
                                                                                                                    ${printPriceFunc.printPrice(productBill.product.price)}
                                                                                                                </c:if>
                                                                                                            </td>
                                                                                                            <td>
                                                                                                                <img src="img\GHTK.png"
                                                                                                                     alt="Image for GHTK"
                                                                                                                     width="50px" height="50px">
                                                                                                                GHTK
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </div>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </c:if>
                                                                        </div>
                                                                        <!-- End modal body -->        
                                                                    </div>
                                                                    <!-- End modal content -->
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${requestScope.DELIVERED_INCOME == null}">
                                            <div class="delivered-income-content">
                                                <img src="img/income-no-result.png" alt="Image for no Income result">
                                                <h5>Không có lịch sử thanh toán nào.</h5>
                                            </div>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!-- End index content -->

                </div>

            </div>
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

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <script type="text/javascript">

                                                    function getOnDeliveryData() {
                                                        var data = [
            <c:if test="${requestScope.ON_DELIVERY_INCOME != null}">
                <c:forEach var="onDeliveryIncome" items="${requestScope.ON_DELIVERY_INCOME}">
                    <fmt:formatDate value="${onDeliveryIncome.date}" pattern="dd" var="day"></fmt:formatDate>
                    <fmt:formatDate value="${onDeliveryIncome.date}" pattern="MM" var="month"></fmt:formatDate>
                                                        [${month}, ${day}, ${onDeliveryIncome.total}],
                </c:forEach>
            </c:if>
                                                        ];
                                                        return data;
                                                    }

                                                    google.charts.load('current', {'packages': ['corechart']});

                                                    google.charts.setOnLoadCallback(drawWillPayChart);

                                                    google.charts.setOnLoadCallback(drawPaidChart);

                                                    function drawWillPayChart() {
                                                        var data = new google.visualization.DataTable();

                                                        data.addColumn('number', 'Tháng');
                                                        data.addColumn('number', 'Doanh thu');

                                                        var values = getOnDeliveryData();

                                                        var select = document.getElementById('on-delivery-monthly');
                                                        var selectValue = select.value;

                                                        for (var i = 0; i < values.length; i++) {
                                                            for (var j = 1; j < 2; j++) {
                                                                if (values[i][0] == selectValue) {
                                                                    data.addRows([
                                                                        [values[i][j], values[i][j + 1]]
                                                                    ]);
                                                                }
                                                            }
                                                        }

                                                        var option = {
                                                            title: 'Đang giao [VNĐ]',
                                                            backgroundColor: {fill: 'transparent'},
                                                            fontName: 'inherit',
                                                            height: 400,
                                                            hAxis: {
                                                                title: 'Tháng ' + selectValue,
                                                                gridlines: {
                                                                    color: 'transparent'
                                                                }
                                                            },
                                                            vAxis: {minValue: 0}
                                                        };

                                                        var chart = new google.visualization.AreaChart(document.getElementById('chart-div-1'));
                                                        chart.draw(data, option);
                                                    }

                                                    function getDeliveredData() {
                                                        var data = [
            <c:if test="${requestScope.DELIVERED_INCOME != null}">
                <c:forEach var="deliveredIncome" items="${requestScope.DELIVERED_INCOME}">
                    <fmt:formatDate value="${deliveredIncome.date}" pattern="dd" var="day"></fmt:formatDate>
                    <fmt:formatDate value="${deliveredIncome.date}" pattern="MM" var="month"></fmt:formatDate>
                                                        [${month},${day}, ${deliveredIncome.total}],
                </c:forEach>
            </c:if>
                                                        ];
                                                        return data;
                                                    }

                                                    function drawPaidChart() {
                                                        var data = new google.visualization.DataTable();

                                                        data.addColumn('number', 'Tháng');
                                                        data.addColumn('number', 'Doanh thu');

                                                        var values = getDeliveredData();

                                                        var select = document.getElementById('delivered-monthly');
                                                        var selectValue = select.value;

                                                        for (var i = 0; i < values.length; i++) {
                                                            for (var j = 1; j < 2; j++) {
                                                                if (values[i][0] == selectValue) {
                                                                    data.addRows([
                                                                        [values[i][j], values[i][j + 1]]
                                                                    ]);
                                                                }
                                                            }
                                                        }

                                                        var option = {
                                                            title: 'Đã thanh toán [VNĐ]',
                                                            backgroundColor: '#ededed',
                                                            fontName: 'inherit',
                                                            height: 400,
                                                            hAxis: {
                                                                title: 'Tháng ' + selectValue,
                                                                gridlines: {
                                                                    color: 'transparent'
                                                                }
                                                            },
                                                            vAxis: {minValue: 0}
                                                        };

                                                        var chart = new google.visualization.AreaChart(document.getElementById('chart-div-2'));
                                                        chart.draw(data, option);
                                                    }

                                                    function filterChart(inputMonth, inputTable) {
                                                        var tr, td, txtValue;
                                                        var select = document.getElementById(inputMonth);
                                                        var selectValue = select.value;
                                                        var selectText = select.options[select.selectedIndex].text;
                                                        var tableContent = document.getElementById(inputTable);
                                                        tr = tableContent.getElementsByClassName('tr-income-information');
                                                        for (var i = 0; i < tr.length; i++) {
                                                            td = tr[i].getElementsByTagName('td')[1];
                                                            if (td != null) {
                                                                txtValue = td.innerText || td.textContent;
                                                            }
                                                            if (txtValue === selectValue) {
                                                                tr[i].style.display = "";
                                                            } else {
                                                                tr[i].style.display = "none";
                                                            }
                                                        }

                                                        drawWillPayChart();
                                                        drawPaidChart();
                                                    }


        </script>

    </body>
</html>
