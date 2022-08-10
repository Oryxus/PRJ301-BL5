<%-- 
    Document   : inbox
    Created on : Aug 10, 2022, 3:05:51 PM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="loginname.jsp"></jsp:include>
        <div>
        <c:forEach items="${requestScope.messages}" var="m">
            ${m.sender.username} : ${m.content} <br/>
        </c:forEach>
        </div>
    </body>
</html>
