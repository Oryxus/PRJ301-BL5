<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">	
            <div class="header-top-in">			
                <div class="logo">
                    <a href="home"><h1 style="color: white;">GXGamingGear</h1></a>
                </div>
                <div class="header-in">
                    <ul class="icon1 sub-icon1">
                        <c:if test="${sessionScope.acc.role == 3}">
                            <li class="nav-item">
                                <a class="nav-link" href="listProductBySeller">MANAGE SELLERS</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.role == 3}">
                            <li class="nav-item">
                                <a class="nav-link" href="">STATS</a>
                            </li>
                        </c:if> 
                        <c:if test="${sessionScope.acc.role == 3}">
                            <li class="nav-item">
                                <a class="nav-link" href="manageOrder">MANAGE ORDERS</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.role == 2}">
                            <li class="nav-item">
                                <a class="nav-link" href="listAccount">MANAGE ACCOUNT</a>
                            </li>
                        </c:if>                
                        <c:if test="${sessionScope.acc.role == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="manager">MANAGE PRODUCT</a>
                            </li>
                        </c:if>                
                        <c:if test="${sessionScope.acc !=null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">WELCOME ${sessionScope.acc.user}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">LOGOUT</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc== null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">HELLO AND WELCOME</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="login">LOGIN</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc !=null}">
                            <li ><a href="updateMyAccount">  MY ACCOUNT</a></li>
                            </c:if>

                        <li><div class="cart">
                                <a href="cart" class="cart-in"> </a>

                            </div>                          
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
                    <li class="active-icon"><a href="home"><i> </i>Home</a></li>
                        <c:forEach items="${listCC}" var="o">
                        <li class="${tag == o.cid ? "active":""}"><a href="category?cid=${o.cid}">${o.cname}</a></li>
                        </c:forEach>
                </ul>
                <script type="text/javascript" src="bonfire/js/nav.js"></script>
            </div>
        </div>
    </div>
    <div class="header-bottom-in">
        <div class="container">
            <div class="header-bottom-on">
                <p class="wel"><a href="login">Welcome visitor you can login or create an account.</a></p>
                <div class="header-can">
                    <ul class="social-in">
                        <li><a href="https://www.instagram.com/"><i class="tiktok"> </i></a></li>
                        <li><a href="https://www.facebook.com/"><i class="facebook"> </i></a></li>
                        <li><a href="https://www.twitter.com/"><i class="twitter"> </i></a></li>					
                        <li><a href="https://www.skype.com/"><i class="skype"> </i></a></li>
                    </ul>	
                    <div class="down-top">
                        <form action="orderByPrice" method="post">
                            <select class="in-drop" name="prcS" onchange="this.form.submit()">
                                <option>Order by price</option>
                                <option value="desc" class="in-of">Most expensive</option>                               
                                <option value="acs" class="in-of">Least expensive</option>                                
                            </select>

                        </form>
                    </div>
                    <div class="search">
                        <form action="search" method="post">
                            <input value="${txtS}" name="txt" type="text" placeholder="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = '';
                                    }">
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
<!--end of menu-->
