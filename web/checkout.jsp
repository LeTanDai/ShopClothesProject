<%-- 
    Document   : checkout
    Created on : Jun 3, 2024, 4:56:59 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.User" %>
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
        <jsp:include page="menu.jsp"></jsp:include>
            <div id="wrapper" class="container">				
                <section  class="homepage-slider" id="home-slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <img src="themes/images/carousel/banner2.jpg" alt="" />
                            </li>
                            <li>
                                <img src="themes/images/carousel/banner1.jpg" alt="" />
                                <div class="intro">
                                    <h1>Mid season sale</h1>
                                    <p><span>Up to 50% Off</span></p>
                                    <p><span>On selected items online and in stores</span></p>
                                </div>
                            </li>
                        </ul>
                    </div>			
                </section>	
                <section class="main-content">
                    <div class="row">
                        <div class="span12">
                            <div class="accordion" id="accordion2">						
                                <div class="accordion-group">
                                    <div class="accordion-heading">
                                        <a href="#collapseThree">Confirm Order</a>
                                    </div>

                                    <div>
                                        <table class="table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>
                                                    <th>Size</th>
                                                    <th>Unit Price</th>
                                                    <th>Address</th>
                                                    <th>Phone</th>
                                                </tr>
                                            </thead>
                                        <% double total = 0;  %>
                                        <tbody>
                                            <c:forEach var="i" items="${mapPP}">
                                                <tr>
                                                    <td><img src="${i.value.image}" width="100px" height="100px"/></td>
                                                    <td>${i.value.name}</td>
                                                    <td>${i.key.quantity}</td>
                                                    <td>${i.key.size}</td>
                                                    <td>${i.value.price}</td>
                                                    <td>${sessionScope.account.address}</td>
                                                    <td>${sessionScope.account.phone}</td>
                                                </tr>
                                        </c:forEach><br>	
                                        </tbody>
                                    </table>
                                    <h4 class="pull-right" style="margin-right: 20px">Total = ${total}</h4>
                                    <h4 class="pull-right" style="margin-right: 20px"></h4>
                                    <br>
                                    <br>
                                    <div>
                                    </div>
                                </div>

                                <div>
                                    <div class="accordion-inner">
                                        <div class="row-fluid">
                                            <div class="control-group">
                                                <label for="textarea" class="control-label">Comments</label>
                                                <div class="controls">
                                                    <textarea style="resize: none;" rows="3" id="textarea" class="span12"></textarea>
                                                </div>
                                            </div>	
                                            <form action="OrderHistoryServlet" method="post">
                                                <input type="submit" class="btn btn-inverse pull-right" value="confirm">
                                            </form>
                                            <!--                                            <a href="orderHIstory.jsp" lass="btn btn-inverse pull-right">confirm</a>-->
                                            <!--                                            <button class="btn btn-inverse pull-right">Confirm order</button>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>				
                    </div>
                </div>
            </section>			
            <jsp:include page="footer.jsp"></jsp:include>
<script src="themes/js/common.js"></script>
</body>
</html>
