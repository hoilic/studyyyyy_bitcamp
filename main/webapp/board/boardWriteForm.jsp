<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subject{
	width : 200px
}

#content{
	height : 150px;
	width : 200px;
}
div{
	color :red;
	font-size: 10pt;	
	font-weight: bold;	
}


</style>

</head>
<body>

<h3>글쓰기</h3> <br>
<form name="boardWriteForm" method="post" action="/mvcBoard_teacher/board/boardWrite.do">
<table border="1" cellpadding="5" cellspacing="1">

		<tr > <!-- 제목 -->
			<th width="70px">제목</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="subject" id="subject" style="width: 300px;" >
					<div id="subjectDiv"></div>		
			 </td>
		</tr >

	
		<tr> <!-- 내용 -->
			<th>내용</th>	<!-- 가운데 정렬, 굵게 -->	
			<td height="100px"> 
					
					<input  name="content" id="content" style="width: 300px;" >
					<div id="contentDiv"></div>		
			 </td>
		</tr >
		
		
		<tr> <!-- 버튼 -->
			<th colspan="2"> 
			<input type="button" value ="글쓰기"  onclick="boardWriteCheck()">
			<input type="reset" value ="다시작성">
		
			</th> <!-- colspan 은 병합 -->
		</tr>	
			

</body>
</html>

<script type="text/javascript">
function boardWriteCheck(){
	//getElementById 는 해당태그에 접근하여 하고 싶은 작업을 할때 쓰는 함수!
 	document.getElementById("subjectDiv").innerText = ""; //초기화
	document.getElementById("contentDiv").innerText = ""; //초기화를 하는 이유는 조건에 따라 기존에 입력된 값을 보내버리고 조건을 실행하려고 
	
	if(document.getElementById("subject").value == "")
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요";
	
	else if(document.getElementById("content").value == "")
		document.getElementById("contentDiv").innerText = "내용을 입력하세요";
	 else
	        document.boardWriteForm.submit(); 
}
</script>