<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
session.removeAttribute("memName");
//session.invalidate(); - 무효화, 모든 세션 없애기
session.removeAttribute("memId");
session.removeAttribute("memEmail");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그아웃
</body>
</html>