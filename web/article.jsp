<%-- 
    Document   : article
    Created on : Sep 23, 2022, 3:43:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <c:if test="${empty requestScope.POST}" >
        <c:redirect url="handbook"></c:redirect>
    </c:if>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
        <title>${requestScope.POST.title}</title>
        <meta name="description" content="">
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
                        <a href="handbook" class="nav-link text-center">Cẩm nang</a>
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
                                    </c:if>                                        <c:if test="${sessionScope.USER.role eq 'SE'}">           
                                        <a href="sellerPage" class="nav-link mb-2 text-decoration-none p-2" id="item">Quản lý đơn hàng</a>    
                                    </c:if>                                        <c:if test="${sessionScope.USER.role eq 'AD'}">            
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
        <div id="white-board" class="d-flex justify-content-between col-10">
            <div class="bg-white col-8 mt-4 d-inline-block" id="article">  
                <h2 class="pt-4 fw-bold ms-4">${requestScope.POST.title}</h2>
                <div id="author" class="text-start ms-4">   
                    <jsp:useBean id="date" class="com.nestf.util.FormatPrinter"/> 
                    <span class="text-muted">Ngày đăng: ${date.printDate(requestScope.POST.postDate)}</span>
                </div><br>
                <div id="content" class="pb-2 pe-4">            
                    ${requestScope.POST.content}
                </div>
            </div>
            <c:if test = "${not empty requestScope.RECOMMEND_POST}">
                <div id="other-article" class="bg-white d-inline-block mt-4 h-100 sticky-top">
                    <h2 class="text-center">Bài viết khác</h2>
                    <c:forEach items="${requestScope.RECOMMEND_POST}" var = "post">
                        <c:url var="postLink" value="loadArticle">
                            <c:param name="postID" value="${post.postID}"/>     
                        </c:url>
                        <a href="${postLink}" class="nav-link text-decoration-none" id="article-link">
                            <div class="m-3 d-flex justify-content-start">
                                <img src="${post.thumbnail}" class="d-inline-block col-6">
                                <div class="d-inline-block text-start ms-2">
                                    <span>${post.title}</span>
                                </div>            
                            </div>
                        </a>
                    </c:forEach>

                </div>
            </c:if>
        </div>
        <button type="button" class="btn btn-floating btn-lg position-fixed rounded-circle text-light bottom-25" id="btn-back-to-top" style="left:2.5%">
            <i class="fas fa-arrow-up"></i>
        </button>     
        <c:if test="${sessionScope.USER.role eq 'AD'}">
            <a href="dashboard">
                <button type="button" id="dashboardRedirect" class="btn btn-floating btn-lg rounded-circle text-light position-fixed d-block"  data-bs-toggle="tooltip" data-bs-placement="right" title="DASHBOARD" style="left:2.5%">
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
