<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fmt:formatNumber type="number" value="123456789"></fmt:formatNumber><br>
<fmt:formatNumber type="number" value="123456789.88"></fmt:formatNumber><br>
<fmt:formatNumber type="number" value="123456789.88" maxFractionDigits="1"></fmt:formatNumber><br>
<br>

<fmt:formatNumber type="number" value="123456.78" pattern="#,###"></fmt:formatNumber><br>
<fmt:formatNumber type="number" value="123456.789" pattern=".##"></fmt:formatNumber><br>
<fmt:formatNumber type="number" value="123456.789" pattern="#,###.##"></fmt:formatNumber><br>
<br>

<fmt:formatNumber type="number" value="0000.00" pattern="#,###.##"></fmt:formatNumber><br>
<fmt:formatNumber type="number" value="0000.00" pattern="0,000.00"></fmt:formatNumber><br> <!-- 강제로 0을 표시 -->
<fmt:formatNumber type="number" value="12.3" pattern="000.00"></fmt:formatNumber><br>
<br>

<c:set var="now" value="<%= new java.util.Date() %>" />
<c:out value="${now }"/><br>
data: <fmt:formatDate value="${now}" type="date"/><br>
time: <fmt:formatDate value="${now}" type="time"/><br>
both: <fmt:formatDate value="${now}" type="both"/><br>
<br>

<fmt:formatDate value="${now}" pattern="yy-MM-dd hh:mm" type="both"/><br>
<fmt:formatDate value="${now}" pattern="yy-MM-dd" type="date"/><br>
<fmt:formatDate value="${now}" pattern="yy-MM-dd E요일 a" type="date"/><br>
<fmt:formatDate value="${now}" pattern="HH:mm:ss" type="time"/><br>


</body>
</html>