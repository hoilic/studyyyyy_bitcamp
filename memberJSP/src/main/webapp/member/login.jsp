<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 	
	//데이터
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	// DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	String name = memberDAO.memberLogin(id, pwd);
		
		//응답
/* 		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); //생성 */
		%>
	 
	
	<% if(name != null){%>
		<h3><%= name%> 로그인 했습니다.</h3>
	<%}else{%>
		<h3>아이디 또는 비밀번호가 틀렸습니다.</h3>
	
	<%}%>

</body>
</html>