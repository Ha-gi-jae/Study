package kr.or.ddit.comp.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.comp.service.CompServiceImpl;
import kr.or.ddit.comp.service.ICompService;
import kr.or.ddit.comp.vo.CompVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class InsertComp
 */
@WebServlet("/InsertComp.do")
public class InsertComp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertComp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		CompVO vo = new CompVO();
		
		int num = 0;
		
		if(((FileUploadRequestWrapper)request).isMultipartContent()) {
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			Map<String, String[]> parameterMap = ((FileUploadRequestWrapper)request).getParameterMap();
			
			vo.setComp_name(parameterMap.get("comp_name")[0]);
			vo.setComp_info(parameterMap.get("comp_info")[0].replaceAll("\n", "<br>"));
			vo.setComp_req(parameterMap.get("comp_req")[0].replaceAll("\n", "<br>"));
			
			ICompService service = CompServiceImpl.getInstance();
			num = service.insertComp(vo);
			
			AtVO fileVO = new AtVO();
			
			Map<String, FileItem[]> fileItemMap = ((FileUploadRequestWrapper)request).getFileItemMap();
			
			
			fileVO.setAdminboard_id(num);
			
			if(fileItemMap.size() > 0) {
				try {
					fileVO = fileService.saveAtchFileList(fileItemMap);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		request.setAttribute("adminboard_id", num);
		
		request.getRequestDispatcher("/WEB-INF/whole/comp_jsp/InsertBoard.jsp").forward(request, response);
	}

}
