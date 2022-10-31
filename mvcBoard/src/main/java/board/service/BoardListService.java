package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		request.setCharacterEncoding("UTF-8");//post방식 가져온 데이터를 한글처리 해서 읽고
	 	
		//데이터
		
		//페이징 처리 - 1페이지당 5개씩
	 	int pg = Integer.parseInt(request.getParameter("pg")); 
		 //getParameter 는 사용자가 HTML 페이지에 입력한 데이터를 가져올때 사용
		int endNum = pg*5;
		int startNum = endNum-4;
		
		
		
		//데이터를 Map 으로 담음	
	  	Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum); 
			 

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		// 싱글톤 은 getInstance() 메소드에 의해 한번만 할당된 객체의 주소값을 참조
		// 반면 new 연산자는 객체를 생성할때 마다 메모리에 주소값을 새로 만든다
		
		List<BoardDTO> list = boardDAO.boardList(map);
		/*
		1. boardDAO 에 boardList 매소드에 map 에 담은 data 를 SQL 실행시키고
		2. list 의 형태로 return 값 받아와라
		*/
		
		//세션 톰캣에 저장된 사람들이 입력한 정보id 를 가져오기 위한 작업
		String id = "hihi"; 
		
		//페이징처리
		
		int totalA = boardDAO.getTotalA();
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		

		int totalPage =(totalA + 4)/5; 
			


		request.setAttribute("list", list);
		request.setAttribute("id", id);
		request.setAttribute("PagingHTML", boardPaging.getPagingHTML());
		
		return "/board/boardList.jsp";
	}

}
