<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#pagingDiv{
	/* border: 1px solid red;  */
	width: 700px;
	text-align: center;
	margin-top: 10px;
	
}

#currentPaging{
	border: 1px solid blue;
	padding: 7px;
	margin:2px;
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging{
	/* border: 1px solid blue; */
	cursor: pointer;
	margin:2px;
	padding: 5px 10px;
}

input{
	/* position: absolute;  */
	float : left; 
	left : 10px; 
}

/*아래 순서대로 안하면 에러  */
a.subjectA:link{color: black; text-decoration :none;}
a.subjectA:visited{color: black; text-decoration :none;}
a.subjectA:hover{color: green; text-decoration:underline;}
a.subjectA:active {color: black; text-decoration :none;}

/* a.subjectA:hover {
	color: green;
} */
</style>

<title>boardList</title>
</head>
<body>

<c:if test=${requestScope.list != null}>
	<table border="1" width="700px" cellpadding="5" frame="hsides" rules="rows">

	
		<tr height="50px" > <!-- 제목 -->
			<th >글번호</th>	<!-- 가운데 정렬, 굵게 -->	
			<th width="300px">제목</th>	<!-- 가운데 정렬, 굵게 -->	
			<th >작성자</th>	<!-- 가운데 정렬, 굵게 -->	
			<th >조회수</th>	<!-- 가운데 정렬, 굵게 -->	
			<th >작성일</th>	<!-- 가운데 정렬, 굵게 -->	
		</tr >
		
	
	<c:forEacn var="boardDTO" items="${list}">
		<tr height="50px"> 
			<td align="center">${boardDTO.seq}</td>	<!-- 가운데 정렬, 굵게 -->	
			<td style="padding:10px">
				<a class="subjectA"  onclick="isLogin('${id }', ${boardDTO.seq}, ${pg })">${boardDTO.subject}</a>
													<!-- 밖에 "" 이 있으닌까 ''를 친거고, id의 값이 문자열이닌까 ''를 표시, getSeq는 숫자이므로 ''안해도 됩니다.  -->
			</td>	<!-- 가운데 정렬, 굵게 -->	
			<td align="center">${boardDTO.id}</td>	<!-- 가운데 정렬, 굵게 -->	
			<td align="center">${boardDTO.hit}</td>	<!-- 가운데 정렬, 굵게 -->	
			<td align="center"><fmt:formatDate value="${boardDTO.logtime}" pattern="yyyy.MM.dd"/></td>
				
			
		</tr >		

		</c:forEacn>
		
		</table>
		
		
		<div id="pagingDiv" ><input type="button" value="메인화면" onclick="location.href='../index.jsp'">${boardPaging.pagintHTML}</div>
		<!-- boardPaging 에 만든 pagingHTML 을 lombok 을 써서 만들었으므로
		getPagingHTML() 으로 데이터를 담아온다.-->

</c:if>

 
 <script type="text/javascript">
 function boardPaging(pg){
	 location.href = "boardList.do?pg=" + pg;
	 
 }
 
 function isLogin(id, seq, pg) {
<%-- 	var id = '<%=(String)session.getAttribute("memId")%>';  --%>

	 
	 if(id == "null"){	alert("먼저 로그인하세요")	} 	
	 /* else { 
		location.href = "boardView.jsp?seq="+seq+"&pg="+pg;	 */	
 	}
 }
 </script>
</body>
</html>