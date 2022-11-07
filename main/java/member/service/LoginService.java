package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// DB연결 해서 SQL 실행한 결과 가져온것
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.memberLogin(id, pwd); 
		
		//응답
		if(memberDTO != null){
			HttpSession session = request.getSession(); //세션 생성
			session.setAttribute("memName", memberDTO.getName()); // session 안에 "memName" 로 이름을 등록한다.
			session.setAttribute("memId", id); // session 안에 "memName" 로 이름을 등록한다.
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2()); // session 안에 "memName" 로 이름을 등록한다.
			return "/member/loginOk.jsp";
		}
		else {
			return "/member/loginFail.jsp";			
		}
		
	}

}
