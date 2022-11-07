package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 * //데이터 
		 * HttpSession session = request.getSession(); // 세션값을 가져오기 위한 작업 
		 * String id = (String)session.getAttribute("memId");
		 * 
		 * 
		 * // DB연결 해서 SQL 실행한 결과 가져온것 
		 * MemberDAO memberDAO = MemberDAO.getInstance();
		 * MemberDTO memberDTO = memberDAO.updateForm(id);
		 * 
		 * //응답 request.setAttribute("memberDTO", memberDTO);
		 * request.setAttribute("display", "/member/updateForm.jsp");
		 * 
		 * return "/index.jsp";
		 */
		request.setAttribute("display", "/member/updateForm2.jsp");
		return "/index.jsp";
	}

}


		
		
	
