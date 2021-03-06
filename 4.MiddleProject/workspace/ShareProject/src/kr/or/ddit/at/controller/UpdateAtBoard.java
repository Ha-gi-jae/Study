package kr.or.ddit.at.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.at.service.IAtchFileService;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class UpdateAt
 */
@WebServlet("/UpdateAt.do")
public class UpdateAtBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAtBoard() {
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
		
		if(mem_id==null) {
			mem_id=(String)session.getAttribute("admin_id");
		}
		
		BoardVO bv = new BoardVO();

		int num = 0;
		if(((FileUploadRequestWrapper)request).isMultipartContent()) {
			
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			Map<String, String[]> parameterMap = ((FileUploadRequestWrapper)request).getParameterMap();
			
			bv.setAdminboard_id(Integer.parseInt(parameterMap.get("adminboard_id")[0]));
			bv.setBoard_title_id(parameterMap.get("board_title_id")[0]);
			bv.setBoard_title(parameterMap.get("board_title")[0]);
			bv.setBoard_content(parameterMap.get("board_content")[0]);
			bv.setMem_id(mem_id);
			
			IBoardService service = BoardServiceImpl.getInstance();
			num = service.updateBoard(bv);
			
			AtVO fileVO = new AtVO();
			
			Map<String, FileItem[]> fileItemMap = ((FileUploadRequestWrapper)request).getFileItemMap();
			
			fileVO.setAdminboard_id(bv.getAdminboard_id());
			
			if(fileItemMap.size() > 0) {
				try {
					fileVO = fileService.updateAtchFileList(fileItemMap, fileVO);
					
					System.out.println(fileVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		request.setAttribute("adminboard_id", bv.getAdminboard_id());
		
		request.getRequestDispatcher("/WEB-INF/whole/at_jsp/UpdateBoard.jsp").forward(request, response);
	}

}
