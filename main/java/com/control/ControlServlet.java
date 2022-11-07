package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		urlPatterns = {"*.do"},
		initParams = { 
				@WebInitParam(name="propertyConfig", value="command.properties")}
		
		)
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		String propertyConfig = config.getInitParameter("propertyConfig");
		System.out.println("propertyConfig = " + propertyConfig);
		
		String realFolder = config.getServletContext().getRealPath("/WEB-INF");
		System.out.println(realFolder);
		//위치를 얻어와
		String realPath = realFolder + "/" + propertyConfig;
		//위치와 이름을 연결
		System.out.println("realPath = " + realPath);
		
		
		FileInputStream fin = null;
		Properties properties = new Properties();
		
		
		try {
	         fin = new FileInputStream(realPath);
	                  
	         properties.load(fin);
	         System.out.println("properties = "+properties);
	         
	      } catch (IOException e) {
	         e.printStackTrace();
	      }finally{
	         try {
	            fin.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      System.out.println();
	      
	      Iterator it = properties.keySet().iterator();
	      while(it.hasNext()) {
	         String key = (String)it.next();
	         System.out.println("key = "+key);
	         
	         String className = properties.getProperty(key);
	         System.out.println("className = "+className);
	         
	         try {
	            Class<?> classType = Class.forName(className);
	            Object ob = classType.newInstance();
	            
	            System.out.println("ob = "+ob);
	            
	            map.put(key, ob);
	            
	         } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	         } catch (InstantiationException e) {
	            e.printStackTrace();
	         } catch (IllegalAccessException e) {
	            e.printStackTrace();
	         } catch (IllegalArgumentException e) {
	            e.printStackTrace();
	         } 
	         
	         System.out.println();
	      }//while
	}
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println();
		
		//한글처리
		if(request.getMethod().equals("POST"))
			request.setCharacterEncoding("UTF-8");
		
		//요청이 들어왔을 때 - http://localhost:8080/mvcmember/member/writeForm.do 원하는 부분만 잘라낸다 추출
	      String category = request.getServletPath();
	      System.out.println("category = "+category); //member/writeForm.do
	      
	      CommandProcess com = (CommandProcess)map.get(category); //member.service.WriteFormService
	      String view = null;
	      
	      try {
	         view = com.requestPro(request, response); //"/member/writeForm.jsp"
	      } catch (Throwable e) {
	         e.printStackTrace();
	      }
	      
	      //forward
	      RequestDispatcher dispatcher = request.getRequestDispatcher(view);//상대번지
	      System.out.println("view = " +view);
	      System.out.println("dispatcher = " +dispatcher);
	      dispatcher.forward(request, response);//제어권 넘기기
	      
	}

}
