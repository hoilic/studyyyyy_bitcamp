<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form[name="updateForm2"] div{
	color :blue;
	font-size: 10pt;	
	font-weight: bold;	
}
.address{
	width:450px
}
</style>
</head>
<body>


<h1>회원정보수정</h1> <br>
<form name="updateForm2" id="updateForm2">
<table border="1" width="600px" cellpadding="1" cellspacing="0">

		<tr> <!-- 이름 -->
			<th><label for="name_id"> 이름 </label></th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
				<input type="text" name="name" id="name" value="">
				<div id="nameDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 아이디 -->
			<th><label for="user_id"> 아이디</label></th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
				<!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->
				<input type="text"  name="id" id="id" size="30" value=""  readonly>	
			
				<!-- 아이디 중복 체크 여부 -->
				<input type="text" name="check" id="check">
				
				<div id="idDiv"></div>	
			</td>
		</tr>
		
		<tr> <!-- 비밀번호 -->
			<th><label for="pwd_id"> 비밀번호</label></th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
				<!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->
				<input type="password" name="pwd" id="pwd" size="40" value="" />	
				<div id="pwdDiv"></div>	
			</td>
		</tr>
		
		<tr> <!-- 재확인 -->
			<th><label for="rpwd_id" >재확인</label></th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
				 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->
				<input type="password" name="rpwd" id="rpwd" value=""  />		
				<div id="rpwdDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>성별</th>	<!-- 가운데 정렬, 굵게 -->
			<td> 
				<input type="radio" name="gender" id="gender_m"  value="" /> 
				<label for="gender_m">남자</label>
				<input type="radio" name="gender" id="gender_f" value="" /> 
				<label for="gender_f">여자</label>
			</td>
		</tr>
		
		<tr>
			<th><label for="email1_id" >이메일</label></th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 		
				<input type="text" name="email1" id="email1" value="" >
				@
				<input type="text" name="email2"  id="email2"value="">
					<select name="email3" onchange="change()">
					  <option value="">직접 입력</option>
					  <option value="gmail.com">gmail.com</option>
					  <option value="naver.com">naver.com</option>
					  <option value="daum.net">daum.net</option>					  
					</select>					
		    </td>
		</tr>
		
		<tr>
			<th>핸드폰</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
				
				<select name="tel1" id="tel1" style="width:60px">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="019">019</option>
				</select> - <input  type="text" name="tel2" id="tel2"style="width:50px"> 
				- 
				<input type="text" name="tel3" id="tel3" style="width:50px">
				
			</td>
		</tr>
		
		<tr>
			<th>주소</th>	<!-- 가운데 정렬, 굵게 -->	
				<td> 
					<input type="text" name="zipcode" id="zipcode" readonly/>
					<input type="button" value ="우편번호검색" onclick="checkPost()">
					<br>
					<input class="address" type="text" name="addr1"  id="addr1" placeholder="주소" readonly />	
					<br>
					<input class="address" type="text" name="addr2"  id="addr2" placeholder="상세주소"  />						
				</td>
		</tr>

		<tr>
			<th colspan="2"> 
				<button type="button" id="updateBtn" >업데이트</button>
				<button type="reset">다시작성</button>
			</th> <!-- colspan 은 병합 -->
		</tr>	

</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script> <!-- CDN방식 -->
<script type="text/javascript"> 
//window.onload=function(){} // window.onload=function(){} = $(function(){});

$(function(){
	$.ajax({
		url: '/miniProject_MVC/member/getMember.do',
		type: 'post',
		dataType: 'json', /* text, html, json, xml */
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#name').val(data.name);
			$('#id').val(data.id);
			$('#pwd').val(data.pwd);
			$('input[name="gender"]:eq(' + data.gender + ')').attr("checked", true);
			$('#email1').val(data.email1);
			$('#email2').val(data.email2);
			$('#tel1').val(data.tel1);
			$('#tel2').val(data.tel2);
			$('#tel3').val(data.tel3);
			$('#zipcode').val(data.zipcode);
			$('#addr1').val(data.addr1);
			$('#addr2').val(data.addr2);
		},
		error: function(err) {
			console.log(err);
			
		}
	});
	
});

//회원정보수정
$('#updateBtn').click(function(){
	$('#nameDiv').empty();
	$('#pwdDiv').empty();
	
	if($('#name').val() == ''){
		$('#nameDiv').text('이름을 입력하세요');
		$('#name').focus();
	}else if ($('#pwd').val() == ''){
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwdDiv').focus();
	}else if ($('#pwd').val() != $('#rpwd').val()){
		$('#pwdDiv').text('비밀번호가 맞지 않습니다.');
		$('#pwdDiv').focus();
	}else{
		$.ajax({
			url: 'http://localhost:8080/miniProject_MVC/member/update.do',
			type: 'post',
			data: $('#updateForm').serialize(),
			success: function(){
				alert("업데이트 성공");
				location.href = "/miniProject_MVC/index.jsp";
			},
			error: function(err){
				console.log(err);
			}
				
		});//ajax
		
			
	}//else
		
});	//function

</script>

<!-- 우편번호 --> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/post.js"></script>



</body>
</html>