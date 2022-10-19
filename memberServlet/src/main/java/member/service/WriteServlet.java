package member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


@WebServlet("/WriteServlet")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost 라는 메소드
		request.setCharacterEncoding("UTF-8"); //post방식
		//데이터 form 에 입력되는 데이터들을 가져오기 위한것
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO memberDTO = new MemberDTO();
		// 가져온 데이터를 활용하기 위해서 MemberDTO 클래스를 만들었다.
		memberDTO.setName(name);
		// memberDTO 는 MemberDTO 클래스의 주소값 , new 를 하는 이유는 메모리의 공간을 할당하기 위해
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setGender(gender);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setZipcode(zipcode);
		memberDTO.setAddr1(addr1);
		memberDTO.setAddr2(addr2);
		
		//DB
		//MemberDAO memberDAO = MemberDAO.getInstance();
		//싱글톤 한다 , MemberDAO.getInstance(); 는  MemberDAO의 주소값
		
		int su =MemberDAO.getInstance().memberWrite(memberDTO);
		
		//int su = memberDAO.memberWrite(memberDTO);
		
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); //생성
		
		out.println("<html>");	
		out.println("<body>");
		if(su == 1)
			out.println("회원가입 성공");
		else
			out.println("회원가입 실패");
		out.println("</body>");
		out.println("</html>");
	}

}
/*
 싱글톤
 - 최초 한 번만 메모리를 할당하고 인스턴스를 만들어 사용하는 디자인 패턴이다.
 */
