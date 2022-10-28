<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="angel" uri="tld" %>
<!-- 커스텀 테그   밑에서 사용할 메소드의 (집합체) 이름을 "angel"이라고 prefix 즉, 이름을 지어준다. 
그리고 prefix의 메소드 uri주소에서 가져온다-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> 자바클래스의 메소드를 이용</h3>

${param['x'] } + ${param['y'] } = ${angel:sum(param['x'], param['y']) } <br>


</body>
</html>