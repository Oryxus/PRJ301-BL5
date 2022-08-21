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
        <h2 style="color: darkviolet;text-align: center;font-family: sans-serif">BẢNG CHẤM CÔNG THÁNG 8</h2>       
        <table border="1px" style="font-family: cursive">
            <tr>
                <td rowspan="2" style="background-color: bisque;">ID</td>
                <td rowspan="2" style="background-color: whitesmoke;">Name</td>
                <td rowspan="2" style="background-color: cyan;">Position</td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td colspan="2" style="background-color: yellow;"><fmt:formatDate pattern = "dd" 
                                    value = "${d}" /></td>
                    </c:forEach>                
            </tr>
            <tr>               
                <c:forEach var="d" begin="01" end="31" step="1">
                    <td style="background-color: aquamarine;">In</td>
                    <td style="background-color: lightpink;">Out</td>
                </c:forEach>  
            </tr>
            <c:forEach items="${requestScope.employees}" var="e">
                <tr>
                    <td style="background-color: bisque;">${e.id}</td>
                    <td style="background-color: whitesmoke;">${e.name}</td>
                    <td style="background-color: cyan;">${e.position}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    style="background-color: aquamarine;"
                                </c:if>
                            </c:forEach>>
                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    ${t.checkin}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    style="background-color: lightpink;"
                                </c:if>
                            </c:forEach>>
                            <c:forEach items="${e.timesheets}" var="t">
                                <c:if test="${t.cidate eq d}">
                                    ${t.checkout}
                                </c:if>
                            </c:forEach>
                        </td>                        
                    </c:forEach>

                </tr>              
            </c:forEach>

        </table>
        <br/>
        <div>
            <a href="salary"><button style="background-color: azure;font-size: 20px;font-family: monospace;margin-left: 4%">Tính lương</button></a>
            <a href="absence"><button style="background-color: azure;font-size: 20px;font-family: monospace;margin-left: 4%">Chi tiết nghỉ</button></a>
        </div>
    </body>
</html>
