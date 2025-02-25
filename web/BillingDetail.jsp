<%-- 
    Document   : checkout
    Created on : Jun 3, 2024, 4:56:59 PM
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
                            <li><a href="checkout.jsp">Checkout</a></li>					
                            <li><a href="login.jsp">Login</a></li>			
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
                            <li><a href="./products.jsp">Best Seller</a></li>
                            <li><a href="./products.jsp">Top Seller</a></li>
                        </ul>
                    </nav>
                </div>
            </section>				
            <section class="header_text sub">
                <img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
                <h4><span>Check Out</span></h4>
            </section>	
            <section class="main-content">
                <div class="row">
                    <div class="span12">
                        <div class="accordion" id="accordion2">
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">Account &amp; Billing Details</a>
                                </div>
                                <div id="collapseTwo" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <h4>Your Personal Details</h4>
                                                <div class="control-group">
                                                    <label class="control-label">First Name</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Last Name</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>					  
                                                <div class="control-group">
                                                    <label class="control-label">Email Address</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Telephone</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Fax</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span6">
                                                <h4>Your Address</h4>
                                                <div class="control-group">
                                                    <label class="control-label">Company</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Company ID:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>					  
                                                <div class="control-group">
                                                    <label class="control-label"><span class="required">*</span> Address 1:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Address 2:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label"><span class="required">*</span> City:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label"><span class="required">*</span> Post Code:</label>
                                                    <div class="controls">
                                                        <input type="text" placeholder="" class="input-xlarge">
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label"><span class="required">*</span> Country:</label>
                                                    <div class="controls">
                                                        <select class="input-xlarge">
                                                            <option value="1">Afghanistan</option>
                                                            <option value="2">Albania</option>
                                                            <option value="3">Algeria</option>
                                                            <option value="4">American Samoa</option>
                                                            <option value="5">Andorra</option>
                                                            <option value="6">Angola</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label"><span class="required">*</span> Region / State:</label>
                                                    <div class="controls">
                                                        <select name="zone_id" class="input-xlarge">
                                                            <option value=""> --- Please Select --- </option>
                                                            <option value="3513">Aberdeen</option>
                                                            <option value="3514">Aberdeenshire</option>
                                                            <option value="3515">Anglesey</option>
                                                            <option value="3516">Angus</option>
                                                            <option value="3517">Argyll and Bute</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">Confirm Order</a>
                                </div>
                                <div id="collapseThree" class="accordion-body collapse">
                                    <div class="accordion-inner">
                                        <div class="row-fluid">
                                            <div class="control-group">
                                                <label for="textarea" class="control-label">Comments</label>
                                                <div class="controls">
                                                    <textarea rows="3" id="textarea" class="span12"></textarea>
                                                </div>
                                            </div>									
                                            <button class="btn btn-inverse pull-right">Confirm order</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
    </body>
</html>
