package kr.or.ddit.treeview.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test
 */
@WebServlet("/TreeView.do")
public class TreeView extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TreeView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> nodeList = new ArrayList<>();
		int count = 0;
		// 서버에서 저장 공간
		String pathName = "D:/D_Other/root/";
				//전체 공유
		String folderName = "public";
		File path = new File(pathName + folderName);
		if(!path.exists()) {
			System.out.println("폴더 생성");
			if(path.mkdirs())
				System.out.println("성공");
			else
				System.out.println("실패");
			
			
		}
		nodeList.add("node"+ count + " = tree.createNode('node','"+ folderName +"',false,'/ShareProject/img/star.png',null,null,'context1');");
		if(path.isDirectory()) {
			folder(path, count, nodeList);
		}
		request.setAttribute("nodeList", nodeList);
		request.setAttribute("path", pathName);
		request.setAttribute("folderName", folderName);
		
		request.getRequestDispatcher("/WEB-INF/whole/ShareFile/TreeView.jsp").forward(request, response);
	}
	
	public void folder(File folder, int count, List<String> nodeList) {
		String parant = "node" + count;
		String nodeName = "node" + ++count;
		
		File[] fileList = folder.listFiles();
		if (fileList.length > 0) {
			for (int i = 0; i < fileList.length; i++) {
				String name = fileList[i].getName();
				
				if(fileList[i].isDirectory()) {
					nodeList.add(nodeName + " = " + parant + ".createChildNode('" + name + "', false, '/ShareProject/img/folder.png',null,'context1');");
					folder(fileList[i], count, nodeList);
				} else {
					nodeList.add(nodeName + " = " + parant + ".createFile('" + name + "', false, '/ShareProject/img/file.png',null,'context1');");
				}
			}
		}
	}
}
