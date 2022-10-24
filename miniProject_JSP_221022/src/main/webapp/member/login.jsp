<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<% 	
	//데이터
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");


	// DB연결 해서 SQL 실행한 결과 가져온것
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = memberDAO.memberLogin(id, pwd); 
	
	//그 결과 중에서 id, pwd, name 값만 가져온다. (세션에 필요한 값 이므로])



		%>
	 
	
<% 

if(memberDTO != null){
//		response.sendRedirect("loginOk.jsp?name="+ URLEncoder.encode(name, "UTF-8") );   // ?변수=값
		// sendRedirect 는 스프링 에서 direct 로 쓰인다.
		String email = memberDTO.getEmail1()+"@"+memberDTO.getEmail2();
		String id1 = memberDTO.getId();
		String name = memberDTO.getName();
		
	

		//세션
		//HttpSession session = request.getSession(); //세션 생성
		session.setAttribute("memName", name); // session 안에 "memName" 로 이름을 등록한다.
		session.setAttribute("memId", id1); // session 안에 "memName" 로 이름을 등록한다.
		session.setAttribute("memEmail", email); // session 안에 "memName" 로 이름을 등록한다.
		
		//페이지 이동
		response.sendRedirect("loginOk.jsp");
		
}else{
	response.sendRedirect("loginFail.jsp");
}%>

</body>
</html>