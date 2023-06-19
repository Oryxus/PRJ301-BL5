<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
        <style>
            img{
                width: 200px;
                height: 260px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/view/Header.jsp"></jsp:include>
            <br/>     
            <div class="banner-mat">
                <h3 class="future">NEWEST PRODUCT</h3>
                <div class="container">
                    <div class="banner">

                        <!-- Slideshow 4 -->
                        <div class="slider">
                            <ul class="rslides" id="slider1">
                                <li><img style="width: 100%;height: 600px" src="${p.image}" />
                            </li>
                            <li><img src="images/banner1.jpg" alt="">
                            </li>                            
                        </ul>
                    </div>

                    <div class="banner-bottom">
                        <div class="banner-matter">
                            <p>${p.title}</p>                                                       
                            <a href="detail?pid=${p.id}" class="hvr-shutter-in-vertical ">${p.price} $</a>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>				
                <!-- //slider-->
            </div>
        </div>
        <!---->
        <div class="container">
            <div class="content">
                <div class="content-top">
                    <h3 class="future">PRODUCTS</h3>
                    <div class="content-top-in">
                        <div class="row">
                            <c:forEach items="${listP}" var="o">
                                <div class="col-md-3 md-col" style="height: 450px">                               
                                    <div class="col-md">
                                        <a href="detail?pid=${o.id}"><img src="${o.image}" alt="" /></a>	
                                        <div class="top-content">
                                            <h5><a href="detail?pid=${o.id}">${o.title}</a></h5>
                                            <p class="card-text show_txt">${o.name}</p>
                                            <div class="white">
                                                <a href="detail?pid=${o.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD TO CART</a>
                                                <p class="dollar"><span class="in-dollar">$</span><span>${o.price}</span></p>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>							
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="content-middle">
                    <h3 class="future">BRANDS</h3>
                    <div class="content-middle-in">
                        <ul id="flexiselDemo1">			
                            <li><img src="bonfire/images/asus.png" style="width: 100px;height: 100px"/></li>
                            <li><img src="bonfire/images/acer.png" style="width: 100px;height: 80px"/></li>
                            <li><img src="bonfire/images/gigabyte.png" style="width: 120px;height: 100px"/></li>
                            <li><img src="bonfire/images/akko.png" style="width: 110px;height: 60px"/></li>
                            <li><img src="bonfire/images/msi.png" style="width: 120px;height: 70px"/></li>
                            <li><img src="bonfire/images/razer.png" style="width: 110px;height: 90px"/></li>
                            <li><img src="bonfire/images/logitech.png" style="width: 100px;height: 100px"/></li>
                        </ul>
                        <script type="text/javascript">
                            $(window).load(function () {
                                $("#flexiselDemo1").flexisel({
                                    visibleItems: 4,
                                    animationSpeed: 1000,
                                    autoPlay: true,
                                    autoPlaySpeed: 3000,
                                    pauseOnHover: true,
                                    enableResponsiveBreakpoints: true,
                                    responsiveBreakpoints: {
                                        portrait: {
                                            changePoint: 480,
                                            visibleItems: 1
                                        },
                                        landscape: {
                                            changePoint: 640,
                                            visibleItems: 2
                                        },
                                        tablet: {
                                            changePoint: 768,
                                            visibleItems: 3
                                        }
                                    }
                                });

                            });
                        </script>
                        <script type="text/javascript" src="bonfire/js/jquery.flexisel.js"></script>

                    </div>
                </div>
                <div class="container">
                    <div class="content">
                        <div class="content-top">
                            <h3 class="future">BEST SELLER</h3>
                            <div class="content-top-in">
                                <div class="row">
                                    <c:forEach items="${list4}" var="o">
                                        <div class="col-md-3 md-col" style="height: 450px">                               
                                            <div class="col-md">
                                                <a href="detail?pid=${o.id}"><img src="${o.image}" alt="" /></a>	
                                                <div class="top-content">
                                                    <h5><a href="detail?pid=${o.id}">${o.title}</a></h5>
                                                    <p class="card-text show_txt">${o.name}</p>
                                                    <div class="white">
                                                        <a href="detail?pid=${o.id}" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2 ">ADD TO CART</a>
                                                        <p class="dollar"><span class="in-dollar">$</span><span>${o.price}</span></p>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>							
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!---->

                        <!---->

                    </div>
                </div>
                <!---->
                <jsp:include page="/view/Footer.jsp"></jsp:include>
                </body>
                </html>

