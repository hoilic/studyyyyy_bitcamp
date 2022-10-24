<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%		request.setCharacterEncoding("UTF-8"); //post방식  // 데이터를 얻어서 읽고
		//데이터
		
		//getParameter 는 post 방식으로 데이터를 가져온다. Post 방식은 return 값이 다 String 이다.
		String subject = request.getParameter("subject"); // getParameter 는 return 을 String 으로 해준다.
		String content = request.getParameter("content");
		
		String name = (String)session.getAttribute("memName"); // getAttribute 는 return 을 Object 로 해준다. 그래서 강제 형변환 해야한다.
		String id = (String)session.getAttribute("memId");
		String email = (String)session.getAttribute("memEmail");
		
		
		//데이터를 DTO 에 새롭게 넣어주려고 저장
		BoardDTO boardDTO = new BoardDTO();
		
		//set 으로 값을 넣어주는 작업 시작
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		boardDTO.setName(name);
		boardDTO.setEmail(email);
		boardDTO.setId(id);

		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.boardWrite(boardDTO); 
		
		if(su == 1){%>
			<h3>작성하신 글을 저장하였습니다.</h3>
		<%}else{ %>
			<h3>작성하세요!!!</h3>
		<%} %>


</body>
</html>