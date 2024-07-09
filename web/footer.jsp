<%-- 
    Document   : footer
    Created on : Jul 3, 2024, 10:54:51 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Bootstrap E-commerce Templates</title>
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
        <!--[if lt IE 9]>			
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <section id="footer-bar">
            <div class="row">
                <div class="span3">
                    <h4>Navigation</h4>
                    <ul class="nav">
                        <li><a href="HomeController">Homepage</a></li>                         
                        <li><a href="InfoController">Contac Us</a></li>
                        <li><a href="cart.jsp">Your Cart</a></li>
                        <li><a href="login">Login</a></li>							
                    </ul>					
                </div>
                <div class="span4">
                    <h4>My Account</h4>
                    <ul class="nav">
                        <li><a href="editProfile.jsp">My Account</a></li>
                        <li><a href="OrderHistoryServlet">Order History</a></li>
                        <li><a href="cart.jsp">Wish List</a></li>   
                    </ul>
                </div>
                <div class="span5">
                    <p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
                    <p>Discover the latest in men's fashion at shopper. From classic styles to modern trends, we offer a wide range of apparel to elevate your wardrobe.</p>
                </div>					
            </div>	
        </section>
        <section id="copyright" style="text-align: center">
            <span>Shopper Team</span>
        </section>
    </body>
</html>
