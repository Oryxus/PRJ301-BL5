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
        <h3>BANG CHAM CONG THANG 8</h3>
        <table border="1px">
            <tr>
                <td rowspan="2">ID</td>
                <td rowspan="2">Name</td>
                <td rowspan="2">Position</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td colspan="2"><fmt:formatDate pattern = "dd" 
                                    value = "${d}" /></td>
                    </c:forEach> 
                <td rowspan="2">Working days</td>
                <td rowspan="2">Working hours</td>
                <td rowspan="2">Absent with P</td>
                <td rowspan="2">Absent without P</td>
                <td rowspan="2">Salary/Hour</td>
                <td rowspan="2">Salary paid for Working Hours</td>
                <td rowspan="2">Bonus</td>
                <td rowspan="2">% gross</td>
                <td rowspan="2">Total salary</td>
            </tr>
            <tr>               
                <c:forEach var="d" begin="01" end="31" step="1">
                    <td>In</td>
                    <td>Out</td>
                </c:forEach>  
            </tr>
            <c:forEach items="${requestScope.employees}" var="e">
                <tr>
                    <td>${e.id}</td>
                    <td>${e.name}</td>
                    <td>${e.position}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    ${t.checkin}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    ${t.checkout}
                                </c:if>
                            </c:forEach>
                        </td>                        
                    </c:forEach>
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
        
    </body>
</html>
