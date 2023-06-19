<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bonfire a Ecommerce Category Flat Bootstarp Responsive Website Template | Single :: w3layouts</title>
        <link href="bonfire/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
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
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 900,
                    source_image_height: 1200,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });

            });
        </script>
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
            <div class="container">
                <div class="single">
                    <div class="col-md-9 top-in-single">
                        <div class="col-md-5 single-top">	
                            <ul id="etalage">
                                <li>
                                    <img class="etalage_thumb_image img-responsive" src="${detail.image}" alt="" >
                            </li>
                        </ul>

                    </div>

                    <div class="col-md-7 single-top-in">
                        <div class="single-para">
                            <h4>${detail.title}</h4>
                            <form action="addcart">                                       
                                <input type="hidden" name="productID" value="${requestScope.detail.id}" readonly><br>                                        
                                <label for="size">Quantity</label>
                                <div>
                                    <select name="quantity">
                                        <option value="1" selected="">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                                <input type="submit" class="round-black-btn" value="Add to Cart">
                            </form>
                            <div class="para-grid">
                                <span  class="add-to">$${detail.price}</span>                           					
                                <div class="clearfix"></div>
                            </div>
                            <h5>${detail.name}</h5>
                          
                            <p>${detail.description}</p>                        

                        </div>
                    </div>

                    <div class="clearfix"> </div>
                    <div class="content-top-in">
                        <div class="row">
                            <c:forEach items="${lst3}" var="o">
                                <div class="col-md-3 md-col" style="width: 30%">                               
                                    <div class="col-md">
                                        <a href="detail?pid=${o.id}"><img src="${o.image}" alt="" /></a>	
                                        <div class="top-content">
                                            <h5><a href="detail?pid=${o.id}">${o.title}</a></h5>
                                            <p class="card-text show_txt">${o.title}</p>
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
                <div class="col-md-3">                 
                    <div class="single-bottom">
                        <h4>Product Categories</h4>
                        <ul>                            
                            <c:forEach items="${listCC}" var="o">
                                <li class="${tag == o.cid ? "active":""}"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="single-bottom">
                        <h4>Latest Product</h4>
                        <div class="product">
                            <img class="img-responsive fashion" src="${p.image}" alt="">
                            <div class="grid-product">
                                <a href="detail?pid=${p.id}" class="elit">${p.name}</a>
                                <span class="price price-in">$${p.price}</span>
                            </div>
                            <div class="clearfix"> </div>
                        </div>

                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <br/>
        <jsp:include page="/view/Footer.jsp"></jsp:include>
    </body>
</html>
