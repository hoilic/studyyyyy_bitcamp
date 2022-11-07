package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String subject = request.getParameter("subject"); // getParameter 는 return 을 String 으로 해준다.
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession(); // 세션값을 가져오기 위한 작업
		String name = (String) session.getAttribute("memName");
		String id = (String) session.getAttribute("memId");
		String email = (String) session.getAttribute("memEmail");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardWrite(map); 
		
		return "/board/boardWrite.jsp";
	}

}
