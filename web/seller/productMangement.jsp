
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
    <body id="page-top" onload="pageLoad()">

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
                <li class="nav-item active">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProducts"
                       aria-expanded="true" aria-controls="collapseProducts">
                        <i class="fa fa-cube"></i>
                        <span>Quản lý sản phẩm</span>
                    </a>
                    <div id="collapseProducts" class="collapse show active" aria-labelledby="headingProducts"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Danh sách sản phẩm</h6>
                            <a class="collapse-item active all-product" href="#" id="your-product-manage"
                               onclick="allProduct()">Sản phẩm bạn phụ trách</a>
                            <a class="collapse-item all-product" href="#" id="out-of-stock-order" onclick="outOfStock()">Sản
                                phẩm hết hàng</a>
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
                    <div class="container col-lg-10 order-container products-container">

                        <ul class="nav nav-tabs" id="myTab" role="tablist">

                            <!-- Tất cả sản phẩm -->
                            <li class="nav-item order-header" role="presentation">
                                <button class="nav-link active all-product-btn" id="all-product-tab" data-toggle="tab"
                                        data-target="#all-product-tab-pane" type="button" role="tab"
                                        aria-controls="all-product-tab-pane" aria-selected="true" onclick="allProduct()">
                                    Tất cả sản phẩm
                                </button>
                            </li>

                            <!-- Hết hàng -->
                            <li class="nav-item" role="presentation">
                                <button class="nav-link all-product-btn" id="out-of-stock-tab" data-toggle="tab"
                                        data-target="#out-of-stock-tab-pane" type="button" role="tab"
                                        aria-controls="out-of-stock-tab-pane" aria-selected="true" onclick="outOfStock()">
                                    Hết hàng
                                </button>
                            </li>

                        </ul>

                        <div class="tab-content" id="myTabContent">

                            <!-- Content for Tất cả sản phẩm -->
                            <div class="tab-pane fade show active" id="all-product-tab-pane" role="tabpanel"
                                 aria-labelledby="all-product-tab" tabindex="0">

                                <div class="products-header">
                                    <form action="#" class="d-inline-block">
                                        <div class="input-group">
                                            <span class="input-group-text search-title">Tên sản phẩm</span>
                                            <input type="text" name="txtProductName" id="txtProductSearch" placeholder="Nhập tên sản phẩm..."
                                                   class="form-control input-search-form" onkeyup="searchFunc('txtProductSearch', 'product-count', 'product-detail-1')">
                                            <span class="input-group-text search-product-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>

                                    <form action="#" class="d-inline-block float-right">
                                        <div class="input-group">
                                            <span class="input-group-text search-title">Danh mục</span>
                                            <select id="categoryOption" onchange="filterCateFunc('categoryOption', 'product-count', 'product-detail-1')"
                                                    style="border: none; padding: 0 1rem;">
                                                <option value="0">-- Danh mục --</option>
                                                <c:if test="${requestScope.CATEGORY_LIST != null}">
                                                    <c:forEach var="category" varStatus="counter" items="${requestScope.CATEGORY_LIST}">
                                                        <option value="${counter.count}">${category}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                    </form>
                                </div>

                                <div class="products-content">
                                    <jsp:useBean id="printPriceFunc" scope="page" class="com.nestf.product.ProductDTO"></jsp:useBean>
                                        <div class="products-content-header">
                                        <c:if test="${requestScope.SELLER_PRODUCT_LIST != null}">
                                            <c:forEach var="product" varStatus="counter" items="${requestScope.SELLER_PRODUCT_LIST}">
                                                <c:set var="numOfProducts" scope="page" value="${counter.count}"></c:set>
                                            </c:forEach>
                                            <h5 class="products-title" id="product-count">${numOfProducts} Sản phẩm</h5>
                                        </c:if>
                                    </div>

                                    <div class="products-content-body row">

                                        <c:if test="${requestScope.SELLER_PRODUCT_LIST != null}">
                                            <c:forEach var="product" varStatus="counter" items="${requestScope.SELLER_PRODUCT_LIST}">
                                                <c:set var="productImage" scope="page" value="${product.imagelink}"></c:set>

                                                    <div class="product-detail-1 col-lg-3">
                                                        <a href="proSelDetail?productID=${product.productID}">
                                                        <img src="${productImage[0]}" alt="Image for ${product.name}">
                                                        <p>${product.name}</p>
                                                        <p hidden>${product.category.categoryName}</p>
                                                        <div class="product-detail-footer">
                                                            <span class="product-detail-price">${printPriceFunc.printPrice(product.price)}</span>

                                                            <button class="btn btn-light">
                                                                <i class="fa fa-eye"></i>
                                                            </button>
                                                        </div>
                                                    </a>
                                                </div>

                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.SELLER_PRODUCT_LIST eq null}">
                                            <div class="products-content">

                                                <div class="product-not-found">
                                                    <img src="img/product-notfound.png" alt="">
                                                    <h5>Không có sản phẩm nào được tìm thấy</h5>    
                                                </div>

                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <!-- End Tất cả sản phẩm content -->

                            <!-- Content for Sản phẩm hết hàng -->
                            <div class="tab-pane fade" id="out-of-stock-tab-pane" role="tabpanel"
                                 aria-labelledby="out-of-stock-tab" tabindex="0">

                                <div class="products-header">
                                    <form action="#" class="d-inline-block">
                                        <div class="input-group">
                                            <span class="input-group-text search-title">Tên sản phẩm</span>
                                            <input type="text" name="txtProductName" id="txtOutOfStockSearch" placeholder="Nhập tên sản phẩm..."
                                                   class="form-control input-search-form" onkeyup="searchFunc('txtOutOfStockSearch', 'out-of-stock-count', 'product-detail-2')">
                                            <span class="input-group-text search-product-icon"><i
                                                    class="fa fa-search"></i></span>
                                        </div>
                                    </form>

                                    <form action="#" class="d-inline-block float-right">
                                        <div class="input-group">
                                            <span class="input-group-text search-title">Danh mục</span>
                                            <select id="categoryOutOfStockOption" onchange="filterCateFunc('categoryOutOfStockOption', 'out-of-stock-count', 'product-detail-2')"
                                                    style="border: none; padding: 0 1rem;">
                                                <option value="0">-- Danh mục --</option>
                                                <c:if test="${requestScope.CATEGORY_LIST != null}">
                                                    <c:forEach var="category" varStatus="counter" items="${requestScope.CATEGORY_LIST}">
                                                        <option value="${counter.count}">${category}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                    </form>
                                </div>

                                <div class="products-content">
                                    <div class="products-content-header">
                                        <c:if test="${requestScope.LIST_OUT_OF_STOCK != null}">
                                            <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_OUT_OF_STOCK}">
                                                <c:set var="numOfOutOfStocks" scope="page" value="${counter.count}"></c:set>
                                            </c:forEach>
                                            <h5 class="products-title" id="out-of-stock-count">${numOfOutOfStocks} Sản phẩm</h5>
                                        </c:if>
                                    </div>

                                    <c:if test="${requestScope.LIST_OUT_OF_STOCK != null}">
                                        <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_OUT_OF_STOCK}">
                                            <c:set var="productImage" scope="page" value="${product.imagelink}"></c:set>

                                                <div class="product-detail-2 col-lg-3">
                                                    <a href="proSelDetail?productID=${product.productID}">
                                                    <img src="${productImage[0]}" alt="Image for ${product.name}">
                                                    <p>${product.name}</p>
                                                    <p hidden>${product.category.categoryName}</p>
                                                    <div class="product-detail-footer">
                                                        <span class="product-detail-price">${printPriceFunc.printPrice(product.price)}</span>

                                                        <button class="btn btn-light">
                                                            <i class="fa fa-eye"></i>
                                                        </button>
                                                    </div>
                                                </a>
                                            </div>

                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.LIST_OUT_OF_STOCK eq null}">

                                        <div class="product-not-found">
                                            <img src="img/product-notfound.png" alt="">
                                            <h5>Không có sản phẩm nào được tìm thấy</h5>    
                                        </div>

                                    </c:if>

                                </div>

                            </div>
                            <!-- End Sản phẩm hết hàng content -->

                        </div>

                    </div>
                    <!-- End index content -->
                </div>

            </div>
            <!-- End content wrapper -->

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

        <script src="seller/js/productManagement.js"></script>

        <script type="text/javascript">
                                                function searchFunc(txtSearch, txtCount, productDetail) {
                                                    var input, filter, p, txtValue;
                                                    var count = 0;
                                                    input = document.getElementById(txtSearch);
                                                    var select = document.getElementById('categoryOption');
                                                    var selectOutOfStock = document.getElementById('categoryOutOfStockOption');
                                                    var selectValue = select.value;
                                                    input = stringToSlug(input.value);
                                                    filter = input.toUpperCase();
                                                    var content = document.getElementsByClassName(productDetail);
                                                    for (var i = 0; i < content.length; i++) {
                                                        p = content[i].getElementsByTagName('p')[0];
                                                        txtValue = stringToSlug(p.textContent) || stringToSlug(p.innerText);
                                                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                            count++;
                                                            content[i].style.display = "";
                                                        } else {
                                                            content[i].style.display = 'none';
                                                        }
                                                    }

                                                    if (selectValue !== 0)
                                                        select.selectedIndex = 0;
                                                    if (selectOutOfStock.value !== 0) {
                                                        selectOutOfStock.selectedIndex = 0;
                                                    }

                                                    if (input.length === 0) {
                                                        if (txtCount === 'product-count') {
                                                            count = ${numOfProducts};
                                                        } else {
                                                            count = ${numOfOutOfStocks};
                                                        }
                                                    }
                                                    document.getElementById(txtCount).innerHTML = count + " Sản phẩm";
                                                }


                                                function filterCateFunc(txtFilter, txtCount, productDetail) {
                                                    var select, p, txtValue;
                                                    select = document.getElementById(txtFilter);
                                                    var value = select.value;
                                                    var text = select.options[select.selectedIndex].text;
                                                    var content = document.getElementsByClassName(productDetail);
                                                    var count = 0;
                                                    for (var i = 0; i < content.length; i++) {
                                                        p = content[i].getElementsByTagName('p')[1];
                                                        txtValue = p.textContent || p.innerText;
                                                        if (txtValue === text) {
                                                            count++;
                                                            content[i].style.display = "";
                                                        } else {
                                                            content[i].style.display = "none";
                                                        }
                                                    }

                                                    if (value == 0) {
                                                        for (var i = 0; i < content.length; i++) {
                                                            content[i].style.display = "";
                                                        }
                                                        if (txtCount === 'product-count') {
                                                            count = ${numOfProducts};
                                                        } else {
                                                            count = ${numOfOutOfStocks};
                                                        }
                                                    }
                                                    document.getElementById(txtCount).innerHTML = count + " Sản phẩm";
                                                }
        </script>

    </body>
</html>
