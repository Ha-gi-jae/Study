package kr.or.ddit.clat.controller;

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
import kr.or.ddit.member.vo.MemVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class UpdateHWFile
 */
@WebServlet("/UpdateHWFile.do")
public class UpdateHWFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateHWFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MemVO mv = (MemVO) session.getAttribute("mem");

		int num = 0;
		if (((FileUploadRequestWrapper) request).isMultipartContent()) {

			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			Map<String, String[]> parameterMap = ((FileUploadRequestWrapper) request).getParameterMap();
			Map<String, FileItem[]> fileItemMap = ((FileUploadRequestWrapper) request).getFileItemMap();
			String adminboard_id = parameterMap.get("adminboard_id")[0];
			AtVO vo = new AtVO();
			if (fileItemMap.size() > 0) {
				// 처음으로 하는 과제 등록
				if (adminboard_id != null) {
					vo.setAdminboard_id(Integer.parseInt(adminboard_id));
					vo.setFile_cn(mv.getMem_name());
					try {
						System.out.println("selectAtchId 시작");
						int atch_id = fileService.selectAtchId(vo.getAdminboard_id());
						System.out.println("selectAtchId 끝");
						if (atch_id > 0) {
							vo.setAtch_file_id(atch_id);
							System.out.println("2" + vo.getAtch_file_id());
							fileService.uploadFile(fileItemMap, vo);
						} else {
							System.out.println("insertAtchId 시작");
							fileService.insertAtchId(Integer.parseInt(adminboard_id));
							System.out.println("insertAtchId 끝");
							fileService.uploadFile(fileItemMap, vo);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					// 다시 올리는 과제
				}
			}
			else {
				System.out.println("2.아무것도 안됨");
			}
		}
		request.setAttribute("adminboard_id", num);
		request.getRequestDispatcher("/WEB-INF/whole/at_jsp/UpdateBoard.jsp").forward(request, response);
	}
}