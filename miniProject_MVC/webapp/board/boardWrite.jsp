<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
window.onload=function(){
	alert("작성하신 글을 저장하였습니다.");
	location.href = "boardList.do?pg=1"; //pg(데이터의 한 종류) 를 주소에 실려서 보내는거는 get 방식이다
	
}
</script>


</body>
</html>