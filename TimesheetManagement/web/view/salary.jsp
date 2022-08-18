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
        <jsp:useBean id="dt" class="helper.DateTimeHelper"/>
        <h3>BANG TINH LUONG THANG 8</h3>
        <table border="1px">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Position</td>               
                <td>Working days</td>
                <td>Working hours</td>
                <td>Absent with P</td>
                <td>Absent without P</td>
                <td>Salary/Hour</td>
                <td>Total Salary paid for Working Hours</td>
            </tr>

            <c:forEach items="${requestScope.employees}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>${e.position}</td>                   
                    <td>${e.getNumberOfWorkingDays()}</td>
                    <td>${e.getNumberOfWorkingHours()}</td>
                    <td>${e.absentWithP}</td>
                    <td>${e.absentWithoutP}</td>
                    <td>${e.salaryPerHour}</td>
                    <td>${e.getNumberOfWorkingHours()*e.salaryPerHour}</td>
                </tr>
            </c:forEach>

        </table>  
        <br/>
        <a href="report"><button type="submit">TIMESHEET REPORT</button></a>
    </body>
</html>
