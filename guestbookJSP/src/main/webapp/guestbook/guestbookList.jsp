<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
 
 
 

 <% 
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

 //페이징 처리 - 1페이지당 3개씩
int endNum = pg*3;
int startNum = endNum-2;
 
 
 //DB 
 request.setCharacterEncoding("UTF-8"); //post방식

GuestbookDAO guestbookDAO = GuestbookDAO.getInstance(); //싱글톤

Map<String, Integer> map = new HashMap<String, Integer>();
map.put("startNum", startNum);
map.put("endNum", endNum);

ArrayList<GuestbookDTO> guestList = guestbookDAO.GuestList(map);
	/*ArrayList에 담아와라  */ 
	
	
//총글수
int totalA = guestbookDAO.getTotalA();
int totalPage =(totalA + 2)/3; 
	
	%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style type="text/css">

#content{
	white-space : pre-wrap;
}

#currentPaging{
	color : red;
	text-decoration : underline;
	font-size : 15pt;
}

#paging{
	olor : black;
	text-decoration : none;
	font-size : 15pt;
}
}
th{
	width:150px
}
</style>
</head>
<body>

<% if(guestList != null){%>

		<% for(GuestbookDTO guestbookDTO : guestList){%>
		<table border="1" width="600px" cellpadding="1" cellspacing="0">
		<tr> 
			<th>작성자</th>	
			<th> <%= guestbookDTO.getName() %></th>
			<th>작성일</th>	
			<th><%= guestbookDTO.getLogtime() %></th>
		</tr >
		
		<tr> 
			<th>이메일</th>		
			<td colspan="3"><%= guestbookDTO.getEmail() %></td>		
		</tr >
		
		<tr> 
			<th>홈페이지</th>		
			<td colspan="3"><%= guestbookDTO.getHomepage() %></td>
			
		</tr >
		
		<tr> 
			<th>제목</th>		
			<td colspan="3"><%= guestbookDTO.getSubject() %></td>
			
		</tr >
		
		<tr> 
			<td style="height : 150px" colspan="4" id="content"><%= guestbookDTO.getContent() %></td>	
	
		</tr >
		</table>

		<%}%>
<%}%>

<!-- 페이지 번호 -->


<% for(int i=1; i<totalPage; i++){ %>
	
	<%if( i== pg) { %>
		
		<a id = "currentPaging" href="guestbookList.jsp?pg=<%=i %>"><%= i  %></a>
		
	<%} else {%>
		<a id= "paging" href="guestbookList.jsp?pg=<%=i %>"><%= i  %></a>
<% }%>
<% }%>
</body>
</html>

