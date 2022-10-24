<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//String name = request.getParameter("name"); // "name" 은 호출하는 "~~~~?변수=값" 변수와 같아야 한다.

String name = (String)session.getAttribute("memName");

// 부모 = 자식
// 자식 = (자식)부모

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3><%=name %>님 로그인 성공했습니다. </h3>
<br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">

</body>
</html>