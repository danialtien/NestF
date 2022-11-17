<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : newjsp3
    Created on : Sep 20, 2022, 4:00:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Về chúng tôi</title>
        <link rel="icon" href="img/logo.png" type="image/x-icon" />
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
                        <a href="aboutPage" class="nav-link text-center current-tab disabled">Về chúng tôi</a>
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
                                <a href="cart" class="nav-link text-center">
                                    <i class="fa-solid fa-cart-shopping position-relative">
                                        <c:if test="${not empty sessionScope.CART}">
                                            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                                                <span class="visually-hidden">New alerts</span>
                                            </span>
                                        </c:if>
                                    </i>
                                </a>
                            </c:if>                               
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
            <div class="d-flex justify-content-between col-11 m-auto">
                <img src="img/about2.png" class="rounded col-5 me-5 mt-4">
                <div class="d-inline-block">
                    <h3 class="mt-5 mb-3">SỨ MỆNH</h3>
                    <p class="text-start">
                        Nest-F ra đời với sứ mệnh trở thành người đồng hành uy tín của người Việt Nam trên hành trình nâng cao sức khoẻ.<br><br>
                        Là người tiên phong trong ngành yến chúng tôi lao động với tất cả cái tâm, cái đức hun đúc từ muôn đời xưa!<br><br>
                        Những người đi trước, những người kế thừa, hai thế hệ giữa dòng chảy của cuộc sống từ 10 năm trước hay hôm nay, trên hành trình tìm ra lời giải cho yến Việt chung mục tiêu: Vì khách hàng Cam kết chất lượng – Không ngừng học hỏi, Chuyên nghiệp – Chính trực – Hài hòa lợi ích.                   
                    </p>                 
                </div>
            </div>
            <img src="img/about.png" class="col-11 m-3 rounded">
            <div class="d-flex justify-content-between col-11 m-auto pb-4">              
                <div class="d-inline-block col-4 me-5">
                    <h3 class="mt-3 mb-3">GIÁ TRỊ CỐT LÕI</h3>
                    <p class="text-start">
                        Tâm huyết, không ngừng nỗ lực, sáng tạo để mang đến những sản phẩm tốt nhất từ yến sào Việt Nam tới tay người tiêu dùng.
                        <br><br>
                        Trung thực, chính trực, trong sạch, đạo đức, với tinh thần thượng tôn pháp luật trong mọi hành xử, hoạt động của công ty.
                        <br><br>
                        Liên tục nghiên cứu, cải tiến, ứng dụng thông minh khoa học, công nghệ tiên tiến vào trong hoạt động sản xuất, kinh doanh.
                    </p>                 
                </div>
                <div class="ratio ratio-16x9">
                    <iframe title="Yến sào Ý An - Yến sào thiên nhiên cao cấp TVC" src="https://www.youtube.com/embed/KIyK7NuoBUU?feature=oembed" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
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
