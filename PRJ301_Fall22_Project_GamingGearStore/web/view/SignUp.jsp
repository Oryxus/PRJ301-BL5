<%-- 
    Document   : AddAccount
    Created on : Jul 13, 2022, 1:51:24 AM
    Author     : T495s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bonfire a Ecommerce Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
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
            <div class="container">
                <div class="account">
                    <h2 class="account-in">Sign Up</h2>
                    <form action="signup" method="post">                       
                        <div>
                            <span>Username*</span>
                            <input name="user" type="text" id="user-name" required="">
                        </div> 	
                        <div>			
                            <span>Password*</span>
                            <input name="pass" type="password" id="user-pass" required=""> 
                        </div>
                        <div>			
                            <span>Confirm Password*</span>
                            <input name="repass" type="password" id="user-repeatpass" required=""> 
                        </div>
                        <br/>
                        <input type="submit" value="Sign Up">
                        <button style="background-color: rgb(252,94,53);padding: 7.7px 15.4px;border: none;border-radius: 6px;margin-left: 5%;margin-bottom: 15px"><a href="login" style="color: white">Cancel</a></button>
                    </form>
                </div>
            </div>                      
               
        <jsp:include page="/view/Footer.jsp"></jsp:include>
    </body>
</html>
