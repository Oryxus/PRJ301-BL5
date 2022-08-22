<%-- 
    Document   : report
    Created on : Aug 15, 2022, 4:22:10 PM
    Author     : Ngo Tung Son
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timesheet Report</title>
    </head>
    <body>
        <fmt:setLocale value = "vi_VN"/>
        <jsp:useBean id="dt" class="helper.DateTimeHelper"/>
        <h2 style="color: darkviolet;text-align: left;font-family: sans-serif">BẢNG TĂNG CA THÁNG 8</h2>
        <table border="1px" style="font-family: cursive;left: 50%">
            <tr style="background-color: orange;">
                <td>ID</td>
                <td>Name</td>
                <td>Position</td>               
                <td>Overtime date</td>
                <td>Overtime shift</td>
                <td>Overtime working hour</td>
                <td>Status</td>
                <td>Paid</td>
            </tr>          
            <c:forEach items="${requestScope.overtimes}" var="o">
                <tr>
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>${o.getEmployee().getId()}</td>
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>${o.getEmployee().getName()}</td>
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>${o.getEmployee().getPosition()}</td>                    
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>${o.date}</td>
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>${o.sid}</td>
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>${o.overtimehour}</td>  
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>
                        <c:if test="${o.status eq 'true'}">Excepted</c:if>
                        <c:if test="${o.status eq 'false'}">Denied</c:if>
                        </td>
                    <td <c:if test="${o.status eq 'true'}">
                            style="background-color: lime;"
                        </c:if>>
                        <c:if test="${o.status eq 'true'}">${o.getEmployee().getSalaryPerHour()*o.overtimehour}</c:if>
                        <c:if test="${o.status eq 'false'}">0</c:if>
                        </td>
                    </tr>

            </c:forEach>
        </table>
        <br/>             
        <div>
            <a href="report"><button style="background-color: azure;font-size: 15px;font-family: monospace;margin-left: 3%">Bảng chấm công</button></a>
        </div>
    </body>
</html>
