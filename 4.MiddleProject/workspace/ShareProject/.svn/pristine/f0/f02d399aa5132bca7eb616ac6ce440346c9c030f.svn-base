package kr.or.ddit.treeview.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.log4j.Logger;

import kr.or.ddit.at.service.AtchFileServiceImpl;
import kr.or.ddit.util.FileUploadRequestWrapper;

/**
 * Servlet implementation class uploadFIle
 */
@WebServlet("/UploadFile.do")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(AtchFileServiceImpl.class);
	int i = 0;
	String fileName = "";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		i = 0;
		int chk = 0;
		String result = (String) request.getParameter("result");
		fileName = result;
		String path = (String) request.getParameter("path");
		path = path.substring(0, path.lastIndexOf("/"));
		String flag = (String) request.getParameter("flag");

		File file = new File("D:/D_Other/root/", path);

		if (flag.equals("create")) {
			fileName = "NewFolder";
			file = new File(file, "/" + fileName);
			file = fileExists(file);
			if (file.mkdir())
				chk = 1;
			System.out.println("생성 완료");
		} else if (flag.equals("name")) {
			path = path.substring(0, path.lastIndexOf("/")) + "/" + fileName;
			File fileNew = new File("D:/D_Other/root/", path);
			if (!fileNew.exists()) {
				file.renameTo(fileNew);
				chk = 1;
			}
			System.out.println("이름 수정 완료");
		} else if (flag.equals("delete")) {
			if(file.isDirectory())
				delete(file);
			file.delete();
			chk = 1;
			System.out.println("삭제 완료");
		}
		request.setAttribute("chk", chk);
		request.setAttribute("fileName", fileName);

		request.getRequestDispatcher("/WEB-INF/whole/ShareFile/UpdateFile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int chk = 0;
		fileName = "";
		String path = request.getParameter("filePath");
		System.out.println(path);
		System.out.println(path);

		String uploadPath = "D:/D_Other/root/" + path;

		Map<String, FileItem[]> fileItemMap = ((FileUploadRequestWrapper)request).getFileItemMap();
		if(fileItemMap.size() > 0) {
			for(FileItem[] itemArr : fileItemMap.values()) {
				for(FileItem item : itemArr) {
					
					logger.info("item.getName() => " + item.getName());
					
					fileName = item.getName();
					String saveFilePath = uploadPath + File.separator + fileName;
					File storeFile = new File(saveFilePath);
					
					try {
						item.write(storeFile);// 업로드 파일 저장
					} catch (Exception e) {
						e.printStackTrace();
					} 
					
					// 임시 업로드 파일 삭제하기
					item.delete();
				}
			}
		}
		chk = 1;
		
		request.setAttribute("fileName", fileName);
		request.setAttribute("chk", chk);
		request.getRequestDispatcher("/WEB-INF/whole/ShareFile/UpdateFile.jsp").forward(request, response);
	}

	private File fileExists(File file) {
		if (file.exists()) {
			fileName = "NewFolder " + i++;
			String path = file.getPath().substring(0, file.getPath().lastIndexOf("\\")) + "/" + fileName;
			file = new File(path);
			file = fileExists(file);
		}

		return file;
	}

	private void delete(File file) {
		File[] fileList = file.listFiles();
		if (fileList.length > 0) {
			for (int i = 0; i < fileList.length; i++) {
				if (fileList[i].isDirectory()) {
					delete(fileList[i]);
				}
				fileList[i].delete();
			}
		}
	}
}
