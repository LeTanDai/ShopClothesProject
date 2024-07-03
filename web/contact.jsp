<%-- 
    Document   : contact
    Created on : Jun 22, 2024, 7:37:15 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact us</title>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <section class="google_map">
                <iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.85606931642!2d108.25831637459808!3d15.968891042117235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1719060259518!5m2!1svi!2s"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </section>

            <section class="main-content">
                <div class="row">
                    <div class="span5">
                        <div>
                            <h5>ADDITIONAL INFORMATION</h5>
                            <p><strong>Phone:</strong>&nbsp; ${tel}<br>
                            <strong>Address:</strong>&nbsp;${address}<br>
                            <strong>Email:</strong>&nbsp;<a href="#">${mail}</a></p>
                    </div>
                </div>
                <div class="span7">
                    <h3><strong>Opening Hours</strong></h3><br>
                    <c:forEach var="i" items="${openHours}">
                        <p>${i}</p>
                    </c:forEach>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
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
