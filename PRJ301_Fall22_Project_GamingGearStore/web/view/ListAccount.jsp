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
            <h2 style="color: darkorange;text-align: left;font-family: sans-serif;margin-left: 4%">Account Management</h2>
            <br/>
            <table border="3px solid black" style="font-family: cursive;margin-left: 4%">
                <tr style="background-color: bisque;">
                    <th>ID</th>
                    <th>User</th>
                    <th>Pass</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            <c:forEach items="${listA}" var="o">
                <tr>
                    <td>${o.id}</td>
                    <td>${o.user}</td>
                    <td>${o.pass}</td>
                    <td>${o.address}</td>
                    <td>${o.phone}</td>
                    <td>${o.email}</td>
                    <td>
                        <c:if test="${o.role==0}">
                            user
                        </c:if>
                        <c:if test="${o.role==1}">
                            seller
                        </c:if>
                        <c:if test="${o.role==2}">
                            admin
                        </c:if>
                        <c:if test="${o.role==3}">
                            sale manager
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${o.role!=2}">
                            <a href="updateAccount?aid=${o.id}"><button style="background-color: white;border: none;font-family: cursive">Update</button></a>
                        </c:if>                       
                    </td>
                    <td>
                        <c:if test="${o.role!=2}">
                            <a href="#" onclick="showMess(${o.id})"><button style="background-color: white;border: none;font-family: cursive">Delete</button></a>
                        </c:if> 
                    </td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <ul class="start" style="padding-bottom: 20px">
            <li ><a href=""><i></i></a></li>
                        <c:forEach begin="1" end="${endP}" var="i">
                <li class="arrow"><a href="listAccount?index=${i}">${i}</a></li>
                </c:forEach>
            <li ><a href=""><i  class="next"> </i></a></li>
        </ul>              
        <a href="addAccount"><button style="background-color:orange;color: whitesmoke;
                                     border-width: thin;border-radius: 6px;margin-left: 4%">Create Account</button></a>
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
