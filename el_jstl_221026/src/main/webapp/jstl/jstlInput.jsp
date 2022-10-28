<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="jstlResult.jsp">
<!-- post 방식으로 보내면 한글이 깨져 나온다. 한글 인코딩 해야합니다. -->
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th  width="70px" > 이름 </th>			
			<td> <input type="text" name="name" id="name"  > </td>
		</tr>
				
		<tr>
			<th  width="70px" > 나이 </th>			
			<td> <input type="text" name="age" id="age" ></td>
		</tr>
		

		<tr>
			<th width="70px">색깔</th>	<!-- 가운데 정렬, 굵게 -->	
			<td> 
				<select name="color" id="color" style="width:100px">
				<optgroup label="색깔" >
					<option value="red">빨강</option>
					<option value="green">초록</option>
					<option value="blue">파랑</option>
					<option value="magenta">보라</option>
					<option value="cyan">하늘</option>
				</optgroup>
				</select>
			</td>
		</tr>
		
		<tr> <!-- 취미 -->
				<th> 취미 </th>							
					<td> 
		
					<label>독서</label>
					<input type="checkbox" name="hobby" value="독서" checked >
					<label>영화</label>
					<input type="checkbox" name="hobby" value="영화"  >
					<label>음악</label>
					<input type="checkbox" name="hobby" value="음악"  >
					<label>게임</label>
					<input type="checkbox" name="hobby" value="게임"  >
					<label>쇼핑</label>
					<input type="checkbox" name="hobby" value="쇼핑"  >
		
					</td>			
			</tr >
			
		<tr>
			<th colspan="2" > 
				<input type="submit" value ="SEND" >  			
				<input type="reset" value ="CANCEL">
			</th> 
		</tr>
		
	</table>

</form>

</body>
</html>