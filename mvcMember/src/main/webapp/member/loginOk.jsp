<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>${sessionScope.memName }님 로그인 성공했습니다. </h3>
<br>

<input type="button" value="로그아웃" onclick="location.href='/mvcMember/member/logout.do'">

</body>
</html>