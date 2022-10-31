package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;


public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		 * //데이터 String pg = request.getParameter("pg"); //post방식 String seq =
		 * request.getParameter("seq"); //post방식
		 * 
		 * request.setAttribute("pg", pg); 
		 * request.setAttribute("seq", seq);
		 */
				
		return "/board/boardView.jsp";
	}

}
