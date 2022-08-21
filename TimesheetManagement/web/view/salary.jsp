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
        <h2 style="color: darkviolet;text-align: center;font-family: sans-serif">BẢNG TÍNH LƯƠNG THÁNG 8</h2>
        <table border="1px" style="font-family: cursive">
            <tr style="background-color: #00ffe0;">
                <td>ID</td>
                <td>Name</td>
                <td>Position</td>               
                <td>Working days</td>
                <td>Working hours</td>
                <td>Absent with P</td>
                <td>Absent without P</td>
                <td>Salary/Hour</td>
                <td>Salary paid for Working Hours</td>
                <td>Bonus</td>
                <td>% gross</td>
                <td>Total salary</td>
            </tr>          
            <c:forEach items="${requestScope.employees}" var="e">
                <tr style="background-color: #fcf4fd;">
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>${e.position}</td>                    
                    <td>${e.getNumberOfWorkingDays()}</td>
                    <td>${e.getNumberOfWorkingHours()}</td>
                    <td>${e.absentWithP}</td>
                    <td>${e.absentWithoutP}</td>
                    <td><fmt:formatNumber value = "${e.salaryPerHour}" 
                                      type = "currency"/></td>
                    <td><fmt:formatNumber value = "${e.getNumberOfWorkingHours()*e.salaryPerHour}" 
                                      type = "currency"/></td>
                    <td><fmt:formatNumber value = "${e.bonus}" 
                                      type = "currency"/></td>
                    <td><fmt:formatNumber value = "${e.grossPercentage}" 
                                      type = "currency"/></td>
                    <td><fmt:formatNumber value = "${(e.getNumberOfWorkingHours()*e.salaryPerHour)+e.bonus+e.grossPercentage}" 
                                      type = "currency"/></td>
                </tr>              
            </c:forEach>

        </table>
        <br/>
        <div>
            <a href="report"><button style="background-color: azure;font-size: 15px;font-family: monospace;margin-left: 4%">Bảng chấm công</button></a>
        </div>
    </body>
</html>
