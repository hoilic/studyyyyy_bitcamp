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
form[name="boardWriteForm"] div{
	color :red;
	font-size: 10pt;	
	font-weight: bold;	
	
}


</style>

</head>
<body>

<h3>글쓰기</h3> <br>
<form name="boardWriteForm" id="boardWriteForm" >
<table border="1" width="500px" cellpadding="5" cellspacing="1">

		<tr > <!-- 제목 -->
			<th width="70px">제목</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="subject" id="subject" style="width: 400px;" >
					
					<div id="subjectDiv"></div>		
			 </td>
		</tr >

	
		<tr> <!-- 내용 -->
			<th>내용</th>	<!-- 가운데 정렬, 굵게 -->	
			<td height="200px" valign="top"> 					
				<input  type="text" name="content" id="content" style="width: 400px; height: 200px; overflow:auto;" >
				<div id="contentDiv" ></div>	
			 </td>
		</tr >
		
		
		<tr> <!-- 버튼 -->
			<th colspan="2"> 				
				<button type="button" id="boardBtn" >글쓰기</button>
				<button type="reset">다시작성</button>		
			</th> <!-- colspan 은 병합 -->
		</tr>	
			
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script> <!-- CDN방식 -->
<script type="text/javascript">
$('#boardBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() == ''){
		$('#subjectDiv').text('제목을 입력하세요');
		$('#subject').focus();
	}else if($('#content').val() == ''){
		$('#contentDiv').text('내용을 입력하세요');
		$('#content').focus();
	
	}else{
		$.ajax({
			url: 'http://localhost:8080/miniProject_MVC/board/boardWrite.do',
			type: 'post',
/* 			data: $('#boardWriteForm').serialize(),
			data: 'subject=' + $('#subject').val() + "&content="+ $('#content').val(), */
			data: {
				'subject': $('#subject').val(),
				'content': $('#content').val()
			},
			success: function(){
				alert("글쓰기 성공");
				location.href = '/miniProject_MVC/board/boardList.do?pg=1'
			},
			error: function(err){
				console.log(err)
			}				
		});//ajax					
	}//else	
});//function
</script>

</body>
</html>
