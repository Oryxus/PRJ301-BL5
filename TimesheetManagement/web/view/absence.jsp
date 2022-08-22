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
        <h2 style="color: darkviolet;text-align: left;font-family: sans-serif">BẢNG THỐNG KÊ NGHỈ THÁNG 8</h2>
        <table border="1px" style="font-family: cursive;left: 50%">
            <tr style="background-color: khaki;">
                <td>ID</td>
                <td>Name</td>
                <td>Position</td>               
                <td>Absent date</td>
                <td>Absent shift</td>
                <td>Reason</td>                
            </tr>          
            <c:forEach items="${requestScope.absences}" var="a">
                <tr style="background-color: beige;">
                    <td <c:if test="${a.reason eq 'NP'}">
                            style="background-color: coral;"
                        </c:if>>${a.getEmployee().getId()}</td>
                    <td <c:if test="${a.reason eq 'NP'}">
                            style="background-color: coral;"
                        </c:if>>${a.getEmployee().getName()}</td>
                    <td <c:if test="${a.reason eq 'NP'}">
                            style="background-color: coral;"
                        </c:if>>${a.getEmployee().getPosition()}</td>                    
                    <td <c:if test="${a.reason eq 'NP'}">
                            style="background-color: coral;"
                        </c:if>>${a.date}</td>
                    <td <c:if test="${a.reason eq 'NP'}">
                            style="background-color: coral;"
                        </c:if>>${a.sid}</td>
                    <td <c:if test="${a.reason eq 'NP'}">
                            style="background-color: coral;"
                        </c:if>>${a.reason}</td>                    
                </tr>              
            </c:forEach>
        </table>
                
        <h3>Abbreviations:</h3>
        <ol>
            <li>P : Permission granted</li>
            <li>NP : No permission</li>
            <li>WE: Weekend</li>
        </ol>
        <div>
            <a href="report"><button style="background-color: azure;font-size: 15px;font-family: monospace;margin-left: 3%">Bảng chấm công</button></a>
        </div>
    </body>
</html>
