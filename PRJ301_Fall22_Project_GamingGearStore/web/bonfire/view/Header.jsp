<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
      Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--fonts-->
<link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
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
    <!--header-->
    <div class="header">
        <div class="header-top">
            <div class="container">	
                <div class="header-top-in">			
                    <div class="logo">
                        <a href="home"><img src="images/logo.png" alt=" " ></a>
                    </div>
                    <div class="header-in">
                        <ul class="icon1 sub-icon1">
                            <c:if test="${sessionScope.acc.role == 2}">
                                <li class="nav-item">
                                    <a class="nav-link" href="listAccount">Manage Account</a>
                                </li>
                            </c:if>                
                            <c:if test="${sessionScope.acc.role == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="manager">Manage Product</a>
                                </li>
                            </c:if>                
                            <c:if test="${sessionScope.acc !=null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Welcome ${sessionScope.acc.user}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="logout">Logout</a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc== null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Hello and Welcome</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="login">Login</a>
                                </li>
                            </c:if>
                            <li  ><a href="account.html">  MY ACCOUNT</a></li>                            
                            <li > <a href="checkout.html" >CHECKOUT</a> </li>	
                            <li><div class="cart">
                                    <a href="#" class="cart-in"> </a>
                                    <span> 0</span>
                                </div>
                                <ul class="sub-icon1 list">
                                    <h3>Recently added items(2)</h3>
                                    <div class="shopping_cart">
                                        <div class="cart_box">
                                            <div class="message">
                                                <div class="alert-close"> </div> 
                                                <div class="list_img"><img src="images/14.jpg" class="img-responsive" alt=""></div>
                                                <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span class="actual">
                                                        $12.00</span></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                        <div class="cart_box1">
                                            <div class="message1">
                                                <div class="alert-close1"> </div> 
                                                <div class="list_img"><img src="images/15.jpg" class="img-responsive" alt=""></div>
                                                <div class="list_desc"><h4><a href="#">velit esse molestie</a></h4>1 x<span class="actual">
                                                        $12.00</span></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="total">
                                        <div class="total_left">CartSubtotal : </div>
                                        <div class="total_right">$250.00</div>
                                        <div class="clearfix"> </div>
                                    </div>
                                    <div class="login_buttons">
                                        <div class="check_button"><a href="checkout.html">Check out</a></div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="h_menu4">
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li class="active"><a href="index.html"><i> </i>Home</a></li>
                        <li ><a href="#" >Laptops & Notebooks</a>
                            <ul class="drop">
                                <li><a href="products.html">Sony(2)</a></li>
                                <li><a href="products.html">Android(4)</a></li>
                                <li><a href="products.html">Apple(7)</a></li>
                                <li><a href="products.html">Acer(53)</a></li>
                                <li><a href="products.html">HP(78)</a></li>
                                <li><a href="products.html">Intel(5)</a></li>
                            </ul>
                        </li> 						
                        <li><a href="products.html" >  Tablets</a></li>            
                        <li><a href="products.html" >Components</a></li>						  				 
                        <li><a href="products.html" >Software</a></li>
                        <li><a href="products.html" >Phones & PDAs </a></li>
                        <li><a href="products.html" >  Cameras  </a></li>
                        <li><a href="contact.html" >Contact </a></li>

                    </ul>
                    <script type="text/javascript" src="js/nav.js"></script>
                </div>
            </div>
        </div>
        <div class="header-bottom-in">
            <div class="container">
                <div class="header-bottom-on">
                    <p class="wel"><a href="#">Welcome visitor you can login or create an account.</a></p>
                    <div class="header-can">
                        <ul class="social-in">
                            <li><a href="#"><i> </i></a></li>
                            <li><a href="#"><i class="facebook"> </i></a></li>
                            <li><a href="#"><i class="twitter"> </i></a></li>					
                            <li><a href="#"><i class="skype"> </i></a></li>
                        </ul>	
                        <div class="down-top">		
                            <select class="in-drop">
                                <option value="Dollars" class="in-of">Dollars</option>
                                <option value="Euro" class="in-of">Euro</option>
                                <option value="Yen" class="in-of">Yen</option>
                            </select>
                        </div>
                        <div class="search">
                            <form>
                                <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                                    this.value = '';}" >
                                <input type="submit" value="">
                            </form>
                        </div>

                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
