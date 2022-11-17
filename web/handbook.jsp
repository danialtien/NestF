<%-- 
    Document   : newjsp4
    Created on : Sep 20, 2022, 4:00:09 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="com.nestf.post.PostDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">   
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cẩm nang</title>
        <meta name="description" content="">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
        <link href="css/nestf.css" rel="stylesheet">
    </head>

    <body class="text-center">
        <div id="navbar" class="sticky-top">
            <nav class="navbar-expand bg-white navbar-light">
                <ul class="navbar">
                    <li class="nav-item col-2 d-inline-block">
                        <a href="home"><img src="img/logo.png" id="logo" class="col-3"></a>
                    </li>
                    <li class="nav-item col-1 d-inline-block">
                        <a href="shop" class="nav-link text-center">Sản phẩm</a>
                    </li>
                    <li class="nav-item col-1 d-inline-block">
                        <a href="handbook" class="nav-link text-center current-tab disabled">Cẩm nang</a>
                    </li>
                    <li class="nav-item col-1 d-inline-block">
                        <a href="about" class="nav-link text-center">Về chúng tôi</a>
                    </li>
                    <li class="nav-item col-3 d-inline-block text-center">
                        <form action="searchAction" method="get" id="search-form">
                            <button type="submit" class="border-0 bg-transparent"><i class="fas fa-search    "></i></button>
                            <input type="text" class="text-center" placeholder="Tìm kiếm" name="txtSearch" value="">
                        </form>
                    </li>
                    <li class="nav-item col-2 d-inline-block text-center">                      
                        <c:if test="${not empty sessionScope.USER}">
                            <div id="dropDownMenu" class="d-inline-block position-relative">
                                <i class="fas fa-user me-2"></i>${sessionScope.USER.name}
                                <div id="dropDownContent" class="d-none bg-white text-start position-absolute shadow">
                                         <c:if test="${not empty sessionScope.USER}">           
                                        <a href="account" class="nav-link mb-2 text-decoration-none p-2" id="item">Cài đặt tài khoản</a>   
                                    </c:if>                               
                                    <c:if test="${sessionScope.USER.role eq 'SE'}">                                  
                                        <a href="sellerPage" class="nav-link mb-2 text-decoration-none p-2" id="item">Quản lý đơn hàng</a>   
                                    </c:if>                                 
                                    <c:if test="${sessionScope.USER.role eq 'AD'}">            
                                        <a href="dashboard" class="nav-link mb-2 text-decoration-none p-2" id="item">Quản lý cửa hàng</a>   
                                    </c:if>
                                    <a href="logOut" class="nav-link text-decoration-none p-2" id="item">Đăng xuất</a>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${empty sessionScope.USER}"><div><a href="login" class="nav-link"><i class="fas fa-user    "></i>Đăng nhập</a></div>
                        </c:if>
                    </li>
                    <li class="nav-item col-1 d-inline-block text-center">
                        <div> 
                            <c:if test="${not empty sessionScope.USER}">
                                <a href="cart" class="nav-link text-center"><i class="fa-solid fa-cart-shopping position-relative">
                                        <c:if test="${not empty sessionScope.CART}">
                                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                                                <span class="visually-hidden">New alerts</span>
                                            </span>
                                        </c:if>
                                    </i>
                                </a>
                            </c:if> 
                        </div>
                    </li>
                    <li class="nav-item col-1 d-inline-block text-center">
                        <div>
                            <c:if test="${not empty sessionScope.USER}">
                                <jsp:useBean id="formatPrinter" class="com.nestf.util.FormatPrinter"/>
                                <a href="voucher" class="nav-link text-center">${formatPrinter.noFraction(sessionScope.USER.point)} CP</a>
                            </c:if>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
        <div id="white-board" class="bg-white w-75">  
            <h2 class="d-block col-8">Cẩm nang</h2>
            <c:if test="${ not empty requestScope.POST_LIST}" >
                <div class="row row-cols-3 container-fluid m-0">
                    <c:forEach items="${requestScope.POST_LIST}" var="post">
                        <c:url var="postLink" value="loadArticle">
                            <c:param name="postID" value="${post.postID}"/>     
                        </c:url>
                        <a href="${postLink}" class="nav-link col mb-4" id="post">
                            <img src="${post.thumbnail}" class="col-10" width="316.5" height="165.1"><br>
                            <span class="mt-2 col-10 text-start d-inline-flex">${post.title}</span>
                        </a> 
                    </c:forEach>                    
                </div>
            </c:if>
            <c:if test="${empty requestScope.POST_LIST}">
                <div style="height:50vh;" class="d-flex align-items-center justify-content-center">
                    <h2 class="text-muted text-center pb-5">Chưa có bài viết nào</h2>
                </div>
            </c:if>

        </div>
        <button type="button" class="btn btn-floating btn-lg position-fixed rounded-circle text-light bottom-25" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>
        <c:if test="${sessionScope.USER.role eq 'AD'}">
            <a href="dashboard">
                <button type="button" id="dashboardRedirect" class="btn btn-floating btn-lg rounded-circle text-light position-fixed d-block"  data-bs-toggle="tooltip" data-bs-placement="right" title="DASHBOARD">
                    <i class="fa-solid fa-shop"></i>
                </button>
            </a>
        </c:if>
        <c:if test="${sessionScope.USER.role eq 'SE'}">
            <a href="sellerPage">
                <button type="button" id="dashboardRedirect" class="btn btn-floating btn-lg rounded-circle text-light position-fixed d-block"  data-bs-toggle="tooltip" data-bs-placement="right" title="DASHBOARD">
                    <i class="fa-solid fa-shop"></i>
                </button>
            </a>
        </c:if>
        <c:import url="footer.html" charEncoding="UTF-8"/>   
        <script src="js/util.js"></script>
    </body>

</html>