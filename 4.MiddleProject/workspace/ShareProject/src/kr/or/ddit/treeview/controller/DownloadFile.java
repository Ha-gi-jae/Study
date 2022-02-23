package kr.or.ddit.treeview.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadFile
 */
@WebServlet("/DownloadFile.do")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String path = "D:/D_Other/root";
		String fileName = (String) request.getParameter("path");
		String downFile= path + "/" + fileName;
		fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" 
		+ URLEncoder.encode(fileName, "utf-8").replaceAll("\\+", "%20"));
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(new File(downFile)));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		int c = -1;
		while ((c = bis.read()) != -1) {
			bos.write(c);
		}
		bis.close();
		bos.close();
	}
}
