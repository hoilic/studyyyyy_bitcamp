<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("apple", "사과");

//페이지 이동
/* <jsp:forward page="forwardResult.jsp"></jsp:forward> 

RequestDispatcher dispatcher = request.getRequestDispatcher("상대번지");  */
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");
//RequestDispatcher 가 forward 방식이다.
dispatcher.forward(request, response); /* 제어권 넘기기 */ 


%>
