package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		
		//getParameter 는 post 방식으로 데이터를 가져온다. Post 방식은 return 값이 다 String 이다.
		String subject = request.getParameter("subject"); // getParameter 는 return 을 String 으로 해준다.
		String content = request.getParameter("content");
		
		String name = "hong"; // getAttribute 는 return 을 Object 로 해준다. 그래서 강제 형변환 해야한다.
		String id = "hihi";
		String email = "hoil2512";
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("hihi", id);
		map.put("hong", name);
		map.put("hoil2512", email);
		
		map.put("subject", subject);
		map.put("content", content);
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardWrite(map); 
		
		return "/board/boardWriteForm.jsp";
	}

}
