package kr.or.ddit.comp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.comp.service.CompServiceImpl;
import kr.or.ddit.comp.service.ICompService;
import kr.or.ddit.comp.vo.CompVO;

/**
 * Servlet implementation class SelectCompBoard
 */
@WebServlet("/SelectCompBoard.do")
public class SelectCompBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCompBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("board_id"));
		
		ICompService service =  CompServiceImpl.getInstance();
		int chk = service.countView(num);
		CompVO vo = service.selectOne(num);
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		IAtchFileService fileservice = AtchFileServiceImpl.getInstance();
		int atch_file_id = fileservice.selectAtchId(num);
		
		if(atch_file_id > 0) {
			AtVO atVO = new AtVO();
			
			atVO.setAtch_file_id(atch_file_id);
			
			List<AtVO> fileList = fileservice.getAtchFileList(atVO);
			
			request.setAttribute("fileList", fileList);
		}
		
		request.setAttribute("mem_id", mem_id);
		
		request.setAttribute("cv", vo);
		
		request.getRequestDispatcher("/WEB-INF/whole/comp_jsp/SelectComp.jsp").forward(request, response);
	}

}
