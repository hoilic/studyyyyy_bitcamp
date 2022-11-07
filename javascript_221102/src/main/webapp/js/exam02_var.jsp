<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
var a = 100 // 세미콜론 ; 찍어도 그만 안찍어도 그만
a = 250
console.log(a)//250
{	var a = 200
	console.log(a)//200
	{
		var a = 300
		console.log(a)//300
		{
			var a = 400
			console.log(a)//400			
		}
		console.log(a)//400
	}
	console.log(a)//400
}
console.log(a)//400
</script>

</body>
</html>

<!-- var 은 전역변수의 성질 -->