<%-- 
    Document   : index
    Created on : Jun 3, 2024, 4:55:42 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Shopper</title>
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
            <section class="header_text">
                Choose our men's clothing store for top-quality apparel and an exceptional shopping experience.
                <br/>Trust us to make your shopping experience rewarding and enjoyable.
            </section>
            <section class="main-content">
                <div class="row">
                    <div class="span12">
                        <div class="row">
                            <div class="span12">
                                <h4 class="title">
                                    <span class="pull-left"><strong>All Products</strong></span>
                                </h4>
                                <div id="product-list">
                                    <ul   class="row thumbnails">
                                    <c:forEach items="${listP}" var="product">
                                            <li class="span3">
                                                <div style="height: 350px; width: 100%" class="product-box">
                                                    <span class="sale_tag"></span>
                                                    <a href="product-detail?productId=${product.id}"><img src="${product.image}" alt="" style="width: 70%"/></a>
                                                    <a href="product-detail?productId=${product.id}" class="title">${product.name}</a><br/>
                                                    <a href="product-detail?productId=${product.id}" class="category">${product.category.cname}</a>
                                                    <p class="price">${product.price}</p>
                                                </div>
                                            </li>  
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="row feature_box">
                <div class="span4">
                    <div class="service">
                        <div class="responsive">
                            <img src="themes/images/feature_img_2.png" alt="" />
                            <h4>MODERN <strong>DESIGN</strong></h4>
                            <p>Discover our latest collection of stylish and trendy outfits, perfect for any occasion.</p>
                        </div>
                    </div>
                </div>
                <div class="span4">
                    <div class="service">
                        <div class="customize">
                            <img src="themes/images/feature_img_1.png" alt="" />
                            <h4>FREE <strong>SHIPPING</strong></h4>
                            <p>Enjoy free shipping on all orders, featuring our latest collection of stylish and trendy outfits.</p>
                        </div>
                    </div>
                </div>
                <div class="span4">
                    <div class="service">
                        <div class="support">
                            <img src="themes/images/feature_img_3.png" alt="" />
                            <h4>24/7 LIVE <strong>SUPPORT</strong></h4>
                            <p>Experience our stylish and trendy outfits, with 24/7 live support for all your shopping needs.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <section class="our_client">
            <h4 class="title"><span class="text">Manufactures</span></h4>
            <div class="row">					
                <div class="span2">
                    <a href="#"><img alt="" src="themes/images/clients/14.png"></a>
                </div>
                <div class="span2">
                    <a href="#"><img alt="" src="themes/images/clients/35.png"></a>
                </div>
                <div class="span2">
                    <a href="#"><img alt="" src="themes/images/clients/1.png"></a>
                </div>
                <div class="span2">
                    <a href="#"><img alt="" src="themes/images/clients/2.png"></a>
                </div>
                <div class="span2">
                    <a href="#"><img alt="" src="themes/images/clients/3.png"></a>
                </div>
                <div class="span2">
                    <a href="#"><img alt="" src="themes/images/clients/4.png"></a>
                </div>
            </div>
        </section>
    <jsp:include page="footer.jsp"></jsp:include>   
    </div>
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
