<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8"); //post방식

	
	//5개의 데이터를 끌고오자~!
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	GuestbookDTO guestbookDTO = new GuestbookDTO();
	
	guestbookDTO.setName(name);
	guestbookDTO.setEmail(email);
	guestbookDTO.setHomepage(homepage);
	guestbookDTO.setSubject(subject);
	guestbookDTO.setContent(content);
	
	//DB
	GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
	//같은 주소의 값이 계속 들어오도록
/* 	int su = GuestbookDAO.getInstance().guestWrite(guestbookDTO);
	
	if(su == 1) out.print("작성하신 글을 저장하였습니다."); */
	guestbookDAO.guestWrite(guestbookDTO);
	%>
	<br>
	<img src="../img/이모티콘.jfif" width="70", height="70" 
		onclick="location.href='../guestbook/guestbookList.jsp'"
		style="cursor : pointer">
	<br>
	<th>
	<input type="button" value ="글목록" onclick="location.href='../guestbook/guestbookList.jsp?pg=1'">
	<br>
	<input type="button" value ="뒤로" onclick="location.href='../guestbook/guestbookWriteForm.jsp'">
	</th>
	


</body>
</html>