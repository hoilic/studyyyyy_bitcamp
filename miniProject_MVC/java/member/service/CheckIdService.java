package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			
		//데이터
		String id = request.getParameter("id"); //post방식

		//DB
		MemberDAO memberDAO = MemberDAO.getInstance(); //싱글톤
		boolean exist = memberDAO.isExistId(id); //아이디가 있으면 true - 사용 불가능, 없으면 false- 사용 가능

		//응답
		request.setAttribute("id", id);
		//request forward 되었기 때문에 데이터를 실어서 보내므로 데이터가 연결된다.
		
		if(exist) { //if(exist == true)
			return "/member/checkIdFail.jsp"; //사용 불가능
		}else{ 
			return "/member/checkIdOk.jsp"; //사용 가능
			}

	}

}
