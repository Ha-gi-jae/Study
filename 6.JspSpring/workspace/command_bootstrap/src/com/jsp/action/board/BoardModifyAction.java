package com.jsp.action.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.BoardModifyCommand;
import com.jsp.controller.XSSHttpRequestParameterAdapter;
import com.jsp.dto.BoardVO;
import com.jsp.service.BoardService;

public class BoardModifyAction implements Action {

	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		String url = "redirect:/board/detail.do?from=modify&bno="+request.getParameter("bno");
		
		try {
			BoardModifyCommand boardCMD = (BoardModifyCommand) XSSHttpRequestParameterAdapter.execute(request, BoardModifyCommand.class, true);
			
			BoardVO board = boardCMD.toBoardVO();
			board.setContent(request.getParameter("content"));
			
			boardService.modify(board);
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendError(response.SC_INTERNAL_SERVER_ERROR);
			url = null;
		}
		
		
		return url;
	}

}
