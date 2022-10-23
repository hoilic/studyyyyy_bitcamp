<%@page import="java.net.URLEncoder"%>
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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	// DB
	MemberDAO memberDAO = MemberDAO.getInstance();
	String name = memberDAO.memberLogin(id, pwd);
		
		//응답
/* 		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); //생성 */
		%>
	 
	
<% 

if(name != null){
//		response.sendRedirect("loginOk.jsp?name="+ URLEncoder.encode(name, "UTF-8") );   // ?변수=값
		// sendRedirect 는 스프링 에서 direct 로 쓰인다.



		//세션
		//HttpSession session = request.getSession(); //세션 생성
		session.setAttribute("memName", name); // session 안에 "memName" 로 이름을 등록한다.
		
		//페이지 이동
		response.sendRedirect("loginOk.jsp");
		
}else{
	response.sendRedirect("loginFail.jsp");
}%>

</body>
</html>