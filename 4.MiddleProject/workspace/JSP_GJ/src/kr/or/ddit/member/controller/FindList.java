	package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/findlist")
public class FindList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MemberVO> list = null;
		
		String searchType_= request.getParameter("searchType");
		String keyWord_= request.getParameter("keyWord");
		
		String searchType = "searchType";
		if(searchType_ != null) searchType = searchType_;
		
		String keyWord = "";
		if (keyWord_ != null) query = keyWord_;
		
		IMemberService service = MemberServiceImpl.getService();
		
		if(searchType.equals("name")) {
			list = service.selectName(keyWord);
		}
		if(searchType.equals("id")) {
			list = service.selectId(keyWord);
		}
		if(searchType.equals("phone")) {
			list = service.selectPhone(keyWord);
		}
		if(searchType.equals("email")) {
			list = service.selectEmail(keyWord);
		}
		
		request.setAttribute("title", searchType);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/FindList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
