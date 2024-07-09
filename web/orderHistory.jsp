<%-- 
    Document   : orderHistory
    Created on : Jul 1, 2024, 4:57:26 PM
    Author     : lethe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.OrderDAO" %>
<%@page import="entity.Order" %>
<%@page import="entity.Product" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
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
                            <li><a href="cart1.jsp">Checkout</a></li>					
                            <li><a href="register.jsp">Login</a></li>			
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
                            <li><a href="./products.jsp">Best Seller</a>
                                <ul>									
                                    <li><a href="./products.jsp">Gifts and Tech</a></li>
                                    <li><a href="./products.jsp">Ties and Hats</a></li>
                                    <li><a href="./products.jsp">Cold Weather</a></li>
                                </ul>
                            </li>							
                        </ul>
                    </nav>
                </div>
            </section>	

            <section class="header_text sub">
                <img class="pageBanner" src="themes/images/carousel/banner2.jpg" alt="New products" >
                <h4><span>Order History</span></h4>
            </section>

            <h4 class="title"><span class="text"><strong>Order</strong> History</span></h4>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Order ID</th>
                            <th scope="col">Date</th>
                            <th scope="col">Status</th>
                            <th scope="col">Total</th>
                            <th scope="col">Product Image</th>
                            <th scope="col">Address</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                       <c:forEach var="entry" items="${mapOrder}">
                            <tr>
                                <td>${entry.key.id}</td>
                                <td>${entry.key.date}</td>
                                <td>${entry.key.status}</td>
                                <td>
                                    ${entry.key.total}
                                </td>
                                <td>
                                    <c:forEach var="product" items="${entry.value}">
                                        <img style="margin-bottom: 10px" src="${product.image}" width="100px" height="100px" alt="Product Image" class="img-fluid img-thumbnail"/></br>
                                    </c:forEach>
                                </td>
                                <td>${entry.key.address_shipping}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <jsp:include page="footer.jsp"></jsp:include> 



        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
