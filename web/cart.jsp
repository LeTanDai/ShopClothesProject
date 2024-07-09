<%-- 
    Document   : cart
    Created on : Jun 3, 2024, 4:57:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <section class="header_text sub">
                <img class="pageBanner" src="themes/images/pageBanner.jpg" alt="New products" >
                <h4><span>Shopping Cart</span></h4>
            </section>
            <section class="main-content">				
                <div class="row">
                    <div class="span12">
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
                                <!-- Iterate over cart items -->
                            <c:forEach items="${sessionScope.mapP}" var="item">
                                <tr>
                            <form action="RemoveController?id=${item.key.id}" method="post">
                                <td><input type="submit" value="Remove"></td>
                            </form>
                            <td><img alt="" src="${item.value.image}" width="100px" height="100px"></td>
                            <td>${item.value.name}</td>
                            <td>${item.key.size}</td>
                            <td>${item.key.quantity}</td>
                            <td>$${item.value.price}</td>
                            <td>$${item.value.price * item.key.quantity}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                        <a href="CheckoutServlet"><p class="buttons center"><input type="submit" value="Checkout" class="btn btn-inverse"></p></a>
                </div>					
            </div>
        </section>	
        <jsp:include page="footer.jsp"></jsp:include>
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
