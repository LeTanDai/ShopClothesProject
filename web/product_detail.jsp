<%-- 
    Document   : product_detail
    Created on : Jun 3, 2024, 5:01:33 PM
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
        <link href="themes/css/main.css" rel="stylesheet"/>
        <link href="themes/css/jquery.fancybox.css" rel="stylesheet"/>

        <!-- scripts -->
        <script src="themes/js/jquery-1.7.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>				
        <script src="themes/js/superfish.js"></script>	
        <script src="themes/js/jquery.scrolltotop.js"></script>
        <script src="themes/js/jquery.fancybox.js"></script>
        <!--[if lt IE 9]>			
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>	
        <jsp:include page="menu.jsp"></jsp:include>
            <section class="header_text sub">
                <img class="pageBanner" src="themes/images/carousel/banner2.jpg" alt="New products" >
                <h4><span>Product Detail</span></h4>
            </section>
            <section class="main-content">				
                <div class="row">						
                    <div class="span9">
                        <div class="row">
                            <div class="span4">
                                <a href="${selectedProduct.image}" class="thumbnail" data-fancybox-group="group1" title="Description 1">
                                    <img alt="" src="${selectedProduct.image}">
                                </a>												

                            </div>
                            <div class="span5">
                                <address>
                                    <strong>Category:</strong> <span>${selectedProduct.category.cname}</span><br>
                                    <strong>Product Name:</strong> <span>${selectedProduct.name}</span><br>
                                </address>									
                                <h4><strong>Price: $${selectedProduct.price}</strong></h4>
                            </div>
                            <div class="span5">
                                <form action="AddToCartController" method="post" class="form-inline">
                                    <input type="hidden" name="productId" value="${selectedProduct.id}">
                                    <select name="size">
                                        <option value="S">Small</option>
                                        <option value="M">Medium</option>
                                        <option value="L">Large</option>
                                    </select>
                                    <p>&nbsp;</p>
                                    <label><strong>Quantity:</strong></label>
                                    <input type="text" name="quantity" class="span1" placeholder="1">
                                    <button class="btn btn-inverse" type="submit?productId=${selectedProduct.id}">Add to cart</button>
                                </form>
                            </div>							
                        </div>
                        <div class="row">
                            <div class="span9">
                                <ul class="nav nav-tabs" id="myTab">
                                    <li class="active"><a href="#home">Description</a></li>
                                    <li class=""><a href="#profile">Additional Information</a></li>
                                </ul>							 
                                <div class="tab-content">
                                    <div class="tab-pane active" id="home">${selectedProduct.getDescription()}</div>
                                    <div class="tab-pane" id="profile">
                                        <table class="table table-striped shop_attributes">	
                                            <tbody>
                                                <tr class="">
                                                    <th>Size</th>
                                                    <td>Large, Medium, Small</td>
                                                </tr>		
                                                <tr class="alt">
                                                    <th>Colour</th>
                                                    <td>Orange, Yellow</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>							
                            </div>						
                            
                        </div>
                    </div>
                    
            </section>			
        <jsp:include page="footer.jsp"></jsp:include> 
        </div>
        <script src="themes/js/common.js"></script>
        <script>
            $(function () {
                $('#myTab a:first').tab('show');
                $('#myTab a').click(function (e) {
                    e.preventDefault();
                    $(this).tab('show');
                })
            })
            $(document).ready(function () {
                $('.thumbnail').fancybox({
                    openEffect: 'none',
                    closeEffect: 'none'
                });

                $('#myCarousel-2').carousel({
                    interval: 2500
                });
            });
        </script>
    </body>
</html>
