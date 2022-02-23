package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class MemerJoin
 */
@WebServlet("/MemberJoin.do")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Post일땐 무조건 제일먼저 인코딩 해줘야함!
		request.setCharacterEncoding("UTF-8");
		
		// 0. 클라이언트 요청시 전송 데이터 받기 - mem_id, mem_name , mem_pass ........
			// 9개의 데이터 받아서 vo에 setter이용해서 저장.
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap()); 
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// name이 다를경우 이렇게 다 적어줘야함. 같다면 위처럼 하면 된다.
		/*vo.setMem_id(request.getParameter("mem_id"));
		vo.setMem_name(request.getParameter("mem_name"));
		vo.setMem_bir(request.getParameter("mem_bir"));
		vo.setMem_pass(request.getParameter("mem_pass"));
		vo.setMem_hp(request.getParameter("mem_hp"));
		vo.setMem_mail(request.getParameter("mem_mail"));
		vo.setMem_zip(request.getParameter("mem_zip"));
		vo.setMem_add1(request.getParameter("mem_add1"));
		vo.setMem_add2(request.getParameter("mem_add2"));*/
		
		// 1. service 객체 얻기
		IMemberService service = MemberServiceImpl.getService();
		// 2. service메소드 호출하기 - 결과값 받기 - 입력한  id
		String mem_id = service.insertMember(vo);
		// 3. 결과값을  request에 저장
		request.setAttribute("vo", mem_id);
		// 4. jsp로 포워드
		request.getRequestDispatcher("1005/insert.jsp").forward(request, response);
		
		
	}

}
