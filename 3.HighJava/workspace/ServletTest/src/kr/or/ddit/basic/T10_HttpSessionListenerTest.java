package kr.or.ddit.basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class T10_HttpSessionListenerTest extends HttpServlet { // 바인딩도 여기서 같이함.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// HttpSession 객체 생성 및 소멸관련 테스트
		HttpSession session = req.getSession(); // default가 true
		session.setAttribute("ATTR1", "속성1");
		session.setAttribute("ATTR1", "속성11");
		session.setAttribute("ATTR2", "속성2");
//		session.setAttribute("ATTR3", "속성3");
//		session.setAttribute("ATTR4", "속성4");
//		session.setAttribute("ATTR5", "속성5");
		
		session.removeAttribute("ATTR1");
		
		
		//바인딩 부분.
		// HTTP 세션 영역 내에 HttpSessionBindingListener를 구현한 객체가 바인딩 되면 호출됨.
		MySessionBindingListener bindingListener = new MySessionBindingListener();
		
		session.setAttribute("obj", bindingListener);
		session.removeAttribute("obj");
		
		///////////////////////////////////////////////////////////////////////
		
		// 세션 삭제 
		session.invalidate();  // 세션을 만들고 지우는 과정에서 남은 Attribute도 같이 지워진다.
//		session.setMaxInactiveInterval(0);
	}
	
	/**
	 * doPost를 안만들면 ? 예외가 발생. Response status code가 405가 나옴.
	 * 아예 안쓰면 ? 기능조차 실행을 하지 않기때문에 예외가 발생된다.
	 * 만약 비어있다면? Post 기능은 실행되나 아무것도 하지않음.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
		
	}
}
