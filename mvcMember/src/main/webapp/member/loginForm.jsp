<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	color :blue;
	font-size: 10pt;	
	font-weight: bold;	
}
</style>
</head>
<body>


<h3>로그인</h3> <br>
<form name="loginForm" method="post" action="/mvcMember/member/login.do">
<table border="1" width="400px" cellpadding="1" cellspacing="0">

		<tr> <!-- 아이디 -->
			<th> 아이디 </th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="text" name="id" id="id" size="30" placeholder="아이디 입력" >
					<div id="idDiv"></div>		
			 </td>
		</tr >
		
		<tr> <!-- 비밀번호 -->
			<th> 비밀번호 </th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
					 <!--  label 태그의 for="" 와 input 태그의 id="" 같아야 한다. -->				
					<input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력" >
					<div id="pwdDiv"></div>		
			 </td>
		</tr >
		
		<tr>
			<th colspan="2"> 
			<input type="button" value ="로그인"  onclick="checkLogin()">
			<input type="button" value ="회원가입" onclick="location.href='writeForm.do'">
			</th> <!-- colspan 은 병합 -->
		</tr>
		

</table>
</form>

<script type="text/javascript">
function checkLogin(){
	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	
	if(document.loginForm.id.value == ""){
		document.getElementById("idDiv").innerText="아이디를 입력하세요";
		document.loginForm.id.focus();
		
	}else if(document.getElementById("pwd").value == ""){
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
		document.loginForm.pwd.focus();
	
	}else{
		document.loginForm.submit();
		//submit 을 하면 톰캣에 저장하면서 액션의 위치로 이동한다!
	}

}
</script>


</body>
</html>