function checkWrite(){
	document.getElementById("nameDiv").innerText = ""; //초기화
	document.getElementById("idDiv").innerText = ""; //초기화
	document.getElementById("pwdDiv").innerText = ""; //초기화
	document.getElementById("rpwdDiv").innerText = ""; //초기화
	
	
	if(document.getElementById("name_id").value == "")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	
	else if(document.getElementById("user_id").value == "")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	
	else if(document.getElementById("pwd_id").value == "")
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";
	
	else if(document.getElementById("rpwd_id").value != document.getElementById("pwd_id").value)
		document.getElementById("rpwdDiv").innerText = "비밀번호 맞지 않습니다";
   	else if(document.writeForm.checkid.value != document.writeForm.check.value)
		 document.getElementById("idDiv").innerText = "아이디를 중복체크 하세요";    
    else
   	 	document.writeForm.submit(); 	 
}		
       
      

function change(){
	document.writeForm.email2.value = document.writeForm.email3.value;
}

function checkId(){
	var sId = document.getElementById("user_id").value;
	
		if(sId == "")
//			document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
			document.getElementById("idDiv").innerHTML = "<font color ='magenta'>먼저 아이디를 입력하세요</font>";
		else 
			window.open("checkId.jsp?id=" + sId , "chcekId","width=500 height=300 left=500 top=100");	
			// chekId.jsp 는 새로 생기는 중복체크 팝업 창 이다.
			
}

function inputIdChk(){
	var writeForm = document.writeForm;
	var checkid = document.writeForm.checkId;
	
	document.writeForm.check.value=0;
	checkid.disabled = false;
	checkid.style.opacity = 1;
	checkid.style.cursor = "pointer";
	}
	

