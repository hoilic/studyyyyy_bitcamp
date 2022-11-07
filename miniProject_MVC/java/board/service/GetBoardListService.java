package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		
		int pg = Integer.parseInt(request.getParameter("pg"));	
		int endNum = pg*7;
		int startNum = endNum -6;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum); 
		map.put("endNum", endNum);
		
		//DB 
		BoardDAO boardDAO = BoardDAO.getInstance(); 
		List<BoardDTO> list = boardDAO.boardList(map);
		
		//List -> JSON변환 
		JSONObject json = new JSONObject();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		if(list != null) {
			JSONArray array = new JSONArray();
				for(BoardDTO boardDTO : list ) {
					JSONObject temp = new JSONObject();
					temp.put("seq", boardDTO.getSeq());
					temp.put("id", boardDTO.getId());
					temp.put("name", boardDTO.getName());
					temp.put("email", boardDTO.getEmail());
					temp.put("subject", boardDTO.getSubject());
					temp.put("content", boardDTO.getContent());
					temp.put("ref", boardDTO.getRef());
					temp.put("lev", boardDTO.getLev());
					temp.put("step", boardDTO.getStep());
					temp.put("pseq", boardDTO.getPseq());
					temp.put("reply", boardDTO.getReply());
					temp.put("hit", boardDTO.getHit());
					temp.put("logtime", sdf.format(boardDTO.getLogtime()));
					
					array.add(temp);
				}//for
				
				json.put("list", array);
		}//if
		
		//페이징 처리
		int totalA = boardDAO.getTotalA();
		
		BoardPaging boardPaging = new BoardPaging(); 
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3); 
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA); 
		boardPaging.makePagingHTML();
		
		json.put("pagingHTML", boardPaging.getPagingHTML()+""); //StringBuffer --> String 로 변환
		
		//세션
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		json.put("memId", memId);
		
		System.out.println(json);
		
		request.setAttribute("pg", pg);
		request.setAttribute("json", json);
		
		/*
		 * request.setAttribute("pg", pg); request.setAttribute("id", id);
		 * request.setAttribute("json", json);
		 */
		
		
		
		return "/board/getBoardList.jsp";
	}

}
