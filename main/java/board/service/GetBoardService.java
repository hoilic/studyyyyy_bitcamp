package board.service;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class GetBoardService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		System.out.println("seq = "+seq);
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		//조회수
		boardDAO.setHit(seq);
		
		BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		//BoardDTO --> JSON 변환
		JSONObject json = new JSONObject();
		json.put("seq", boardDTO.getSeq());
		json.put("id", boardDTO.getId());
		json.put("name", boardDTO.getName());
		json.put("email", boardDTO.getEmail());
		json.put("subject", boardDTO.getSubject());
		json.put("content", boardDTO.getContent());
		json.put("ref", boardDTO.getRef());
		json.put("lev", boardDTO.getLev());
		json.put("step", boardDTO.getStep());
		json.put("pseq", boardDTO.getPseq());
		json.put("reply", boardDTO.getReply());
		json.put("hit", boardDTO.getHit());
		json.put("logtime", sdf.format(boardDTO.getLogtime()));
		

		//세션
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		
		//응답
		request.setAttribute("memId", memId);
		request.setAttribute("json", json);
		
		return "/board/getBoard.jsp";
	}

}
