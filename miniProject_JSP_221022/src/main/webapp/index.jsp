<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//String name = request.getParameter("name"); // "name" 은 호출하는 "~~~~?변수=값" 변수와 같아야 한다.
String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

// 부모 = 자식
// 자식 = (자식)부모

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>


<h3>  메인화면  </h3>
<hr>

<h5>
<% 
	if(id == null){%>
		
		<a href="http://localhost:8080/miniProject_JSP_221022/member/writeForm.jsp"> 회원가입</a> <br>
		<a href="http://localhost:8080/miniProject_JSP_221022/member/loginForm.jsp"> 로그인</a> <br>
		<a href=""> 목록</a> <br>

<% } 

	 else { %> 
		<a href="http://localhost:8080/miniProject_JSP_221022/board/boardWriteForm.jsp"> 글쓰기</a> <br>
		<a href="http://localhost:8080/miniProject_JSP_221022/member/logout.jsp"> 로그아웃</a> <br>
		<a href=""> 목록</a> <br>
		
	<% } %>


</h5>



</body>
</html>