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
                    <form method="POST" class="search_form">
                        <input type="text" class="input-block-level search-query" Placeholder="eg. T-sirt">
                    </form>
                </div>
                <div class="span8">
                    <div class="account pull-right">
                        <ul class="user-menu">				
                            <li><a href="#">My Account</a></li>
                            <li><a href="cart.jsp">Your Cart</a></li>
                            <li><a href="checkout.jsp">Checkout</a></li>
                                <c:if test="${sessionScope.account != null}">
                                <li>
                                    <a href="#">Hello ${sessionScope.account.name}</a>
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
                            <c:if test="${sessionScope.account != null}">
                                <li>
                                    <a href="editProfile.jsp">Edit Profile</a>
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
                    <a href="index.jsp" class="logo pull-left"><img src="themes/images/logo.png" class="site_logo" alt=""></a>
                    <nav id="menu" class="pull-right">
                        <ul>
                            <li><a href="./products.jsp">Woman</a>					
                                <ul>
                                    <li><a href="./products.jsp">Lacinia nibh</a></li>									
                                    <li><a href="./products.jsp">Eget molestie</a></li>
                                    <li><a href="./products.jsp">Varius purus</a></li>									
                                </ul>
                            </li>															
                            <li><a href="./products.jsp">Man</a></li>			
                            <li><a href="./products.jsp">Sport</a>
                                <ul>									
                                    <li><a href="./products.jsp">Gifts and Tech</a></li>
                                    <li><a href="./products.jsp">Ties and Hats</a></li>
                                    <li><a href="./products.jsp">Cold Weather</a></li>
                                </ul>
                            </li>							
                            <li><a href="./products.jsp">Hangbag</a></li>
                            <li><a href="contact.jsp">Contact Us</a></li>
                            <li><a href="./products.jsp">Top Seller</a></li>
                        </ul>
                    </nav>
                </div>
            </section>
    </body>
</html>
