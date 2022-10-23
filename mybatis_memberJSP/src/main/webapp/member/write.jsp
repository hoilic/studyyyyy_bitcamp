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
<%		request.setCharacterEncoding("UTF-8"); //post방식  // 데이터를 얻어서 읽고
		//데이터
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		//데이터를 DTO 에 저장
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setGender(gender);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setZipcode(zipcode);
		memberDTO.setAddr1(addr1);
		memberDTO.setAddr2(addr2);
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		int su = memberDAO.memberWrite(memberDTO); //memberWrite 로 가기
		
		
		//응답
/* 		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); //생성 */
		%>
		<%
		if(su == 1){%>
			<h3>회원가입 성공 </h3>
		<%}else{%>
			<h3>회원가입 실패</h3>
		<%}%>
		
<script type="text/javascript"> 
window.onload = function(){
	alert("회원가입 성공");
	location.href = "loginForm.jsp";
}	

</body>
</html>