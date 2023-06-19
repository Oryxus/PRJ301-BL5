<%-- 
    Document   : AddAccount
    Created on : Jul 13, 2022, 1:51:24 AM
    Author     : T495s
--%>

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
            <div class="container">
                <div class="account">
                    <h2 class="account-in">Update Account</h2>
                    <form action="updateAccount" method="post">
                        <div>
                            <span>ID</span>
                            <input value="${acc.id}" type="text" name="id" style="margin-left: 6%" readonly required>
                        </div>
                        <div>
                            <span>Username*</span>
                            <input value="${acc.user}" type="text" name="user" required>
                        </div> 	
                        <div>			
                            <span>Password*</span>
                            <input value="${acc.pass}" type="text" name="pass" required> 
                        </div>			
                        <div> 	
                            <span>Role*</span>
                            <select name="role" style="margin-left: 5%">
                            <option value="0" ${acc.role==0?"selected":""}>User</option>
                            <option value="1" ${acc.role==1?"selected":""}>Seller</option>
                            <option value="2" ${acc.role==2?"selected":""}>Admin</option>
                            <option value="3" ${acc.role==3?"selected":""}>Sale manager</option>
                        </select> 
                        </div>
                        <div>			
                            <span>Address*</span>
                            <input value="${acc.address}" type="text" name="address" required> 
                        </div>
                        <div>			
                            <span>Phone*</span>
                            <input value="${acc.phone}" type="text" name="phone" required> 
                        </div>
                        <div>			
                            <span>Email*</span>
                            <input value="${acc.email}" type="text" name="email" required> 
                        </div>
                        <br/>
                        <input type="submit" value="Update Account"> 
                        <button style="background-color: rgb(252,94,53);padding: 7.7px 15.4px;border: none;border-radius: 6px;margin-left: 5%;margin-bottom: 15px">
                <a href="listAccount" style="color: white">Account Management</a></button>
                    </form>
                </div>
            </div>           
            
               
        <jsp:include page="/view/Footer.jsp"></jsp:include>
    </body>
</html>
