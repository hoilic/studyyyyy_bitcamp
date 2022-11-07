<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">


</style>
<title>boardView</title>

<style type="text/css">
form[name="boardView"] div{
	color :black;
	font-size: 10pt;	
	font-weight: bold;	
}

</style>
</head>
<body>


<form name="boardView" id="boardView"  동적으로 action=""(속성) 추가하려고 한다.>
	<input type ="text" id="seq" name="seq" value="${seq}" />
	<input type =""text"" id="pg" name="pg" value="${pg}" />
	<input type =""text"" id="memId" value="${memId}" />
	
	<table border="1"  cellpadding="1" frame="hsides" rules="rows" width="500">

		<tr > <!-- 제목 -->
			<td colspan="3">
				<span  id="subjectSpan"></span>						
			 </td>
		</tr >
		
		<tr > 
			<td width="150">글번호 : <span id="seqSpan"></span></td>
			<td width="150">작성자 : <span id="nameSpan"></span></td>
			<td width="150">조회수 : <span id="hitSpan"></span></td>
			
		</tr >

	
		<tr> 
			<td colspan="3" height="250" valign="top"> 				
			<div style="width: 100%; height:300px; overflow:auto;">
				<pre style="white-space: pre-line; word-break: break-all;">
				<span id="contentSpan"></span>
				</pre>
			 </td>			
			
		</tr >				
	</table>
	
	<div style = "margin-top: 10px;">
		<input type="button"  value="목록" 
		onclick="location.href='/miniProject_MVC/board/boardList.do?pg=${pg}'" />
		
		<span id="boardViewSpan">
<!-- 			<input type="button" onclick="mode(1)" value="글수정"/>
			<input type="button" onclick="mode(2)" value="글삭제"/> -->
			
			<input type="button" onclick="mode(1)" value="글수정" id="boardUpdateBtn"/>
			<input type="button" onclick="mode(2)" value="글삭제" id="boardDeleteBtn"/>
			
		</span>
	</div>

</form>

<script type="text/javascript">
function mode(num){
	if(num == 1){ //글수정 - seq, pg
		document.boardView.method = "get";
		document.boardView.action = "/miniProject_MVC/board/boardUpdateForm.do";
		document.boardView.submit();
	
		
	}else if(num ==2){ //글삭제 - seq
		if(confirm("정말로 삭제하시겠습니까?")){
			
		document.boardView.method = "post";
		document.boardView.action = "/miniProject_MVC/board/boardDelete.do";
		document.boardView.submit();
	
		}//if
	}//elsei= if
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script> <!-- CDN방식 -->
<script type="text/javascript"> 
//$(function(){}); 1번방식
$(document).ready(function(){
	$.ajax({
		url: '/miniProject_MVC/board/getBoard.do',
		type: 'post',
		data: 'seq=' + $('#seq').val(),
		dataType: 'json', /* text, html, json, xml */
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#nameSpan').text(data.id);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			if($('#memId').val() == data.id){
				$('#boardViewSpan').show()
			}else{
				$('#boardViewSpan').hide()				
			}
	
		},
		error: function(err){
			console.log(err)
		}
	});
	
});

//글수정
$('#boardUpdateBtn').click(function(){
	$('#boardView').attr('action', '/miniProject_MVC/board/boardUpdateForm.do');
	$('#boardView').submit();
});

//글삭제
$('#boardDeleteBtn').click(function(){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url:'/miniProject_MVC/board/boardDelete.do',
			type:'post',
			data:'seq='+$('#seq').val(),
			success:function(){
				alert("글삭제 완료");
				location.href = '/miniProject_MVC/board/boardList.do?pg=1';
			},
			error: function(err){
			 	console.log(err)
			}
		});//$.ajax
	}
});


</script>
</body>
</html>
