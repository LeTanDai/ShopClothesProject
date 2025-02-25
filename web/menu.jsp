<%-- 
    Document   : menu
    Created on : Jun 19, 2024, 1:29:01 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">      
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

        <link href="themes/css/bootstrappage.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


        <!-- global styles -->
        <link href="themes/css/flexslider.css" rel="stylesheet"/>
        <link href="themes/css/main.css" rel="stylesheet"/>

        <!-- scripts -->
        <script src="themes/js/jquery-1.7.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>				
        <script src="themes/js/superfish.js"></script>	
        <script src="themes/js/jquery.scrolltotop.js"></script>
    </head>
    <body>
        <div id="top-bar" class="container">
            <div class="row">
                <div class="span4">
                    <form method="POST" action="search" class="search_form" style="height: 25px">
                        <input type="text" name="txt" value="${txtS}" placeholder="Search" style="margin: 0">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <div class="span8">
                    <div class="account pull-right">
                        <ul class="user-menu">				
                            <c:if test="${sessionScope.account != null}">
                                <li>
                                    <a href="editProfile.jsp">My Account</a>
                                </li>
                            </c:if>
                            <li><a href="cart.jsp">Your Cart</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                                <c:if test="${sessionScope.account != null}">
                                <li>
                                    <c:choose>
                                        <c:when test="${sessionScope.account.isAdmin == 1}">
                                            <a href="AdminServlet">Hello ${sessionScope.account.username}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#">Hello ${sessionScope.account.username}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <a href="logout">Logout</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                                <li>
                                    <a href="login">Login</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">    
                                <li>
                                    <a href="forgotPassword">Forgot password</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="wrapper" class="container">
            <section class="navbar main-menu">
                <div class="navbar-inner main-menu">				
                    <a href="HomeController" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
                    <nav id="menu" class="pull-right">
                        <ul>
                            <li>
                                <a href="HomeController">Home</a>
                            </li>
                            <li><a>Products</a>					
                                <ul>
                                    <c:forEach items="${listC}" var="category">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/searchbycategory?txt=${category.cname}">${category.cname}</a>
                                        </li>								
                                    </c:forEach>								
                                </ul>
                            </li>																
                            <li><a href="InfoController">Contact Us</a></li>
                        </ul>
                    </nav>
                </div>
            </section>
            <script src="themes/js/common.js"></script>
            <script src="themes/js/jquery.flexslider-min.js"></script>
            <script type="text/javascript">
                $(function () {
                    $(document).ready(function () {
                        $('.flexslider').flexslider({
                            animation: "fade",
                            slideshowSpeed: 4000,
                            animationSpeed: 600,
                            controlNav: false,
                            directionNav: true,
                            controlsContainer: ".flex-container" // the container that holds the flexslider
                        });
                    });
                });
            </script>    
    </body>
</html>
