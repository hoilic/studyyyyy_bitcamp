<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="member.dao.MemberDAO"%>

<%		
//데이터
String id = request.getParameter("id"); //post방식

//DB
MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤
boolean exist = memberDAO.isExistId(id); //아이디가 있으면 true - 사용 불가능, 없으면 false- 사용 가능

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="" action="checkId.jsp"> <!-- 재귀적 -->
<%if(exist) {%>
	<h3><%= id %> 는 사용 불가능 </h3>
	<br>
	<input type="text" name="id">
	<input type="submit" value="중복체크">
	<%}else{ %>
	<h3><%= id %> 는 사용 가능 </h3>
	<input type="button" value="사용하기" onclick="checkIdClose('<%= id %>')">
<%}%>

</form>

<script type="text/javascript"> 
function checkIdClose(id){
	opener.writeForm.check.value = 1;
	opener.writeForm.id.value = id;
	opener.writeForm.pwd.focus();
	window.close();
	
}
</script>
</body>
</html>