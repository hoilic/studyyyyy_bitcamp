<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
String apple = (String)request.getAttribute("apple");
//Object 로 꺼내오닌까 String 로 형변환
%>

결과 = <%= apple %>