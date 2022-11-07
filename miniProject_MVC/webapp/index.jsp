<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
html, body{
	width: 100%;
	height: 100%;
}
body {
   margin: 0;
   padding: 0;
   height: 100%;
   width: auto;
}

#wrap{
	 width: 1100px;
	 margin: 0 auto;
}
#header {
  
   height: 10%;
   text-align: center;
}

#container {
   margin: auto;
   width: 100%;
   height: 500px;
}

#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}

#nav {
   margin-left: 10px;
   /* width: 400px; */
   width: 25%;
   height: 100%;
   float: left;
}

#section {
   width: 100%;
   height: 100%;

 /*   float: left; */
    
}

#footer {
   width: 1700px;
   height: 10%;
}
</style>
<title>메인화면</title>
</head>
<body>
<div id="wrap">
<div id="header">
	<h1>
		<img src="/miniProject_MVC//img/우디.png" style="cursor:pointer;" 
		width="100" height="100" alt="토이스토리" onclick="location.href='/miniProject_MVC/index.jsp'"> MVC를 이용한 미니 프로젝트
	</h1>
	<jsp:include page="./main/menu.jsp"></jsp:include>
</div>


<div id="container">
	<div id="nav">
		<jsp:include page="./main/nav.jsp"></jsp:include> 
	</div>
	
	<div id="section">
		<c:if test="${ empty display }">
			<h1>
				홈페이지를 방문해주셔서 감사합니다.<br>
				Have a nice day!!<br>
				<img src="./img/Toy-Story.gif">
			</h1>
		</c:if>		
		
		<c:if test="${not empty display}">
			<jsp:include page="${display}"/>
		</c:if>
	</div>
	
</div>


<div id="footer">
</div>
</div> <!-- wrap -->



</body>
</html>