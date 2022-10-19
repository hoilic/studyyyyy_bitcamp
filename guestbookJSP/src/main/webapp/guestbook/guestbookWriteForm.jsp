<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteForm</title>
<style type="text/css">

#name{
	width : 200px
}

#email{
	width : 300px
}

#homepage{
	width : 400px
}

#subject{
	width : 500px
}

#content{
	height : 150px;
 	width : 500px;
}

div{
	color :red;
	font-size: 10pt;	
	font-weight: bold;	
}
</style>
</head>
<body>

<h1>글쓰기</h1> <br>
<form name="guestbookWriteForm" method="post" action="guestbookWrite.jsp">
<table border="1" width="600px" cellpadding="1" cellspacing="0">

		<tr> <!-- 작성자 -->
			<th>작성자</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="name" id="name" placeholder="작성자 입력" >
					<div id="nameDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 이메일 -->
			<th>이메일</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="email" id="email" placeholder="이메일 입력" >
					<div id="emailDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 홈페이지 -->
			<th>홈페이지</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="homepage" id="homepage" value="http://" >
					<div id="homepageDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 제목 -->
			<th>제목</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="subject" id="subject" placeholder="제목 입력" >
					<div id="subjectDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 내용 -->
			<th>내용</th>	<!-- 가운데 정렬, 굵게 -->	
			<td height="100px"> 
					
					<textarea rows="5" cols="40"  name="content" id="content" placeholder="내용 입력" ></textarea>
					<div id="contentDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 버튼 -->
			<th colspan="2"> 
			<input type="button" value ="글작성"  onclick="checkguestbookWrite()">
			<input type="reset" value ="다시작성">
			<input type="button" value ="글목록" onclick="location.href='../guestbook/guestbookList.jsp?pg=1'">
			</th> <!-- colspan 은 병합 -->
		</tr>	
			

</table>
</form>

<script type="text/javascript">
function checkguestbookWrite(){
	document.getElementById("subjectDiv").innerText = ""; //초기화
	document.getElementById("contentDiv").innerText = ""; //초기화
	
	if(document.getElementById("subject").value == "")
		document.getElementById("subjectDiv").innerText = "제목을 입력하세요";
	
	else if(document.getElementById("content").value == "")
		document.getElementById("contentDiv").innerText = "내용을 입력하세요";
	 else
	        document.guestbookWriteForm.submit(); 
}
</script>

</body>
</html>