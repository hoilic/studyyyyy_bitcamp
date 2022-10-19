<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! 
//전역변수, 1번만 처리된다.
String name = "홍길동";
int age = 25;
%>   

<%
//스크립트릿, 요청시 마다 호출된다.
age++;  // age++ asfda 글자를 썻다 지우면 초기화 되는 기능이 있다.
%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Hello JSP!! <br>  -->
<%-- 안녕하세요 JSP!! <br> --%>
나의 이름은 <%= name %> 입니다. <br>

나의 이름은 <% out.print(name); %> 입니다. <br> <!-- 내장객체가 저장되어있어서 out 명령 가능  --> 

<!-- 내 나이는 <%= age %>살 입니다. <br>  --> <!-- html 주석은 변수값이 있으면 수행을 한다. 다만 웹에 출력이 안됨 -->
<%-- 내 나이는 <%= age %>살 입니다. <br> --%> <%-- jsp 주석은 소멸 됨 --%>

</body>
</html>