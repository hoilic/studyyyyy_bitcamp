<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>** include directive **</h3>
<%@ include file="today.jsp" %>
<br>

<h3>** include JSP tag **</h3>
<jsp:include page="image.jsp" ></jsp:include>
<br>
<% String name="홍길동"; %>
main.jsp의 name = <%=name %>
</body>
</html>