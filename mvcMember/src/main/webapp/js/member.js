function checkWrite(){
	document.getElementById("nameDiv").innerText = ""; //초기화
	document.getElementById("idDiv").innerText = ""; //초기화
	document.getElementById("pwdDiv").innerText = ""; //초기화

	
	if(document.getElementById("name").value == "")
		document.getElementById("nameDiv").innerText="이름을 입력하세요";
	
	else if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText="아이디를 입력하세요";
	
	else if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
	
	else if(document.getElementById("pwd").value != document.getElementById("rpwd").value)
		document.getElementById("pwdDiv").innerText="비밀번호가 맞지 않습니다.";
		
	else if( document.writeForm.id.value != document.writeForm.check.value)
		document.getElementById("idDiv").innerText="아이디 중복체크 하세요";
		
	else
		document.writeForm.submit();
}	
       
      

function change(){
	document.writeForm.email2.value = document.writeForm.email3.value;
}

function checkId(){
	var sId = document.getElementById("id").value;
	
		if(sId == "")
//			document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
			document.getElementById("idDiv").innerHTML = "<font color ='magenta'>먼저 아이디를 입력하세요</font>";
		else 
			window.open("/mvcMember/member/checkId.do?id=" + sId , "chcekId","width=500 height=300 left=500 top=100");	
			// chekId.jsp 는 새로 생기는 중복체크 팝업 창 이다.			
}


