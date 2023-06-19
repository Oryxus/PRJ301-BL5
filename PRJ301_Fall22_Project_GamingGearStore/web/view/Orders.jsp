<%-- 
    Document   : List
    Created on : Feb 19, 2021, 5:18:51 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bonfire a Ecommerce Category Flat Bootstarp Responsive Website Template | Home :: w3layouts</title>
        <link href="bonfire/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="bonfire/js/jquery.min.js"></script>
        <!-- Custom Theme files -->
        <!--theme-style-->
        <link href="bonfire/css/style.css" rel="stylesheet" type="text/css" media="all" />

        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script type="text/javascript" src="bonfire/js/move-top.js"></script>
        <script type="text/javascript" src="bonfire/js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!--slider-script-->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider1").responsiveSlides({
                    auto: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <!--//slider-script-->
        <script>$(document).ready(function (c) {
                $('.alert-close').on('click', function (c) {
                    $('.message').fadeOut('slow', function (c) {
                        $('.message').remove();
                    });
                });
            });
        </script>
        <script>$(document).ready(function (c) {
                $('.alert-close1').on('click', function (c) {
                    $('.message1').fadeOut('slow', function (c) {
                        $('.message1').remove();
                    });
                });
            });
        </script>
    </head>

    <body>
        <jsp:include page="/view/Header.jsp"></jsp:include>
            <br/>
            <h2 style="color: darkorange;text-align: left;font-family: sans-serif;margin-left: 4%">${requestScope.title}</h2>
            <br/>
            <div class="table-responsive mx-auto col-10" >            
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Ship Date</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Shipping</th>
                        <th scope="col">Total</th>
                        <th scope="col">Status</th>
                        
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="o" items="${requestScope.olist}">
                        <tr>
                            <td>${o.oid}</td>
                            <td>${o.odate}</td>
                            <td>${o.sdate}</td>
                            <td>$ ${o.payment}</td>
                            <td>$ ${o.shipping}</td>
                            <td>$ ${o.total}</td> 
                            <td>${o.status}</td>
                            
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <br/><br/>
        <jsp:include page="/view/Footer.jsp"></jsp:include>
    </body>
    <script>
        function showMess(id) {
            var option = confirm('Do you want to delete?');
            if (option === true) {
                window.location.href = 'deleteAccount?aid=' + id;
            }
        }
    </script>
</html>
