package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemVO;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheck() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		MemVO mv = new MemVO();
		
		String mem_id=request.getParameter("id");
		String mem_pass=request.getParameter("pw");
		
		if(mem_id.equals("admin")) {
			AdminVO av = new AdminVO();
			System.out.println("1111111111111111111111111111111111111");
			String admin_id=mem_id;
			String admin_pw=mem_pass;
			session.setAttribute("admin_id", admin_id);
			session.setAttribute("mem_id", "admin");
			
			System.out.println("로그인시 session체크(admin):"+session.getAttribute("admin_id"));
			System.out.println("로그인시 session체크(member):"+session.getAttribute("mem_id"));
			
			av.setAdmin_id(admin_id);
			av.setAdmin_pw(admin_pw);
			
			IAdminService adservice = AdminServiceImpl.GetService();
			
			AdminVO av2= adservice.adCheck(av);
			
			request.setAttribute("admin", av2);
			
			request.getRequestDispatcher("/WEB-INF/whole/admin_jsp/adcheck.jsp").forward(request, response);
			
		}else {
			session.setAttribute("mem_id", mem_id);
			
			System.out.println("session(회원정보):"+session.getAttribute("mem_id"));
			
			//System.out.println(mem_id);
			//System.out.println(mem_pass);
			
			mv.setMem_id(mem_id);
			mv.setMem_pass(mem_pass);
			
			
			IMemberService service = MemberServiceImpl.getInstance();
			
			MemVO mv2 = service.idCheck(mv);
			
			if(mv2 ==null) {
				
				service.memLock(mv);
			}else {
				service.memReset(mv);
				session.setAttribute("mem", service.memAll(mv2.getMem_id()));
			}
			
			
			int chk = service.chkCheck(mem_id);
			
			
			System.out.println(chk);
			
			request.setAttribute("check", mv2);
			request.setAttribute("count", chk);
			request.getRequestDispatcher("/WEB-INF/whole/member_jsp/logcheck.jsp")
			.forward(request, response);
						
		}
		
		
	}

}
