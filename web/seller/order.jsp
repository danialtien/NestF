
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
        <link rel="stylesheet" href="seller/styled-notifications-master/dist/notifications.css">

    </head>
    <body id="page-top" onload="removeAndAddClass()">
        <jsp:useBean id="printPriceFunc" scope="page" class="com.nestf.product.ProductDTO"></jsp:useBean>

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
                    <li class="nav-item active">
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTasks"
                           aria-expanded="true" aria-controls="collapseTasks">
                            <i class="fas fa-list fa-list-alt"></i>
                            <span>Quản lý đơn hàng</span></a>
                        </a>
                        <div id="collapseTasks" class="collapse show active" aria-labelledby="headingTasks"
                             data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Đơn hàng</h6>
                                <a class="collapse-item order-manager-header active" id="all-order" href="#"
                                   onclick="allOrder()">Tất cả</a>
                                <a class="collapse-item order-manager-header" id="process-order" href="#"
                                   onclick="processOrder()">Xử lý đơn hàng</a>
                                <a class="collapse-item order-manager-header" id="order-status" href="#"
                                   onclick="orderStatus()">Chi tiết vận chuyển</a>
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
                    <div class="container col-lg-10 order-container">

                        <ul class="nav nav-tabs justify-content-between" id="myTab" role="tablist">

                            <!-- Tất cả -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link active order-btn" id="allorder-tab" data-toggle="tab"
                                        data-target="#allorder-tab-pane" type="button" role="tab"
                                        aria-controls="allorder-tab-pane" aria-selected="true" onclick="allOrder()">
                                    Tất cả
                                </button>
                            </li>

                            <!-- Chờ xác nhận -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link order-btn" id="wait-confirm-tab" data-toggle="tab"
                                        data-target="#wait-confirm-tab-pane" type="button" role="tab"
                                        aria-controls="wait-confirm-tab-pane" aria-selected="true" onclick="processOrder()">
                                    Chờ xác nhận

                                    <c:if test="${requestScope.COUNTER_1 != 0}">
                                        <span class="badge badge-danger badge-counter">
                                            ${requestScope.COUNTER_1}
                                        </span>
                                    </c:if> 
                                </button>
                            </li>

                            <!-- Chờ lấy hàng -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link order-btn" id="wait-delivery-tab" data-toggle="tab"
                                        data-target="#wait-delivery-tab-pane" type="button" role="tab"
                                        aria-controls="wait-delivery-tab-pane" aria-selected="true" onclick="processOrder2()">
                                    Chờ lấy hàng
                                    <c:if test="${requestScope.COUNTER_2 != 0}">
                                        <span class="badge badge-danger badge-counter">${requestScope.COUNTER_2}</span>
                                    </c:if>
                                </button>
                            </li>

                            <!-- Đang giao -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link order-btn" id="on-delivery-tab" data-toggle="tab"
                                        data-target="#on-delivery-tab-pane" type="button" role="tab"
                                        aria-controls="on-delivery-tab-pane" aria-selected="true" onclick="orderStatus()">
                                    Đang giao
                                    <span class="badge badge-danger badge-counter"><c:if test="${requestScope.COUNTER_3 != 0}">
                                            ${requestScope.COUNTER_3}
                                        </c:if></span>
                                </button>
                            </li>

                            <!-- Đã giao -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link order-btn" id="delivered-tab" data-toggle="tab"
                                        data-target="#delivered-tab-pane" type="button" role="tab"
                                        aria-controls="delivered-tab-pane" aria-selected="true" onclick="orderStatus2()">
                                    Đã giao
                                </button>
                            </li>

                            <!-- Đã hủy -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link order-btn" id="cancel-order-tab" data-toggle="tab"
                                        data-target="#cancel-order-tab-pane" type="button" role="tab"
                                        aria-controls="cancel-order-tab-pane" aria-selected="true" onclick="orderStatus3()">
                                    Đã hủy
                                </button>
                            </li>
                        </ul>

                        <div class="tab-content" id="myTabContent">

                            <!-- Content for Tất cả -->
                            <div class="tab-pane fade show active" id="allorder-tab-pane" role="tabpanel"
                                 aria-labelledby="allorder-tab" tabindex="0">

                                <div class="orders-header">
                                    <form action="#" class="col-3 d-inline-block">
                                        <div class="input-group">
                                            <input type="text" class="form-control txtSearch" name="txtSearch" id="txtSearch1"
                                                   placeholder="Tìm đơn hàng..." aria-label="Search" onkeyup="searchFunc('txtSearch1')">
                                            <span class="input-group-text search-order-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                    <div class="order-date col-6 d-inline-block float-right">
                                        <div class="order-date-range input-group">
                                            <label for="day-order" class="pt-2 pr-2">Ngày đặt hàng</label>
                                            <input type="date" class="form-control" name="firstDay"
                                                   id="all-order-start-date" aria-label="firstDay"
                                                   onchange="setMinDate('all-order-start-date', 'all-order-end-date', 'all-order-date-span', 'all-order-clear-btn')" />
                                            <span class="input-group-text border-0" id="all-order-date-span" hidden>-</span>
                                            <input type="date" class="form-control" name="secondDay" id="all-order-end-date"
                                                   aria-label="secondDay"
                                                   onchange="filterDate('all-order-start-date', 'all-order-end-date')" hidden>
                                            <button class="border-0 pl-3 text-dark" id="all-order-clear-btn" hidden
                                                    onclick="clearDate('all-order-start-date', 'all-order-end-date', 'all-order-date-span', 'all-order-clear-btn')">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="orders-content">
                                    <h5 class="orders-title">Đơn hàng</h5>

                                    <c:if test="${requestScope.ORDER_LIST != null}">
                                        <c:forEach var="order" varStatus="counter" items="${requestScope.ORDER_LIST}">
                                            <div class="all-order-content">
                                                <p class="order-id">Mã đơn: #<strong>NESTF${order.billID}</strong></p>
                                                <p hidden><fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd"/></p>

                                                <c:if test="${order.status.statusID == 1 || order.status.statusID == 2}">
                                                    <div class="information-btn">
                                                        <i class="fa-solid fa-circle-info" data-toggle="modal"
                                                           data-target="#detailModal${counter.count}"></i>

                                                        <div class="modal fade" id="detailModal${counter.count}" tabindex="-1" role="dialog"
                                                             aria-labelledby="detailModal${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong>
                                                                        </h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderInfor" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderInfor.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderInfor.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderInfor.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderInfor.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderInfor.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderInfor.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderInfor.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong>
                                                                                    </h6>
                                                                                </div>
                                                                                <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong>
                                                                            </h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </c:if>

                                                <table class="table table-content">
                                                    <thead class="orders-table-header">
                                                    <th colspan="2" scope="col">Sản phẩm</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Trạng thái</th>
                                                    <th scope="col">Vận chuyển</th>
                                                    </thead>
                                                    <tbody class="orders-table-body">
                                                        <c:forEach var="orderDetail" items="${order.detail}">
                                                            <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                <tr>
                                                                    <td>
                                                                        <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                </td>
                                                                <td>
                                                                    <p>${orderDetail.product.name}</p>
                                                                    <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                    <br>
                                                                    <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                </td>
                                                                <td>${orderDetail.quantity}</td>
                                                                <td>${order.status.status}</td>
                                                                <td>
                                                                    <img src="img\GHTK.png" alt="Image for GHTK" width="50px"
                                                                         height="50px">
                                                                    GHTK
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                                <c:if test="${order.status.statusID == 1}">
                                                    <div class="btn-1">
                                                        <button class="bg-dark text-white btn-action" data-toggle="modal" data-target="#confirmModal${counter.count}">
                                                            <i class="fa fa-check"></i>
                                                            Xác nhận
                                                        </button>

                                                        <div class="modal fade" id="confirmModal${counter.count}"
                                                             tabindex="-1" aria-labelledby="confirmModal${counter.count}" aria-hidden="true" style="color: #000;">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận đơn hàng</h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Xác nhận đơn hàng <strong>#NESTF${order.billID}</strong>?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <form action="processOrder">
                                                                            <button type="submit" class="btn btn-secondary">Xác nhận</button>
                                                                            <input type="hidden" name="orderID" value="${order.billID}"/>
                                                                            <input type="hidden" name="statusID" value="${order.status.statusID + 1}"/>
                                                                            <input type="hidden" name="type" value="process2"/>
                                                                            <input type="hidden" name="state" value="success"/>
                                                                        </form>
                                                                        <button type="button" class="btn btn-light border-dark" data-dismiss="modal">Hủy bỏ</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <br>
                                                    <div class="btn-2">
                                                        <button class="bg-dark text-white btn-action" data-toggle="modal"
                                                                data-target="#waitCancelModal${counter.count}">
                                                            <i class="fa-solid fa-circle-xmark"></i>
                                                            Hủy bỏ
                                                        </button>

                                                        <div class="modal fade" id="waitCancelModal${counter.count}" tabindex="-1"
                                                             aria-labelledby="waitCancelModal${counter.count}" aria-hidden="true" style="color: #000;">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Hủy đơn hàng
                                                                        </h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Xác nhận hủy đơn <strong>NESTF${order.billID}</strong>?
                                                                        <br>
                                                                        <br>
                                                                        Lí do:
                                                                        <form action="processOrder" class="d-inline-block ml-5">
                                                                            <input type="text" name="cancelReason" id="reasonInput1"
                                                                                   placeholder="Lí do hủy đơn..." onkeyup="removeLabel('reasonInput1', 'labelRequired1')"
                                                                                   oninvalid="checkEmptyReason(this)" required/>
                                                                            <label id="labelRequired1" style="color: #f00;">*</label>
                                                                            <input type="hidden" name="orderID" value="${order.billID}"/>
                                                                            <input type="hidden" name="statusID" value="5"/>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-secondary">
                                                                            Xác nhận
                                                                        </button>

                                                                        </form>
                                                                        <button type="button" class="btn btn-light border-dark"
                                                                                data-dismiss="modal">Hủy bỏ</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${order.status.statusID == 2}">
                                                    <br>
                                                    <div class="btn-2">
                                                        <button class="bg-dark text-white btn-action" data-toggle="modal" data-target="#waitDeliveryModal${counter.count}">
                                                            Đã giao cho<br>ĐV vận chuyển
                                                        </button>

                                                        <div class="modal fade" id="waitDeliveryModal${counter.count}" tabindex="-1"
                                                             aria-labelledby="waitDeliveryModal${counter.count}" aria-hidden="true" style="color: #000;">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận đơn
                                                                            hàng</h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Xác nhận đơn hàng <strong>#NESTF${order.billID}</strong> đã giao cho đơn vị vận chuyển?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <form action="processOrder">
                                                                            <button type="submit" class="btn btn-secondary">Xác
                                                                                nhận</button>
                                                                            <input type="hidden" name="orderID" value="${order.billID}"/>
                                                                            <input type="hidden" name="statusID" value="${order.status.statusID + 1}"/>
                                                                            <input type="hidden" name="type" value="status"/>
                                                                            <input type="hidden" name="state" value="success"/>
                                                                        </form>
                                                                        <button type="button" class="btn btn-light border-dark"
                                                                                data-dismiss="modal">Hủy bỏ</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${order.status.statusID != 1 && order.status.statusID != 2}">
                                                    <br>
                                                    <div class="btn-2">
                                                        <button type="button" class="bg-dark text-white btn-action btn-2" data-toggle="modal" data-target="#onDeliveryDetail${counter.count}">
                                                            <i class="fa fa-eye"></i>
                                                            Chi tiết
                                                        </button>

                                                        <div class="modal fade" id="onDeliveryDetail${counter.count}" tabindex="-1" role="dialog" aria-labelledby="onDeliveryDetail${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong></h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderDetail" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderDetail.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderDetail.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderDetail.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong></h6>
                                                                                <c:if test="${order.status.statusID == 5}">
                                                                                    <h6>
                                                                                        <strong style="color:#f00">Lí do hủy:</strong>
                                                                                        <strong>${order.cancelReason}</strong>
                                                                                    </h6>
                                                                                </c:if>
                                                                            </div>
                                                                            <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong></h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${requestScope.ORDER_LIST == null}">
                                        <div class="product-notfound-image">
                                            <img src="img/product-notfound.png" alt="Image for product-notfound">
                                            <br><span>Không tìm thấy đơn hàng nào</span>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- End content Tất cả -->

                            <!-- Content for Chờ xác nhận -->
                            <div class="tab-pane fade" id="wait-confirm-tab-pane" role="tabpanel"
                                 aria-labelledby="wait-confirm-tab" tabindex="0">

                                <div class="orders-header">
                                    <form action="#" class="col-3 d-inline-block">
                                        <div class="input-group">
                                            <input type="text" class="form-control txtSearch" name="txtSearch" id="txtSearch2"
                                                   placeholder="Tìm đơn hàng..." aria-label="Search" onkeyup="searchFunc('txtSearch2')">
                                            <span class="input-group-text search-order-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                    <div class="order-date col-6 d-inline-block float-right">
                                        <div class="order-date-range input-group" id="day-order">
                                            <label for="day-order" class="pt-2 pr-2">Ngày đặt hàng</label>
                                            <input type="date" class="form-control" name="firstDay"
                                                   id="wait-confirm-start-date" aria-label="firstDay"
                                                   onchange="setMinDate('wait-confirm-start-date', 'wait-confirm-end-date', 'wait-confirm-date-span', 'wait-confirm-clear-btn')" />
                                            <span class="input-group-text border-0" id="wait-confirm-date-span" hidden>-</span>
                                            <input type="date" class="form-control" name="secondDay" id="wait-confirm-end-date"
                                                   aria-label="secondDay"
                                                   onchange="filterDate('wait-confirm-start-date', 'wait-confirm-end-date')" hidden>
                                            <button class="border-0 pl-3 text-dark" id="wait-confirm-clear-btn" hidden
                                                    onclick="clearDate('wait-confirm-start-date', 'wait-confirm-end-date', 'wait-confirm-date-span', 'wait-confirm-clear-btn')">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="orders-content">
                                    <h5 class="orders-title">Đơn hàng</h5>

                                    <c:set var="contains" value="false"></c:set>
                                    <c:if test="${requestScope.ORDER_LIST != null}">
                                        <c:forEach var="order" varStatus="counter" items="${requestScope.ORDER_LIST}">
                                            <c:if test="${order.status.statusID == 1}">
                                                <c:set var="contains" value="true"></c:set>
                                                    <div class="all-order-content">
                                                        <p class="order-id">Mã đơn: #<strong>NESTF${order.billID}</strong></p>
                                                    <p hidden><fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd"/></p>

                                                    <div class="information-btn">
                                                        <i class="fa-solid fa-circle-info" data-toggle="modal"
                                                           data-target="#confirmModalA${counter.count}"></i>

                                                        <div class="modal fade" id="confirmModalA${counter.count}" tabindex="-1" role="dialog"
                                                             aria-labelledby="confirmModalA${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong>
                                                                        </h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderInfor" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderInfor.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderInfor.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderInfor.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderInfor.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderInfor.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderInfor.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderInfor.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong>
                                                                                    </h6>
                                                                                </div>
                                                                                <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong>
                                                                            </h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <table class="table table-content">
                                                        <thead class="orders-table-header">
                                                        <th colspan="2" scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Vận chuyển</th>
                                                        </thead>
                                                        <tbody class="orders-table-body">
                                                            <c:forEach var="orderDetail" items="${order.detail}">
                                                                <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                    <tr>
                                                                        <td>
                                                                            <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                    </td>
                                                                    <td>
                                                                        <p>${orderDetail.product.name}</p>
                                                                        <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                        <br>
                                                                        <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                    </td>
                                                                    <td>${orderDetail.quantity}</td>
                                                                    <td>${order.status.status}</td>
                                                                    <td>
                                                                        <img src="img\GHTK.png" alt="Image for GHTK" width="50px"
                                                                             height="50px">
                                                                        GHTK
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <div class="btn-1">
                                                        <button class="bg-dark text-white btn-action" data-toggle="modal" data-target="#waitConfirmModalA${counter.count}">
                                                            <i class="fa fa-check"></i>
                                                            Xác nhận
                                                        </button>

                                                        <div class="modal fade" id="waitConfirmModalA${counter.count}"
                                                             tabindex="-1" aria-labelledby="waitConfirmModalA${counter.count}" aria-hidden="true" style="color: #000;">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận đơn hàng</h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Xác nhận đơn hàng <strong>#NESTF${order.billID}</strong>?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <form id="confirm-order-form" action="processOrder">
                                                                            <button type="submit" class="btn btn-secondary">Xác nhận</button>
                                                                            <input type="hidden" name="orderID" id="waitConfirmOrderID" value="${order.billID}"/>
                                                                            <input type="hidden" name="statusID" id="waitConfirmStatusID" value="${order.status.statusID + 1}"/>
                                                                            <input type="hidden" name="type" value="process2"/>
                                                                            <input type="hidden" name="state" value="success"/>
                                                                        </form>
                                                                        <button type="button" class="btn btn-light border-dark" data-dismiss="modal">Hủy bỏ</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br>
                                                    <div class="btn-2">
                                                        <button class="bg-dark text-white btn-action" data-toggle="modal"
                                                                data-target="#waitCancelModalA${counter.count}">
                                                            <i class="fa-solid fa-circle-xmark"></i>
                                                            Hủy bỏ
                                                        </button>

                                                        <div class="modal fade" id="waitCancelModalA${counter.count}" tabindex="-1"
                                                             aria-labelledby="waitCancelModalA${counter.count}" aria-hidden="true" style="color: #000;">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Hủy đơn hàng
                                                                        </h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Xác nhận hủy đơn <strong>NESTF${order.billID}</strong>?
                                                                        <br>
                                                                        <br>
                                                                        Lí do:
                                                                        <form action="processOrder" class="d-inline-block ml-5">
                                                                            <input type="text" name="cancelReason" id="reasonInput2"
                                                                                   placeholder="Lí do hủy đơn..." onkeyup="removeLabel('reasonInput2', 'labelRequired2')"
                                                                                   oninvalid="checkEmptyReason(this)" required/>
                                                                            <label id="labelRequired2" style="color: #f00;">*</label>
                                                                            <input type="hidden" name="orderID" value="${order.billID}"/>
                                                                            <input type="hidden" name="statusID" value="5"/>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-secondary">
                                                                            Xác nhận
                                                                        </button>

                                                                        </form>
                                                                        <button type="button" class="btn btn-light border-dark"
                                                                                data-dismiss="modal">Hủy bỏ</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${contains eq false}">
                                        <div class="product-notfound-image">
                                            <img src="img/product-notfound.png" alt="Image for product-notfound">
                                            <br><span>Không tìm thấy đơn hàng nào</span>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- End content Chờ xác nhận -->

                            <!-- Content for Chờ lấy hàng -->
                            <div class="tab-pane fade" id="wait-delivery-tab-pane" role="tabpanel"
                                 aria-labelledby="wait-delivery-tab" tabindex="0">

                                <div class="orders-header">
                                    <form action="#" class="col-3 d-inline-block">
                                        <div class="input-group">
                                            <input type="text" class="form-control txtSearch" name="txtSearch" id="txtSearch3"
                                                   placeholder="Tìm đơn hàng..." aria-label="Search" onkeyup="searchFunc('txtSearch3')">
                                            <span class="input-group-text search-order-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                    <div class="order-date col-6 d-inline-block float-right">
                                        <div class="order-date-range input-group" id="day-order">
                                            <label for="day-order" class="pt-2 pr-2">Ngày đặt hàng</label>
                                            <input type="date" class="form-control" name="firstDay"
                                                   id="wait-delivery-start-date" aria-label="firstDay"
                                                   onchange="setMinDate('wait-delivery-start-date', 'wait-delivery-end-date', 'wait-delivery-date-span', 'wait-delivery-clear-btn')" />
                                            <span class="input-group-text border-0" id="wait-delivery-date-span" hidden>-</span>
                                            <input type="date" class="form-control" name="secondDay" id="wait-delivery-end-date"
                                                   aria-label="secondDay"
                                                   onchange="filterDate('wait-delivery-start-date', 'wait-delivery-end-date')" hidden>
                                            <button class="border-0 pl-3 text-dark" id="wait-delivery-clear-btn" hidden
                                                    onclick="clearDate('wait-delivery-start-date', 'wait-delivery-end-date', 'wait-delivery-date-span', 'wait-delivery-clear-btn')">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="orders-content">
                                    <h5 class="orders-title">Đơn hàng</h5>

                                    <c:set var="contains" value="false"></c:set>
                                    <c:if test="${requestScope.ORDER_LIST != null}">
                                        <c:forEach var="order" varStatus="counter" items="${requestScope.ORDER_LIST}">
                                            <c:if test="${order.status.statusID == 2}">
                                                <c:set var="contains" value="true"></c:set>
                                                    <div class="all-order-content">
                                                        <p class="order-id">Mã đơn: #<strong>NESTF${order.billID}</strong></p>
                                                    <p hidden><fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd"/></p>

                                                    <div class="information-btn">
                                                        <i class="fa-solid fa-circle-info" data-toggle="modal"
                                                           data-target="#detailModalA${counter.count}"></i>

                                                        <div class="modal fade" id="detailModalA${counter.count}" tabindex="-1" role="dialog"
                                                             aria-labelledby="detailModalA${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong>
                                                                        </h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderInfor" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderInfor.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderInfor.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderInfor.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderInfor.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderInfor.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderInfor.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderInfor.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong>
                                                                                    </h6>
                                                                                </div>
                                                                                <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong>
                                                                            </h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <table class="table table-content">
                                                        <thead class="orders-table-header">
                                                        <th colspan="2" scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Vận chuyển</th>
                                                        </thead>
                                                        <tbody class="orders-table-body">
                                                            <c:forEach var="orderDetail" items="${order.detail}">
                                                                <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                    <tr>
                                                                        <td>
                                                                            <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                    </td>
                                                                    <td>
                                                                        <p>${orderDetail.product.name}</p>
                                                                        <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                        <br>
                                                                        <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                    </td>
                                                                    <td>${orderDetail.quantity}</td>
                                                                    <td>${order.status.status}</td>
                                                                    <td>
                                                                        <img src="img\GHTK.png" alt="Image for GHTK" width="50px"
                                                                             height="50px">
                                                                        GHTK
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <br>
                                                    <div class="btn-2">
                                                        <button class="bg-dark text-white btn-action" data-toggle="modal" data-target="#waitDeliveryModalA${counter.count}">
                                                            Đã giao cho<br>ĐV vận chuyển
                                                        </button>

                                                        <div class="modal fade" id="waitDeliveryModalA${counter.count}" tabindex="-1"
                                                             aria-labelledby="waitDeliveryModalA${counter.count}" aria-hidden="true" style="color: #000;">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận đơn
                                                                            hàng</h5>
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Xác nhận đơn hàng <strong>#NESTF${order.billID}</strong> đã giao cho đơn vị vận chuyển?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <form action="processOrder">
                                                                            <button type="submit" class="btn btn-secondary">Xác
                                                                                nhận</button>
                                                                            <input type="hidden" name="orderID" value="${order.billID}"/>
                                                                            <input type="hidden" name="statusID" value="${order.status.statusID + 1}"/>
                                                                            <input type="hidden" name="type" value="status"/>
                                                                            <input type="hidden" name="state" value="success"/>
                                                                        </form>
                                                                        <button type="button" class="btn btn-light border-dark"
                                                                                data-dismiss="modal">Hủy bỏ</button>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${contains eq false}">
                                        <div class="product-notfound-image">
                                            <img src="img/product-notfound.png" alt="Image for product-notfound">
                                            <br><span>Không tìm thấy đơn hàng nào</span>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- End content Chờ lấy hàng -->

                            <!-- Content for Đang giao -->
                            <div class="tab-pane fade" id="on-delivery-tab-pane" role="tabpanel"
                                 aria-labelledby="on-delivery-tab" tabindex="0">

                                <div class="orders-header">
                                    <form action="#" class="col-3 d-inline-block">
                                        <div class="input-group">
                                            <input type="text" class="form-control txtSearch" name="txtSearch" id="txtSearch4"
                                                   placeholder="Tìm đơn hàng..." aria-label="Search" onkeyup="searchFunc('txtSearch4')">
                                            <span class="input-group-text search-order-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                    <div class="order-date col-6 d-inline-block float-right">
                                        <div class="order-date-range input-group">
                                            <label for="day-order" class="pt-2 pr-2">Ngày đặt hàng</label>
                                            <input type="date" class="form-control" name="firstDay"
                                                   id="on-delivery-start-date" aria-label="firstDay"
                                                   onchange="setMinDate('on-delivery-start-date', 'on-delivery-end-date', 'on-delivery-date-span', 'on-delivery-clear-btn')" />
                                            <span class="input-group-text border-0" id="on-delivery-date-span" hidden>-</span>
                                            <input type="date" class="form-control" name="secondDay" id="on-delivery-end-date"
                                                   aria-label="secondDay"
                                                   onchange="filterDate('on-delivery-start-date', 'on-delivery-end-date')" hidden>
                                            <button class="border-0 pl-3 text-dark" id="on-delivery-clear-btn" hidden
                                                    onclick="clearDate('on-delivery-start-date', 'on-delivery-end-date', 'on-delivery-date-span', 'on-delivery-clear-btn')">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="orders-content">
                                    <h5 class="orders-title">Đơn hàng</h5>

                                    <c:set var="contains" value="false"></c:set>
                                    <c:if test="${requestScope.ORDER_LIST != null}">
                                        <c:forEach var="order" varStatus="counter" items="${requestScope.ORDER_LIST}">
                                            <c:if test="${order.status.statusID == 3}">
                                                <c:set var="contains" value="true"></c:set>
                                                    <div class="all-order-content">
                                                        <p class="order-id">Mã đơn: #<strong>NESTF${order.billID}</strong></p>
                                                    <p hidden><fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd"/></p>
                                                    <table class="table table-content">
                                                        <thead class="orders-table-header">
                                                        <th colspan="2" scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Vận chuyển</th>
                                                        </thead>
                                                        <tbody class="orders-table-body">
                                                            <c:forEach var="orderDetail" items="${order.detail}">
                                                                <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                    <tr>
                                                                        <td>
                                                                            <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                    </td>
                                                                    <td>
                                                                        <p>${orderDetail.product.name}</p>
                                                                        <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                        <br>
                                                                        <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                    </td>
                                                                    <td>${orderDetail.quantity}</td>
                                                                    <td>${order.status.status}</td>
                                                                    <td>
                                                                        <img src="img\GHTK.png" alt="Image for GHTK" width="50px"
                                                                             height="50px">
                                                                        GHTK
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <br>
                                                    <div class="btn-2">
                                                        <button type="button" class="bg-dark text-white btn-action" data-toggle="modal" data-target="#onDeliveryDetailA${counter.count}">
                                                            <i class="fa fa-eye"></i>
                                                            Chi tiết
                                                        </button>

                                                        <div class="modal fade" id="onDeliveryDetailA${counter.count}" tabindex="-1" role="dialog" aria-labelledby="onDeliveryDetailA${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong></h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderDetail" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderDetail.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderDetail.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderDetail.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong></h6>
                                                                                </div>
                                                                                <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong></h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${contains eq false}">
                                        <div class="product-notfound-image">
                                            <img src="img/product-notfound.png" alt="Image for product-notfound">
                                            <br><span>Không tìm thấy đơn hàng nào</span>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- End content for Đang giao -->

                            <!-- Content for Đã giao -->
                            <div class="tab-pane fade" id="delivered-tab-pane" role="tabpanel"
                                 aria-labelledby="delivered-tab" tabindex="0">

                                <div class="orders-header">
                                    <form action="#" class="col-3 d-inline-block">
                                        <div class="input-group">
                                            <input type="text" class="form-control txtSearch" name="txtSearch" id="txtSearch5"
                                                   placeholder="Tìm đơn hàng..." aria-label="Search" onkeyup="searchFunc('txtSearch5')">
                                            <span class="input-group-text search-order-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                    <div class="order-date col-6 d-inline-block float-right">
                                        <div class="order-date-range input-group" id="day-order">
                                            <label for="day-order" class="pt-2 pr-2">Ngày đặt hàng</label>
                                            <input type="date" class="form-control" name="firstDay"
                                                   id="delivered-start-date" aria-label="firstDay"
                                                   onchange="setMinDate('delivered-start-date', 'delivered-end-date', 'delivered-date-span', 'delivered-clear-btn')" />
                                            <span class="input-group-text border-0" id="delivered-date-span" hidden>-</span>
                                            <input type="date" class="form-control" name="secondDay" id="delivered-end-date"
                                                   aria-label="secondDay"
                                                   onchange="filterDate('delivered-start-date', 'delivered-end-date')" hidden>
                                            <button class="border-0 pl-3 text-dark" id="delivered-clear-btn" hidden
                                                    onclick="clearDate('delivered-start-date', 'delivered-end-date', 'delivered-date-span', 'delivered-clear-btn')">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="orders-content">
                                    <h5 class="orders-title">Đơn hàng</h5>

                                    <c:set var="contains" value="false"></c:set>
                                    <c:if test="${requestScope.ORDER_LIST != null}">
                                        <c:forEach var="order" varStatus="counter" items="${requestScope.ORDER_LIST}">
                                            <c:if test="${order.status.statusID == 4}">
                                                <c:set var="contains" value="true"></c:set>
                                                    <div class="all-order-content">
                                                        <p class="order-id">Mã đơn: #<strong>NESTF${order.billID}</strong></p>
                                                    <p hidden><fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd"/></p>

                                                    <table class="table table-content">
                                                        <thead class="orders-table-header">
                                                        <th colspan="2" scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Vận chuyển</th>
                                                        </thead>
                                                        <tbody class="orders-table-body">
                                                            <c:forEach var="orderDetail" items="${order.detail}">
                                                                <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                    <tr>
                                                                        <td>
                                                                            <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                    </td>
                                                                    <td>
                                                                        <p>${orderDetail.product.name}</p>
                                                                        <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                        <br>
                                                                        <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                    </td>
                                                                    <td>${orderDetail.quantity}</td>
                                                                    <td>${order.status.status}</td>
                                                                    <td>
                                                                        <img src="img\GHTK.png" alt="Image for GHTK" width="50px"
                                                                             height="50px">
                                                                        GHTK
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <br>
                                                    <div class="btn-2">
                                                        <button type="button" class="bg-dark text-white btn-action btn-2" data-toggle="modal" data-target="#delivered${counter.count}">
                                                            <i class="fa fa-eye"></i>
                                                            Chi tiết
                                                        </button>

                                                        <div class="modal fade" id="delivered${counter.count}" tabindex="-1" role="dialog" aria-labelledby="delivered${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong></h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderDetail" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderDetail.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderDetail.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderDetail.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong></h6>
                                                                                </div>
                                                                                <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong></h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${contains eq false}">
                                        <div class="product-notfound-image">
                                            <img src="img/product-notfound.png" alt="Image for product-notfound">
                                            <br><span>Không tìm thấy đơn hàng nào</span>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- End content Đã giao -->

                            <!-- Content for Đã hủy -->
                            <div class="tab-pane fade" id="cancel-order-tab-pane" role="tabpanel"
                                 aria-labelledby="cancel-order-tab" tabindex="0">

                                <div class="orders-header">
                                    <form action="#" class="col-3 d-inline-block">
                                        <div class="input-group">
                                            <input type="text" class="form-control txtSearch" name="txtSearch" id="txtSearch6"
                                                   placeholder="Tìm đơn hàng..." aria-label="Search" onkeyup="searchFunc('txtSearch6')">
                                            <span class="input-group-text search-order-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>
                                    <div class="order-date col-6 d-inline-block float-right">
                                        <div class="order-date-range input-group" id="day-order">
                                            <label for="day-order" class="pt-2 pr-2">Ngày đặt hàng</label>
                                            <input type="date" class="form-control" name="firstDay"
                                                   id="cancel-order-start-date" aria-label="firstDay"
                                                   onchange="setMinDate('cancel-order-start-date', 'cancel-order-end-date', 'cancel-order-date-span', 'cancel-order-clear-btn')" />
                                            <span class="input-group-text border-0" id="cancel-order-date-span" hidden>-</span>
                                            <input type="date" class="form-control" name="secondDay" id="cancel-order-end-date"
                                                   aria-label="secondDay"
                                                   onchange="filterDate('cancel-order-start-date', 'cancel-order-end-date')" hidden>
                                            <button class="border-0 pl-3 text-dark" id="cancel-order-clear-btn" hidden
                                                    onclick="clearDate('cancel-order-start-date', 'cancel-order-end-date', 'cancel-order-date-span', 'cancel-order-clear-btn')">
                                                <i class="fa-solid fa-circle-xmark"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="orders-content">
                                    <h5 class="orders-title">Đơn hàng</h5>

                                    <c:set var="contains" value="false"></c:set>
                                    <c:if test="${requestScope.ORDER_LIST != null}">
                                        <c:forEach var="order" varStatus="counter" items="${requestScope.ORDER_LIST}">
                                            <c:if test="${order.status.statusID == 5}">
                                                <c:set var="contains" value="true"></c:set>
                                                    <div class="all-order-content">
                                                        <p class="order-id">Mã đơn: #<strong>NESTF${order.billID}</strong></p>
                                                    <p hidden><fmt:formatDate value="${order.time}" pattern="yyyy-MM-dd"/></p>

                                                    <table class="table table-content">
                                                        <thead class="orders-table-header">
                                                        <th colspan="2" scope="col">Sản phẩm</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Trạng thái</th>
                                                        <th scope="col">Vận chuyển</th>
                                                        </thead>
                                                        <tbody class="orders-table-body">
                                                            <c:forEach var="orderDetail" items="${order.detail}">
                                                                <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                    <tr>
                                                                        <td>
                                                                            <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                    </td>
                                                                    <td>
                                                                        <p>${orderDetail.product.name}</p>
                                                                        <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                        <br>
                                                                        <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                    </td>
                                                                    <td>${orderDetail.quantity}</td>
                                                                    <td>${order.status.status}</td>
                                                                    <td>
                                                                        <img src="img\GHTK.png" alt="Image for GHTK" width="50px"
                                                                             height="50px">
                                                                        GHTK
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>

                                                    <br>
                                                    <div class="btn-2">
                                                        <button type="button" class="bg-dark text-white btn-action btn-2" data-toggle="modal" data-target="#cancelled${counter.count}">
                                                            <i class="fa fa-eye"></i>
                                                            Chi tiết
                                                        </button>

                                                        <div class="modal fade" id="cancelled${counter.count}" tabindex="-1" role="dialog" aria-labelledby="cancelled${counter.count}" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-center modal-lg text-dark">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="staticBackdropLabel">Đơn hàng #<strong>NESTF${order.billID}</strong></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body" style="color: #000;">
                                                                        <h6 class="d-inline-block">Trạng thái: <strong>${order.status.status}</strong></h6>
                                                                        <h6 class="float-right">SĐT khách hàng: <strong>${order.cusPhone}</strong></h6>
                                                                        <div class="order-detail-content">
                                                                            <table class="table table-content">
                                                                                <thead class="orders-table-header">
                                                                                <th colspan="2" scope="col">Sản phẩm</th>
                                                                                <th scope="col">Số lượng</th>
                                                                                <th scope="col">Thành tiền</th>
                                                                                </thead>
                                                                                <tbody class="orders-table-body">
                                                                                    <c:forEach var="orderDetail" items="${order.detail}">
                                                                                        <c:set var="productImage" value="${orderDetail.product.imagelink}"></c:set>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <img src="${productImage[0]}" alt="Image for ${orderDetail.product.name}">
                                                                                            </td>
                                                                                            <td>
                                                                                                <p>${orderDetail.product.name}</p>
                                                                                                <strong>${printPriceFunc.printPrice(orderDetail.price)}</strong>
                                                                                                <br>
                                                                                                <span class="cate-title">Danh mục: ${orderDetail.product.category.categoryName}</span>
                                                                                            </td>
                                                                                            <td>${orderDetail.quantity}</td>
                                                                                            <td>${printPriceFunc.printPrice(orderDetail.total)}</td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </tbody>
                                                                            </table>

                                                                            <div class="customer-information col-6 d-inline-block">
                                                                                <h6>Địa chỉ giao hàng: <strong>${order.address}</strong></h6>
                                                                                <h6>Ngày đặt: <strong><fmt:formatDate value="${order.time}" pattern="dd-MM-yyyy"></fmt:formatDate></strong></h6>
                                                                                    <h6>ĐV vận chuyển: <strong>Giao Hàng Tiết Kiệm</strong></h6>
                                                                                    <h6>
                                                                                        <strong style="color:#f00">Lí do hủy:</strong>
                                                                                        <strong>${order.cancelReason}</strong>
                                                                                </h6>
                                                                            </div>
                                                                            <h6 class="col-3 float-right total-bill">Tổng: <strong>${printPriceFunc.printPrice(order.total)}</strong></h6>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${contains eq false}">
                                        <div class="product-notfound-image">
                                            <img src="img/product-notfound.png" alt="Image for product-notfound">
                                            <br><span>Không tìm thấy đơn hàng nào</span>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- End content Đã hủy -->
                        </div>

                    </div>
                    <!-- End index content -->

                </div>

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

        <script src = seller/js/order.js></script>

    </body>
</html>