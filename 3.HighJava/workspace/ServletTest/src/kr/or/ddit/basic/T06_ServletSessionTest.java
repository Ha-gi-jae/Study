package kr.or.ddit.basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class T06_ServletSessionTest extends HttpServlet {
	//사용자 별로 구분하기 쉬운건 세션. 근데 이게 다 메모리임. 효율적으로 하려면? 
/*
 *  세션(HttpSession) 객체에 대하여...
 *  
 *   - 세션을 통해서 사용자(브라우저)별로 구분하여 정보를 관리할 수 있다. (세션ID이용)
 *   - 쿠키를 사용할 때보다 보안이 향상된다. (정보가 서버에 저장되기 때문에...)
 *   
 *   - 세션객체를 가져오는 방법
 *     HttpSession session = request.getSession(boolean값);
 *     boolean 값 : true인 경우 => 세션객체가 존재하지 않으면 새로 생성한다.
 *                 false인 경우 => 세션객체가 존재하지 않으면 null을 리턴한다.
 *   
 *   - 세션 삭제 처리 방법
 *    1. invalidate() 메서드 호출
 *    2. setMaxInactiveInterval(int interval) 호출
 *       => 일정시간(초)동안 요청이 없으면 세션 객체 삭제됨.
 *    3. web.xml에 <session-config> 설정하기 (분단위)
 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션을 가져오는데 없으면 새로 생성한다.
		HttpSession session = req.getSession(true);
		
		// 생성시간 가져오기
		Date createTime = new Date(session.getCreationTime());
		
		// 마지막 접근시간 가져오기
		Date lastAccessTime = new Date(session.getLastAccessedTime());
		
		String title = "재방문을 환영합니다.";
		int visitCount = 0; // 방문 횟수
		String userId = "PC-06"; // 사용자ID
		
		if(session.isNew()) { // 세션이 새로 만들어졌는지 확인...
			title = "처음 방문을 환영합니다.";
			session.setAttribute("userId", userId);
		}else {
			visitCount = (Integer) session.getAttribute("visitCount");
			visitCount++;
			userId = (String) session.getAttribute("userId");
		}
		System.out.println("visitCount : " + visitCount);
		session.setAttribute("visitCount", visitCount);
		
		// 세션 지우는 방법 1
//		session.invalidate(); // 세션삭제는 언제? 로그아웃같은 경우.
		// 세션 지우는 방법 2
//		session.setMaxInactiveInterval(30); // 뒤에 초를 줘서 그 시간이 지나면 삭제함.
		
		
		// 응답헤더에 인코딩 및 content type 설정하기 
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		
		PrintWriter out = resp.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>" + title + "</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1 align = \"center\">" + title + "<h1>" );
		out.println("<h2 align = \"center\">세션정보</h2>");
		out.println("<table border = \"1\" align = \"center\">");
		out.println("<tr bgcolor=\"orange\">");
		out.println("<th> 구분 </th><th> 값 </th>");
		out.println("</tr>");
		out.println("<tr><td>세션ID</td><td>" + session.getId() +"</td></tr>");
		out.println("<tr><td>생성시간</td><td>" + createTime +"</td></tr>");
		out.println("<tr><td>마지막 접근시간</td><td>" + lastAccessTime +"</td></tr>");
		out.println("<tr><td>UserId</td><td>" + userId +"</td></tr>");
		out.println("<tr><td>방문횟수</td><td>" + visitCount +"</td></tr>");
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
