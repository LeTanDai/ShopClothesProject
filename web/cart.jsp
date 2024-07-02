<%-- 
    Document   : cart
    Created on : Jun 3, 2024, 4:57:35 PM
    Author     : PC
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
                <img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
                <h4><span>Shopping Cart</span></h4>
            </section>
            <section class="main-content">				
                <div class="row">
                    <div class="span12" >
                        <form action="CheckoutServlet" >
                            <h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Remove</th>
                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Size</th>
                                        <th>Quantity</th>
                                        <th>Unit Price</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <!-- <td><input type="checkbox" value="option1"></td> -->
                                        <td ><input type="submit" class="buttons center btn btn-inverse" value="Remove"></td>
                                        <td><a href="product_detail.jsp"><img alt="" src="themes/images/ladies/9.jpg" width="100px" height="100px"></a></td>
                                        <td>Fusce id molestie massa</td>
                                        <td>L</td>
                                        <td><input type="text" placeholder="1" class="input-mini"></td>
                                        <td>$2,350.00</td>
                                        <td>$2,350.00</td>
                                    </tr>			  		  
                                </tbody>
                            </table>
                            <p class="buttons center"><input type="submit" value="checkout" class="btn btn-inverse"></p>
                        </form>
                    </div>					
                </div>
        </div>
    </section>			
    <section id="footer-bar">
        <div class="row">
            <div class="span3">
                <h4>Navigation</h4>
                <ul class="nav">
                    <li><a href="./index.jsp">Homepage</a></li>  
                    <li><a href="./about.jsp">About Us</a></li>
                    <li><a href="./contact.jsp">Contac Us</a></li>
                    <li><a href="./cart.jsp">Your Cart</a></li>
                    <li><a href="./register.jsp">Login</a></li>							
                </ul>					
            </div>
            <div class="span4">
                <h4>My Account</h4>
                <ul class="nav">
                    <li><a href="#">My Account</a></li>
                    <li><a href="#">Order History</a></li>
                    <li><a href="#">Wish List</a></li>
                    <li><a href="#">Newsletter</a></li>
                </ul>
            </div>
            <div class="span5">
                <p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. the  Lorem Ipsum has been the industry's standard dummy text ever since the you.</p>
                <br/>
                <span class="social_icons">
                    <a class="facebook" href="#">Facebook</a>
                    <a class="twitter" href="#">Twitter</a>
                    <a class="skype" href="#">Skype</a>
                    <a class="vimeo" href="#">Vimeo</a>
                </span>
            </div>					
        </div>	
    </section>
    <section id="copyright">
        <span>Copyright 2013 bootstrappage template  All right reserved.</span>
    </section>
</div>
<script src="themes/js/common.js"></script>
<script>
    $(document).ready(function () {
        $('#checkout').click(function (e) {
            document.location.href = "checkout.jsp";
        })
    });
</script>		
</body>
</html>
