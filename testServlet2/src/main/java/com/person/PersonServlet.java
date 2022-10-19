package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	@Override
	
    public void init() throws ServletException {}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//데이터
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		// 지금부터 입력하는 모든 글짜를 html 로 받아들여라!
		PrintWriter out = response.getWriter(); //생성
		
		out.println("<html>");
		out.println("<head>");
		
		out.println("<style>");
		out.println("li{color : " + color+"}");
		out.println("</style>");
		
		out.println("</head>");
		
		out.println("<body>");
		out.println("<ul>");		
		
		out.println("<li> 이름 : " + name + "</li><br>");
		out.println("<li> 성별 : " + gender + "</li><br>");
		out.println("<li> 색깔 : " + color + "</li><br>");
		out.println("<li> 취미 : " ); 
		for(int i=0; i<hobby.length; i++) {
			out.print(hobby[i] + "&nbsp;"); }
		out.println("</li><br>");
		out.println("<li> 과목 :" ); 
		for(String data: subject) {
			out.print(data + "&emsp;"); }
		out.println("</li><br>");

		out.println("</ul>");		
		out.println("</body>");
		out.println("</html>");
		
	}

	@Override
	public void destroy() {
		
	}

}
