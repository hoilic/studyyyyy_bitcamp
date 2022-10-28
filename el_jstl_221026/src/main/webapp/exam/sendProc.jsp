<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setAttribute("apple", "사과");
					//키이름,   키값
//페이지 이동
response.sendRedirect("sendResult.jsp");
//받아오는거 없이 그냥 키이름만 돌아온다.
//sendRedirect "sendResult.jsp" 주소만 받아서 창을 열어준다.

%>a