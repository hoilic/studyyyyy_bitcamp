<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1"  cellpadding="0" cellspacing="0" >
<%for(int i=1; i<=9; i++) {%>

<tr>
	<%for (int dan= 2; dan<=9; dan++) {%>
	
		<td>&emsp;<%= dan%> *<%=i%> = <%= dan*i%></td> 
		
	<%}%>
</tr>
	
<%}%>
</table>

</body>
</html>

<!-- 
int dan, i;
	
		
		for(dan= 2; dan<=9; dan++) { // i = 1~9
			for ( i=1; i<=9; i++) {
				System.out.println(dan + " * " + i + " = " + dan*i);
			} //for j
			
			System.out.println(); // 2단이 한바퀴 끝나고 줄 띄우기, 3단이 끝나고 줄 띄우기, ~~~
		}
			
	}



 -->